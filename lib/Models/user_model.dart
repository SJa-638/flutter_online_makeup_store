import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  // Dummy implementations - Replace these with your own logic for user management

  Map<String, dynamic> userData = {};
  bool isLoading = false;

  get currentUser => null;

  static UserModel of(BuildContext context) =>
      ScopedModel.of<UserModel>(context);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    // Dummy implementation
  }

  void signUp({
  required Map<String, dynamic> userData,
  required String pass,
  required VoidCallback onSuccess,
  required VoidCallback onFail,
}) {
  isLoading = true;
  notifyListeners();

  // Dummy asynchronous implementation of sign up logic
  Future.delayed(Duration(seconds: 2), () {
    // Consider this as a successful sign up scenario for the demo
    onSuccess();
    isLoading = false;
    notifyListeners();
  });
}

void signIn({
  required String email,
  required String pass,
  required VoidCallback onSuccess,
  required VoidCallback onFail,
}) {
  isLoading = true;
  notifyListeners();

  // Dummy asynchronous implementation of sign in logic
  Future.delayed(Duration(seconds: 2), () {
    // Consider this as a successful sign in scenario for the demo
    onSuccess();
    isLoading = false;
    notifyListeners();
  });
}

  void signOut() {
    // Dummy implementation - Replace with your own sign out logic
    // userData = {};
    // notifyListeners();
  }

  void recoverPass(String email) {
    // Dummy implementation - Replace with your own password recovery logic
  }

  bool get isLoggedIn {
    // Dummy implementation - Replace with your own logic to check if user is logged in
    return false;
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    // Dummy implementation - Replace with your own logic to save user data
  }

  Future<Null> _loadCurrentUser() async {
    // Dummy implementation - Replace with your own logic to load current user data
  }
}