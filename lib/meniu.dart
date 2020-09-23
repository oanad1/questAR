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
        backgroundColor: Colors.black,
      ),
      body: Stack(
      children: <Widget>[
          Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
              Color(0xff0b1540),
              Color(0xff00a5b2),
              ],
              stops: [0, 1],
              ),
          ),
        ),
          Container(
            height: double.infinity,
            color: Colors.white,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 85.0,vertical: 130.0),
              child:
              ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    child: Row(
                        children: <Widget>[
                          Image.asset('assets/images/challenge1.png', height: 100,),
                    SizedBox(width: 100,),
                    RaisedButton(
                      child: Text('Open route'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FirstChallenge()),
                        );
                      },
                    )])),
                  SizedBox(height: 20),
                  Container(
                    height: 100,
                    color: Colors.grey,
                    child: const Center(child: Text('Entry B')),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 100,
                    color: Colors.grey,
                    child: const Center(child: Text('Entry C')),
                  ),
                ],
              )
            ))]));
  }
}


