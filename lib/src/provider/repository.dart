import 'package:lafyuu/src/database/database_helper.dart';
import 'package:lafyuu/src/database/database_helper_card.dart';
import 'package:lafyuu/src/model/api/product_list_model.dart';
import 'package:lafyuu/src/model/http_result.dart';
import 'package:lafyuu/src/provider/app_provider.dart';

class Repository {
  final _provider = AppProvider();
  final dataBaseFav = DatabaseHelper();
  final dataBaseCard = DatabaseHelperCard();

  ///database fav
  Future<List<ProductListResult>> getProductFav() =>
      dataBaseFav.getProductFav();

  Future<int> deleteProductFav(int id) => dataBaseFav.deleteProductFav(id);

  Future<int> saveProductFav(ProductListResult product) =>
      dataBaseFav.saveProductFav(product);

  ///database cart
  Future<int> saveProductCard(ProductListResult card) =>
      dataBaseCard.saveProductCard(card);

  Future<List<ProductListResult>> getProductCard() =>
      dataBaseCard.getProductCard();

  Future<int> deleteProductCard(int id) => dataBaseCard.deleteProductCard(id);

  Future<int> updateProductCard(ProductListResult card) =>
      dataBaseCard.updateProductCard(card);

  ///API
  Future<HttpResult> getProductItem(int id) => _provider.getProductItem(id);

  Future<HttpResult> getSuperFlash() => _provider.getSuperFlash();

  Future<HttpResult> getSuperFlashItem(int id) =>
      _provider.getSuperFlashItem(id);

  Future<HttpResult> getCategory() => _provider.getCategory();

  Future<HttpResult> getProductList(
    String flashSale,
    String megaSale,
    String home,
  ) =>
      _provider.getProductList(flashSale, megaSale, home);

  Future<HttpResult> getRecoProduct() => _provider.getRecoProduct();
}
