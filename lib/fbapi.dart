import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FBApi {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser firebaseUser;

  FBApi(FirebaseUser user) {
    this.firebaseUser = user;
  }

  static Future<FBApi> signInWithEmail({@required String email,   @required String password,}) async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;

    assert(user.email != null);
    //assert(user.displayName != null);

    //assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return FBApi(user);
  }
}