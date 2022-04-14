import 'package:lafyuu/src/model/api/product_list_model.dart';
import 'package:lafyuu/src/provider/repository.dart';
import 'package:rxdart/rxdart.dart';

class FavouriteBloc {
  final Repository _repository = Repository();

  final _fetchFavourite = PublishSubject<List<ProductListResult>>();

  Stream<List<ProductListResult>> get getFavourite => _fetchFavourite.stream;

  allFavourite() async {
    List<ProductListResult> favouriteData = await _repository.getProductFav();
    List<ProductListResult> cardData = await _repository.getProductCard();
    for (int i = 0; i < favouriteData.length; i++) {
      for (int j = 0; j < cardData.length; j++) {
        if (favouriteData[i].id == cardData[j].id) {
          favouriteData[i].card = cardData[j].card;
          break;
        }
      }
    }
    _fetchFavourite.sink.add(favouriteData);
  }

  updateFavCard() async {
    List<ProductListResult> cardData = await _repository.getProductCard();
    List<ProductListResult> favouriteData = await _repository.getProductFav();
    for (int i = 0; i < favouriteData.length; i++) {
      for (int j = 0; j < cardData.length; j++) {
        if (favouriteData[i].id == cardData[j].id) {
          favouriteData[i].card = cardData[j].card;
          break;
        }
      }
    }
    _fetchFavourite.sink.add(favouriteData);
  }
}

final favouriteBloc = FavouriteBloc();
