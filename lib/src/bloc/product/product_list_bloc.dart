import 'package:lafyuu/src/bloc/home/home_bloc.dart';
import 'package:lafyuu/src/model/api/product_list_model.dart';
import 'package:lafyuu/src/model/http_result.dart';
import 'package:lafyuu/src/provider/repository.dart';
import 'package:rxdart/subjects.dart';

class ProductListBloc {
  final Repository _repository = Repository();
  final _fetchAllProduct = PublishSubject<ProductListModel>();

  Stream<ProductListModel> get allProduct => _fetchAllProduct.stream;
  ProductListModel data = ProductListModel.fromJson({});

  getData(int type) async {
    HttpResult responseFlash = type == 1
        ? (await _repository.getProductList("true", "", ""))
        : (await _repository.getProductList("", "true", ""));
    List<ProductListResult> databaseFav = await _repository.getProductFav();
    List<ProductListResult> databaseCard = await _repository.getProductCard();
    if (responseFlash.isSuccess) {
      data = homeAllBloc.updateData(
        ProductListModel.fromJson(responseFlash.result),
        databaseFav,
        databaseCard,
      );
      _fetchAllProduct.sink.add(data);
    }
  }

  updateFav(ProductListResult productListResult) {
    for (int i = 0; i < data.results.length; i++) {
      if (productListResult.id == data.results[i].id) {
        data.results[i].isFav = productListResult.isFav;
      }
    }
    _fetchAllProduct.sink.add(data);
  }

  updateListCard(ProductListResult productListResult) async {
    List<ProductListResult> databaseCard = await _repository.getProductCard();
    for (int i = 0; i < data.results.length; i++) {
      for (int j = 0; j < databaseCard.length; j++) {
        if (data.results[i].id == databaseCard[j].id) {
          data.results[i].card = databaseCard[j].card;
        }
      }
    }
    _fetchAllProduct.sink.add(data);
  }
}

final productListBloc = ProductListBloc();
