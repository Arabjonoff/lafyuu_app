class RecomendedProductModel {
  RecomendedProductModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<RecoProductResult> results;

  factory RecomendedProductModel.fromJson(Map<String, dynamic> json) =>
      RecomendedProductModel(
        count: json["count"] ?? 0,
        next: json["next"] ?? "",
        previous: json["previous"] ?? "",
        results: json["results"] == null
            ? <RecoProductResult>[]
            : List<RecoProductResult>.from(
                json["results"].map(
                  (x) => RecoProductResult.fromJson(x),
                ),
              ),
      );
}

class RecoProductResult {
  RecoProductResult({
    required this.id,
    required this.image,
    required this.name,
    required this.title,
    required this.product,
  });

  int id;
  String image;
  String name;
  String title;
  int product;

  factory RecoProductResult.fromJson(Map<String, dynamic> json) =>
      RecoProductResult(
        id: json["id"] ?? 0,
        image: json["image"] ?? "",
        name: json["name"] ?? "",
        title: json["title"] ?? "",
        product: json["product"] ?? 0,
      );
}
