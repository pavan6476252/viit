

import 'package:flutter/cupertino.dart';

class SearchHandlerModel extends ChangeNotifier {
  String _searchTerm = '';

  String get getSearchTerm => _searchTerm;

  setSearchTerm(String s) {
    _searchTerm = s;
    notifyListeners();
  }
}
