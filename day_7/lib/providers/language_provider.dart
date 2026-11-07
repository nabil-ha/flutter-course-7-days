import 'package:day_7/extensions.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String _lang = "en";
  String get lang => _lang;
  changeLang(String newLang) {
    _lang = newLang;
    notifyListeners();
  }
}
