import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:questar/scene1.dart';

//ignore: must_be_immutable
class Story2Screen extends StatefulWidget {
  FirebaseUser user;

  Story2Screen({Key key, this.user}) : super(key: key);

  @override
  _Story2Screen createState() => _Story2Screen();
}

class _Story2Screen extends State<Story2Screen> {
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
                              builder: (context) => Scene1Screen()));
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
