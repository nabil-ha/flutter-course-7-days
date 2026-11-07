import 'package:flutter/material.dart';

enum STATUS { loading, success, error }

class DataProvider extends ChangeNotifier {
  STATUS? status;
  dynamic _data;
  dynamic get data => _data;
  setLoading() {
    status = STATUS.loading;
    notifyListeners();
  }

  setError(dynamic data) {
    status = STATUS.error;
    _data = data;
    notifyListeners();
  }

  setSuccess(dynamic data) {
    status = STATUS.success;
    _data = data;
    notifyListeners();
  }
}
