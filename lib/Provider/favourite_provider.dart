import 'package:flutter/foundation.dart';

class FavouriteItemsProvider with ChangeNotifier {
  List<int> _selected_items = [];

  List<int> get selcted_items => _selected_items;

  void addItem(int value) {
    _selected_items.add(value);

    notifyListeners();
  }

  void removeItem(int value) {
    _selected_items.remove(value);

    notifyListeners();
  }
}
