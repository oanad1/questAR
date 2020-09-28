import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:questar/meniu.dart';


Future<String> firebase_signup(
    TextEditingController _emailController,
    TextEditingController _userController,
    TextEditingController _passwordController,
    TextEditingController _rePasswordController,
    BuildContext context,
    ) async {
  if (_passwordController.text == _rePasswordController.text) {
    try {
      FirebaseUser user = (await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,)).user;

      if (user != null) {
        UserUpdateInfo updateUser = UserUpdateInfo();
        updateUser.displayName = _userController.text;
        user.updateProfile(updateUser);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MeniuPage()));
      }
      return null;
    } catch (e) {
      print(e.message);
      String errorMsg;
      switch(e.message){
        case "Given String is empty or null":
            errorMsg = "Please fill in all fields.";
            break;
        default:
            errorMsg = e.message;
            break;
      }
      return errorMsg;
    };
  } else {
    return "Passwords do not match.";
  }
}

Future<bool> firebase_signin(
    TextEditingController _emailController,
    TextEditingController _passwordController,
    BuildContext context) async {
  try {
    final FirebaseUser user = (await FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text))
        .user;

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MeniuPage()));
    return false;
  } catch (e) {
    print(e.message);
    return true;
  }
}