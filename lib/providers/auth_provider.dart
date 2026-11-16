import 'package:flutter/foundation.dart';

class User {
  final String? displayName;
  final String? email;
  
  User({this.displayName, this.email});
}

class AuthProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void login(String email, String password) {
    // Implementasi login
    _user = User(
      displayName: email.split('@').first,
      email: email,
    );
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}