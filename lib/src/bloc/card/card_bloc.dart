import 'package:lafyuu/src/model/api/product_list_model.dart';
import 'package:lafyuu/src/provider/repository.dart';
import 'package:rxdart/rxdart.dart';

class CardBloc {
  final Repository _repository = Repository();

  final _fetCardDatabase = PublishSubject<List<ProductListResult>>();

  Stream<List<ProductListResult>> get cardDataBase => _fetCardDatabase.stream;

  getCardBase() async {
    List<ProductListResult> data = await _repository.getProductCard();
    List<ProductListResult> dataFav = await _repository.getProductFav();
    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < dataFav.length; j++) {
        if (data[i].id == dataFav[j].id) {
          data[i].isFav = true;
          break;
        }
      }
    }
    _fetCardDatabase.sink.add(data);
  }

  updateCard(ProductListResult card, bool remove) async {
    if (remove) {
      if (card.card > 1) {
        card.card--;
        if (card.card == 0) {
          await _repository.deleteProductCard(card.id);
        } else {
          await _repository.updateProductCard(card);
        }
      }
    } else {
      card.card++;
      await _repository.updateProductCard(card);
    }
    getCardBase();
  }

  updateFav(ProductListResult data) async {
    data.isFav = !data.isFav;

    if (data.isFav) {
      await _repository.saveProductFav(data);
    } else {
      await _repository.deleteProductFav(data.id);
    }

    getCardBase();
  }

  delete(int id, bool bro) async {
    if(bro){
      await _repository.deleteProductCard(id);
      getCardBase();
    }
  }
}

final cardBloc = CardBloc();
