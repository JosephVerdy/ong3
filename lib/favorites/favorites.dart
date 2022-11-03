import 'package:ong3/backend/backend.dart';
import '../auth/auth_util.dart';

class Favorites {
  static List<FavoritesRecord> favorites = [];

  static Future loadFavorites() async {
    favorites = await queryFavoritesRecordOnce(parent: currentUserReference);
  }

  static Future changeFavorite(ProductsRecord productRecord) async {
    if (!Favorites.isFavorite(productRecord)) {
      var newfav = createFavoritesRecordData(product: productRecord.reference);
      var newref = await currentUserReference!.collection('favorites').add(newfav);
      final result = new FavoritesRecordBuilder();
      result.ffRef = newref;
      result.product = productRecord.reference;
      var newfavorite = result.build();
      favorites.add(newfavorite);
    } else {
      var oldFav = favorites.where((fav) => fav.product == productRecord.reference).first;
      await oldFav.reference.delete();
      favorites.remove(oldFav);
    }
  }

  static bool isFavorite(ProductsRecord productRecord) {
    return favorites.any((fav) => fav.product == productRecord.reference);
  }
}
