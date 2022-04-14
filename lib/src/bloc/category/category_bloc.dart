import 'package:lafyuu/src/model/all_category/category_model.dart';
import 'package:lafyuu/src/model/all_category/super_flash_model.dart';
import 'package:lafyuu/src/model/http_result.dart';
import 'package:lafyuu/src/provider/repository.dart';
import 'package:rxdart/rxdart.dart';

class CategoryBloc {
  final Repository _repository = Repository();
  final _fetSuperFlash = PublishSubject<SuperFlashModel>();
  final _fetCategory = PublishSubject<CategoryModel>();
  final _fetCategoryData = PublishSubject<List<List<CategoryResult>>>();

  Stream<SuperFlashModel> get superFlashData => _fetSuperFlash.stream;

  Stream<CategoryModel> get categoryData => _fetCategory.stream;

  Stream<List<List<CategoryResult>>> get getCategory => _fetCategoryData.stream;

  getSuperFlash() async {
    HttpResult response = await _repository.getSuperFlash();
    if (response.isSuccess) {
      SuperFlashModel dataSuperFlash =
          SuperFlashModel.fromJson(response.result);
      _fetSuperFlash.sink.add(dataSuperFlash);
    }
  }

  allCategory() async {
    HttpResult response = await _repository.getCategory();
    if (response.isSuccess) {
      CategoryModel dataCategory = CategoryModel.fromJson(response.result);

      List<List<CategoryResult>> data = [];
      for (int i = 0; i < dataCategory.results.length; i++) {
        bool k = true;
        for (int j = 0; j < data.length; j++) {
          if (data[j].first.genderType.id ==
              dataCategory.results[i].genderType.id) {
            data[j].add(dataCategory.results[i]);
            k = false;
            break;
          }
        }
        if (k) {
          List<CategoryResult> list = [];
          list.add(dataCategory.results[i]);
          data.add(list);
        }
      }

      // CategoryTypeModel data = CategoryTypeModel(
      //   man: [],
      //   woman: [],
      //   kids: [],
      // );
      // for (int i = 0; i < dataCategory.results.length; i++) {
      //   if (dataCategory.results[i].genderType.id == 1) {
      //     data.man.add(dataCategory.results[i]);
      //   } else if (dataCategory.results[i].genderType.id == 2) {
      //     data.woman.add(dataCategory.results[i]);
      //   } else if (dataCategory.results[i].genderType.id == 3) {
      //     data.kids.add(dataCategory.results[i]);
      //   }
      // }
      _fetCategoryData.sink.add(data);
      _fetCategory.sink.add(dataCategory);
    }
  }
}

final categoryBloc = CategoryBloc();
