import 'package:lafyuu/src/bloc/home/home_bloc.dart';
import 'package:lafyuu/src/model/api/product_item_model.dart';
import 'package:lafyuu/src/model/api/product_list_model.dart';
import 'package:lafyuu/src/model/http_result.dart';
import 'package:lafyuu/src/provider/repository.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc {
  final Repository _repository = Repository();

  final _fetProductItem = PublishSubject<ProductItemModel>();

  Stream<ProductItemModel> get productItemData => _fetProductItem.stream;
  ProductItemModel data = ProductItemModel.fromJson({});

  getProductItem(int id) async {
    HttpResult response = await _repository.getProductItem(id);
    if (response.isSuccess) {
      List<ProductListResult> databaseFav = await _repository.getProductFav();
      List<ProductListResult> databaseCard = await _repository.getProductCard();
      data = ProductItemModel.fromJson(response.result);
      for (int i = 0; i < databaseFav.length; i++) {
        if (databaseFav[i].id == data.id) {
          data.isFav = true;
          break;
        }
      }

      for (int i = 0; i < data.products.length; i++) {
        for (int j = 0; j < databaseFav.length; j++) {
          if (databaseFav[j].id == data.products[i].id) {
            data.products[i].isFav = true;
            break;
          }
        }
        for (int j = 0; j < databaseCard.length; j++) {
          if (databaseCard[j].id == data.products[i].id) {
            data.products[i].card = databaseCard[j].card;
            break;
          }
        }
      }

      _fetProductItem.sink.add(data);
    }
  }

  updateFav(ProductItemModel productItemModel) {
    ProductListResult info = ProductListResult(
      id: productItemModel.id,
      name: productItemModel.name,
      reviewAvg: productItemModel.reviewAvg,
      images: productItemModel.images.first,
      price: productItemModel.price.toInt(),
      discountPrice: productItemModel.discountPrice,
      isFav: productItemModel.isFav,
    );




    homeAllBloc.updateFav(info, 4);
    productItemModel.isFav = !productItemModel.isFav;
    _fetProductItem.sink.add(data);
  }

  updateItemFav(ProductListResult productListResult) {
    for (int i = 0; i < data.products.length; i++) {
      if (productListResult.id == data.products[i].id) {
        data.products[i].isFav = productListResult.isFav;
        break;
      }
    }
    _fetProductItem.sink.add(data);
  }

  updateItemCard(ProductListResult productListResult) async {
    List<ProductListResult> databaseCard = await _repository.getProductCard();
    for(int i = 0; i < data.products.length; i++){
      for(int j = 0; i < databaseCard.length; j++){
        if(data.products[i].id == databaseCard[j].id){
          data.products[i].card = databaseCard[j].card;
          break;
        }
      }
    }
    _fetProductItem.sink.add(data);
  }
}

final productBloc = ProductBloc();
