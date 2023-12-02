import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/product_model.dart';

class FavoriteController extends GetxController {
  List<int> favoriteIds = [];

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    favoriteIds = prefs.getStringList('favorites')?.map(int.parse).toList() ?? [];
    update();
  }

  void saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favorites', favoriteIds.map((e) => e.toString()).toList());
  }

  bool isFavorite(int id) {
    return favoriteIds.contains(id);
  }

  void toggleFavorite(Product product) {
    if (isFavorite(product.id)) {
      favoriteIds.remove(product.id);
    } else {
      favoriteIds.add(product.id);
    }
    saveFavorites();
    update();
  }
}