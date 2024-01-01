
import 'package:flutter/material.dart';
import 'package:movie_app/models/home_model.dart';

class FavoriteProvider extends ChangeNotifier{
  List<HomeModel> _favoriteItems = [];
  List<HomeModel> get favoriteItems => _favoriteItems;

  void addToFavorites(HomeModel item) {
    _favoriteItems.add(item);
    notifyListeners();
  }

  void removeFromFavorites(HomeModel item) {
    _favoriteItems.remove(item);
    notifyListeners();
  }
  // void clearFromFavorites(HomeModel item) {
  //   _favoriteItems.remove(item);
  //   notifyListeners();
  // }
}