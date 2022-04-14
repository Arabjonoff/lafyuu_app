
import 'package:lafyuu/src/model/api/product_list_model.dart';

class SuperFlashModel {
  SuperFlashModel({
    required this.count,
    required this.results,
  });

  int count;

  List<SuperFlashResult> results;

  factory SuperFlashModel.fromJson(Map<String, dynamic> json) =>
      SuperFlashModel(
        count: json["count"] ?? 0,
        results: json["results"] == null
            ? <SuperFlashResult>[]
            : List<SuperFlashResult>.from(
                json["results"].map(
                  (x) => SuperFlashResult.fromJson(x),
                ),
              ),
      );
}

class SuperFlashResult {
  SuperFlashResult({
    required this.id,
    required this.endDate,
    required this.image,
    required this.name,
    required this.percent,
    required this.product,
  });

  int id;
  DateTime endDate;
  String image;
  String name;
  List<ProductListResult> product;
  int percent;

  factory SuperFlashResult.fromJson(Map<String, dynamic> json) =>
      SuperFlashResult(
        id: json["id"] ?? 0,
        endDate: json["end_date"] == null
            ? DateTime.now()
            : DateTime.parse(
                json["end_date"],
              ),
        image: json["image"] ?? "",
        name: json["name"] ?? "",
        percent: json["percent"] ?? 0,
        product: json["product"] == null
            ? <ProductListResult>[]
            : List<ProductListResult>.from(
                json["product"].map(
                  (x) => ProductListResult.fromJson(x),
                ),
              ),
      );
}
