import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:questar/startup/signinPage.dart';

//ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  FirebaseUser user;

  ProfileScreen({Key key, this.user}) : super(key: key);

  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xff33354a),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Color(0xff2b2d42),
        child: ListView(
          children: <Widget>[
            Card(
              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
              elevation: 5,
              color: Colors.indigo[300],
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: 50,
                padding: EdgeInsets.only(left: 20, top: 8),
                alignment: Alignment.topLeft,
                child: InkWell(
                  child: Text(
                    'Sign out',
                    style: TextStyle(
                        color: Color(0xff1E2138),
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
