import 'product_list_model.dart';

class ProductItemModel {
  ProductItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.images,
    required this.specification,
    required this.color,
    required this.size,
    required this.reviewAvg,
    required this.reviewCount,
    required this.review,
    required this.products,
    required this.category,
    this.isFav = false,
  });

  int id;
  String name;
  double price;
  double discountPrice;
  List<ProductImages> images;
  List<Specification> specification;
  List<ProductColor> color;
  List<ProductSize> size;
  double reviewAvg;
  int reviewCount;
  Review review;
  List<ProductListResult> products;
  String category;
  bool isFav;

  factory ProductItemModel.fromJson(Map<String, dynamic> json) =>
      ProductItemModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        price: json["price"] ?? 0.0,
        discountPrice: json["discount_price"] ?? 0.0,
        specification: json["specification"] == null
            ? <Specification>[]
            : List<Specification>.from(
                json["specification"].map((x) => Specification.fromJson(x))),
        images: json["images"] == null
            ? <ProductImages>[]
            : List<ProductImages>.from(
                json["images"].map((x) => ProductImages.fromJson(x))),
        color: json["color"] == null
            ? <ProductColor>[]
            : List<ProductColor>.from(
                json["color"].map((x) => ProductColor.fromJson(x))),
        size: json["size"] == null
            ? <ProductSize>[]
            : List<ProductSize>.from(
                json["size"].map((x) => ProductSize.fromJson(x))),
        reviewAvg: json["review_avg"] ?? 0,
        reviewCount: json["review_count"] ?? 0,
        review: json["review"] == null
            ? Review.fromJson({})
            : Review.fromJson(json["review"]),
        products: json["products"] == null
            ? <ProductListResult>[]
            : List<ProductListResult>.from(
                json["products"].map((x) => ProductListResult.fromJson(x))),
        category: json["category"] ?? "",
      );
}

class ProductColor {
  ProductColor({
    required this.id,
    required this.color,
    this.selected = false,
  });

  int id;
  String color;
  bool selected;

  factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
        id: json["id"] ?? 0,
        color: json["color"] ?? "",
      );
}

class Review {
  Review({
    required this.user,
    required this.text,
    required this.date,
    required this.images,
    required this.start,
  });

  User user;
  String text;
  DateTime date;
  int start;
  List<ProductImages> images;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        user: json["user"] == null
            ? User.fromJson({})
            : User.fromJson(json["user"]),
        text: json["text"] ?? "",
        date: json["date"] == null
            ? DateTime.now()
            : DateTime.parse(json["date"]),
        images: json["images"] == null
            ? <ProductImages>[]
            : List<ProductImages>.from(
                json["images"].map((x) => ProductImages.fromJson(x))),
        start: json["start"] ?? 0,
      );
}

class User {
  User({
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  String firstName;
  String lastName;
  String avatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
        avatar: json["avatar"] ?? "",
      );
}

class ProductSize {
  ProductSize({
    required this.id,
    required this.size,
    this.selected = -1,
  });

  int id;
  String size;
  int selected;

  factory ProductSize.fromJson(Map<String, dynamic> json) => ProductSize(
        id: json["id"] ?? 0,
        size: json["size"] ?? "",
      );
}

class Specification {
  Specification({
    required this.id,
    required this.shown,
    required this.style,
    required this.textmodels,
  });

  int id;
  String shown;
  String style;
  String textmodels;

  factory Specification.fromJson(Map<String, dynamic> json) => Specification(
        id: json["id"] ?? 0,
        shown: json["shown"] ?? "",
        style: json["style"] ?? "",
        textmodels: json["textmodels"] ?? "",
      );
}
