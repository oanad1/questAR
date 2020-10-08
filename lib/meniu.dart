import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'firstChallenge.dart';


class MeniuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff33354a),
        leading: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.account_circle,
                color: Colors.white.withOpacity(0.7),
          ),
        ),
      ),
      body: Stack(
      children: <Widget>[
          Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xff2b2d42),
          ),
        ),
        Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 70),
            Align(
              alignment: AlignmentDirectional.center,
                  child: Container(
                    height: 200,
                    width: 380,
                    decoration: BoxDecoration(
                      color: Color(0xff33354a),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                        children: <Widget>[
                          SizedBox(width: 20),
                          Image.asset('assets/images/story1.png', height: 160),
                          SizedBox(width: 20),
                          Column(
                              children: <Widget>[
                                SizedBox(height: 20),
                                Text(
                                    "THE MISTERY OF THE 4 CLOCKS",
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      letterSpacing: 0.5,
                                    )),
                                SizedBox(height: 100),
                                RaisedButton(
                                  padding: const EdgeInsets.all(0.0),
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  onPressed: () {},
                                  child: Ink(
                                      decoration: BoxDecoration(
                                        color: Color(0xff3c6488),
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                      ),
                                      child: Container(
                                        width: 150,
                                        padding: EdgeInsets.all(12.0),
                                        child: Text(
                                          'START',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(0.6),
                                            letterSpacing: 1.5,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'OpenSans',
                                          ),
                                        ),
                                      )
                                  ),
                                )
                              ]
                          )
                        ]
                    ),
                  ),
            )])
      ]));
  }
}


