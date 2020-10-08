import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//ignore: must_be_immutable
class Scene1Screen extends StatefulWidget {
  FirebaseUser user;

  Scene1Screen({Key key, this.user}) : super(key: key);

  @override
  _Scene1Screen createState() => _Scene1Screen();
}

class _Scene1Screen extends State<Scene1Screen> {
  createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('INDICATII'),
            content: TextField(
              controller: customController,
            ),
            actions: <Widget>[
              MaterialButton(
                  onPressed: () {},
                  elevation: 5,
                  child: Text(
                    'OK',
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff33354a),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createAlertDialog(context);
        },
        child: Icon(Icons.chrome_reader_mode),
        backgroundColor: Color(0xff33354a),
      ),
    );
  }
}
