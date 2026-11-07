import 'package:day_6/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserRole? _userRole;
  UserRole? get userRole => _userRole;
  setUserRole(UserRole userRole) {
    _userRole = userRole;
    notifyListeners();
  }
}
