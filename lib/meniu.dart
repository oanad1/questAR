import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:questar/story.dart';
import 'package:questar/profile.dart';

class MeniuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff33354a),
        title: Row(
          children: <Widget>[
            SizedBox(width: 20),
            Container(
              child: Text(
                'QuestAR',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 200,
            ),
            IconButton(
              icon: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff2b2d42),
            ),
            child: ListView(
              children: <Widget>[
                Card(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 100),
                  elevation: 5,
                  color: Color(0xff252229),
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 150,
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Image.asset(
                            'assets/images/255689.p.jpg',
                            height: 100,
                          ),
                        ),
                        // SizedBox(width: 90),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'The mistery of the clocks',
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                              Container(
                                child: FlatButton(
                                  padding: EdgeInsets.only(top: 50),
                                  child: Text(
                                    'START',
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 30),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                StoryScreen()));
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
