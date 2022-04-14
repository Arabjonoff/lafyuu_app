import 'package:lafyuu/src/model/api/product_list_model.dart';

import 'recomended_product_model.dart';

class HomeAllModel {
  ProductListModel flashSale;
  ProductListModel megaSale;
  ProductListModel homeSale;
  RecomendedProductModel recoProductModel;

  HomeAllModel({
    required this.flashSale,
    required this.megaSale,
    required this.homeSale,
    required this.recoProductModel,
  });
}
