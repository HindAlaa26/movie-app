
import 'package:flutter/material.dart';
import 'package:movie_app/models/home_model.dart';

class FavoriteProvider extends ChangeNotifier{
  List<HomeModel> favoriteItem = [];
  List<HomeModel> get favoriteItems => favoriteItem;

  void addToFavorites(HomeModel item) {
    favoriteItem.add(item);
    notifyListeners();
  }

  void removeFromFavorites(HomeModel item) {
    favoriteItem.remove(item);
    notifyListeners();
  }
  // void clearFromFavorites(HomeModel item) {
  //   favoriteItem.remove(item);
  //   notifyListeners();
  // }
}