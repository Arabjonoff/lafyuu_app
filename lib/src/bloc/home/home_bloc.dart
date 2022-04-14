import 'package:lafyuu/src/bloc/favourite/favourite_bloc.dart';
import 'package:lafyuu/src/bloc/product/product_bloc.dart';
import 'package:lafyuu/src/bloc/product/product_list_bloc.dart';
import 'package:lafyuu/src/bloc/sale/super_sale_bloc.dart';
import 'package:lafyuu/src/model/api/home_all_model.dart';
import 'package:lafyuu/src/model/api/product_list_model.dart';
import 'package:lafyuu/src/model/api/recomended_product_model.dart';
import 'package:lafyuu/src/model/http_result.dart';
import 'package:lafyuu/src/provider/repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final Repository _repository = Repository();

  final _fetchAllHome = PublishSubject<HomeAllModel>();

  final _fetchSaleDatabase = PublishSubject<ProductListResult>();

  Stream<HomeAllModel> get allHomeData => _fetchAllHome.stream;

  Stream<ProductListResult> get saleDataBase => _fetchSaleDatabase.stream;

  HomeAllModel data = HomeAllModel(
    homeSale: ProductListModel.fromJson({}),
    megaSale: ProductListModel.fromJson({}),
    flashSale: ProductListModel.fromJson({}),
    recoProductModel: RecomendedProductModel.fromJson({}),
  );

  getHomeData() async {
    HttpResult responseFlash = await _repository.getProductList("true", "", "");
    List<ProductListResult> dataFav = await _repository.getProductFav();
    List<ProductListResult> dataCard = await _repository.getProductCard();
    if (responseFlash.isSuccess) {
      data.flashSale = updateData(
        ProductListModel.fromJson(responseFlash.result),
        dataFav,
        dataCard,
      );
      _fetchAllHome.sink.add(data);
    }
    HttpResult responseMega = await _repository.getProductList("", "true", "");
    if (responseMega.isSuccess) {
      data.megaSale = updateData(
        ProductListModel.fromJson(responseMega.result),
        dataFav,
        dataCard,
      );
      _fetchAllHome.sink.add(data);
    }

    HttpResult responseRec = await _repository.getRecoProduct();
    if (responseRec.isSuccess) {
      data.recoProductModel = RecomendedProductModel.fromJson(
        responseRec.result,
      );
      _fetchAllHome.sink.add(data);
    }
    HttpResult responseHome = await _repository.getProductList("", "", "true");
    if (responseHome.isSuccess) {
      data.homeSale = updateData(
        ProductListModel.fromJson(responseHome.result),
        dataFav,
        dataCard,
      );
      _fetchAllHome.sink.add(data);
    }
  }

  updateFav(ProductListResult favData, int type) async {
    favData.isFav = !favData.isFav;

    if (favData.isFav) {
      await _repository.saveProductFav(favData);
    } else {
      await _repository.deleteProductFav(favData.id);
    }

    if (type == 2 || type == 4) {
      productListBloc.updateFav(favData);
    }
    if (type == 3 || type == 4) {
      favouriteBloc.allFavourite();
    }
    if (type == 5 || type == 4) {
      superSaleBloc.updateFav(favData);
    }
    if (type == 4) {
      productBloc.updateItemFav(favData);
    }

    for (int i = 0; i < data.homeSale.results.length; i++) {
      if (data.homeSale.results[i].id == favData.id) {
        data.homeSale.results[i].isFav = favData.isFav;
        break;
      }
    }
    for (int i = 0; i < data.megaSale.results.length; i++) {
      if (data.megaSale.results[i].id == favData.id) {
        data.megaSale.results[i].isFav = favData.isFav;
        break;
      }
    }
    for (int i = 0; i < data.flashSale.results.length; i++) {
      if (data.flashSale.results[i].id == favData.id) {
        data.flashSale.results[i].isFav = favData.isFav;
        break;
      }
    }
    _fetchAllHome.sink.add(data);
  }

  updateCard(ProductListResult cardData, bool remove, int type) async {
    if (remove) {
      cardData.card--;
      if (cardData.card == 0) {
        _repository.deleteProductCard(cardData.id);
      } else {
        _repository.updateProductCard(cardData);
      }
    } else {
      cardData.card++;
      if (cardData.card == 1) {
        _repository.saveProductCard(cardData);
      } else {
        _repository.updateProductCard(cardData);
      }
    }
    if (type == 5 || type == 4) {
      superSaleBloc.updateCard(cardData);
    }
    if (type == 3 || type == 4) {
      favouriteBloc.updateFavCard();
    }
    if (type == 4) {
      productBloc.updateItemCard(cardData);
    }
    if (type == 2 || type == 4) {
      productListBloc.updateListCard(cardData);
    }

    for (int i = 0; i < data.flashSale.results.length; i++) {
      if (data.flashSale.results[i].id == cardData.id) {
        data.flashSale.results[i].card = cardData.card;

        break;
      }
    }
    for (int i = 0; i < data.megaSale.results.length; i++) {
      if (data.megaSale.results[i].id == cardData.id) {
        data.megaSale.results[i].card = cardData.card;

        break;
      }
    }
    for (int i = 0; i < data.homeSale.results.length; i++) {
      if (data.homeSale.results[i].id == cardData.id) {
        data.homeSale.results[i].card = cardData.card;

        break;
      }
    }
    _fetchAllHome.sink.add(data);
  }

  ProductListModel updateData(
    ProductListModel dataProduct,
    List<ProductListResult> dataFav,
    List<ProductListResult> dataCard,
  ) {
    for (int i = 0; i < dataProduct.results.length; i++) {
      for (int j = 0; j < dataFav.length; j++) {
        if (dataFav[j].id == dataProduct.results[i].id) {
          dataProduct.results[i].isFav = true;
          break;
        }
      }
      for (int j = 0; j < dataCard.length; j++) {
        if (dataCard[j].id == dataProduct.results[i].id) {
          dataProduct.results[i].card = dataCard[j].card;
          break;
        }
      }
    }
    return dataProduct;
  }
}

final homeAllBloc = HomeBloc();
