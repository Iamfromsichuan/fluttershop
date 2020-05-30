import 'package:flutter/cupertino.dart';

class AppState extends ChangeNotifier {
  bool _isGrayFilter;

  get isGrayFilter => _isGrayFilter;

  AppState({bool isGrayFilter = false}) {
    this._isGrayFilter = isGrayFilter;
  }

  switchGrayFilter() {
    _isGrayFilter = !_isGrayFilter;
    notifyListeners();
  }
}
