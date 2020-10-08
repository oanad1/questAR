import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:questar/story2.dart';
import 'package:flutter/cupertino.dart';

//ignore: must_be_immutable
class StoryScreen extends StatefulWidget {
  FirebaseUser user;

  StoryScreen({Key key, this.user}) : super(key: key);

  @override
  _StoryScreen createState() => _StoryScreen();
}

class _StoryScreen extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff33354a),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Color(0xff2b2d42),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 150),
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  'Ati ajuns in Coiciu!!!!!! Daca vreti sa continuati lasati-va ce aveti de valoare la tigaia cu care ati venit si rugati-va sa ajungeti cu bine',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Story2Screen()));
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white70, fontSize: 20),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
