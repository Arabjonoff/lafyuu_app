import 'package:lafyuu/src/model/all_category/super_flash_model.dart';
import 'package:lafyuu/src/model/api/product_list_model.dart';
import 'package:lafyuu/src/model/http_result.dart';
import 'package:lafyuu/src/provider/repository.dart';
import 'package:rxdart/rxdart.dart';

class SuperSaleBloc {
  final Repository _repository = Repository();
  final _fetchSuperSaleItem = PublishSubject<SuperFlashResult>();

  Stream<SuperFlashResult> get allSuperSale => _fetchSuperSaleItem.stream;

  SuperFlashResult data = SuperFlashResult.fromJson({});

  getSuperSale(int id) async {
    HttpResult response = await _repository.getSuperFlashItem(id);
    if (response.isSuccess) {
      List<ProductListResult> databaseFav = await _repository.getProductFav();
      List<ProductListResult> databaseCard = await _repository.getProductCard();
      data = SuperFlashResult.fromJson(response.result);

      for (int i = 0; i < data.product.length; i++) {
        for (int j = 0; j < databaseFav.length; j++) {
          if (databaseFav[j].id == data.product[i].id) {
            data.product[i].isFav = true;
            break;
          }
        }
        for (int j = 0; j < databaseCard.length; j++) {
          if (databaseCard[j].id == data.product[i].id) {
            data.product[i].card = databaseCard[j].card;
            break;
          }
        }
      }

      _fetchSuperSaleItem.sink.add(data);
    }
  }

  updateFav(ProductListResult productListResult) {
    for (int i = 0; i < data.product.length; i++) {
      if (productListResult.id == data.product[i].id) {
        data.product[i].isFav = productListResult.isFav;
        break;
      }
    }
    _fetchSuperSaleItem.sink.add(data);
  }

  updateCard(ProductListResult productListResult) async {
    List<ProductListResult> databaseCard = await _repository.getProductCard();
    for (int i = 0; i < data.product.length; i++) {
      for (int j = 0; j < databaseCard.length; j++) {
        if (data.product[i].id == databaseCard[j].id) {
          data.product[i].card = databaseCard[j].card;
          break;
        }
      }
    }
    _fetchSuperSaleItem.sink.add(data);
  }
}

final superSaleBloc = SuperSaleBloc();
