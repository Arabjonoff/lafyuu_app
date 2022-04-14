class CategoryModel {
  CategoryModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<CategoryResult> results;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        count: json["count"] ?? 0,
        next: json["next"] ?? "",
        previous: json["previous"] ?? "",
        results: json["results"] == null
            ? <CategoryResult>[]
            : List<CategoryResult>.from(
                json["results"].map(
                  (x) => CategoryResult.fromJson(x),
                ),
              ),
      );
}

class CategoryResult {
  CategoryResult({
    required this.id,
    required this.childs,
    required this.name,
    required this.image,
    required this.genderTypes,
    required this.genderType,
  });

  int id;
  List<CategoryResult> childs;
  String name;
  String image;
  int genderTypes;
  GenderType genderType;

  factory CategoryResult.fromJson(Map<String, dynamic> json) => CategoryResult(
        id: json["id"] ?? 0,
        childs: json["childs"] == null
            ? <CategoryResult>[]
            : List<CategoryResult>.from(
                json["childs"].map(
                  (x) => CategoryResult.fromJson(x),
                ),
              ),
        name: json["name"] ?? "",
        image: json["image"] ?? "",
        genderType: json["gender_type"] == null
            ? GenderType.fromJson({})
            : GenderType.fromJson(json["gender_type"]),
        genderTypes: json["gender_types"] ?? 0,
      );
}

class GenderType {
  GenderType({
    required this.id,
    required this.genderType,
  });

  int id;
  String genderType;

  factory GenderType.fromJson(Map<String, dynamic> json) => GenderType(
        id: json["id"] ?? 0,
        genderType: json["gender_type"] ?? "",
      );
}
