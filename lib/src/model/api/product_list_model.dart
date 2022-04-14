class ProductListModel {
  ProductListModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<ProductListResult> results;

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      ProductListModel(
        count: json["count"] ?? 0,
        next: json["next"] ?? "",
        previous: json["previous"] ?? "",
        results: json["results"] == null
            ? <ProductListResult>[]
            : List<ProductListResult>.from(
                json["results"].map((x) => ProductListResult.fromJson(x))),
      );
}

class ProductListResult {
  ProductListResult({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.images,
    required this.reviewAvg,
    this.isFav = false,
    this.card = 0,
  });

  int id;
  String name;
  int price;
  double discountPrice;
  ProductImages images;
  double reviewAvg;
  bool isFav;
  int card;

  factory ProductListResult.fromJson(Map<String, dynamic> json) =>
      ProductListResult(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        price: json["price"] ?? 0,
        discountPrice: json["discount_price"] ?? 0.0,
        images: json["images"] == null
            ? ProductImages.fromJson(json[{}])
            : ProductImages.fromJson(json["images"]),
        reviewAvg: json["review_avg"] ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "discount_price": discountPrice,
        "images": images.image,
        "review_avg": reviewAvg,
      };

  Map<String, dynamic> toJsonCard() => {
        "id": id,
        "name": name,
        "price": price,
        "discount_price": discountPrice,
        "images": images.image,
        "review_avg": reviewAvg,
        "cart": card,
      };
}

class ProductImages {
  ProductImages({
    required this.image,
  });


  String image;


  factory ProductImages.fromJson(Map<String, dynamic> json) => ProductImages(
        image: json["image"] ?? "",
      );
}
