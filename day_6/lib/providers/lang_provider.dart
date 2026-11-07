import 'package:flutter/material.dart';

class LangProvider extends ChangeNotifier{
  String lang = "en";

  void changeLang(String newLang){
    lang = newLang;
    notifyListeners();
  }
}