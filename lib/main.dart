import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Startup/signupPage.dart';
import 'Startup/signinPage.dart';

void main() {
  runApp(MaterialApp(
              home: LoginPage(),
  ));
}

class StartUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
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
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 85.0,
                    vertical: 130.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Welcome',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontFamily: 'OpenSans',
                          letterSpacing: 2,
                          fontSize: 45.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Image.asset('assets/images/new.png',
                        height: 200,
                          ),
                      SizedBox(height: 30.0),
                      Container(
                          padding: EdgeInsets.only(top: 10.0),
                          width: 240.0,
                          child: RaisedButton(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.white.withOpacity(0.8), width: 1.3)),
                            onPressed: () {  Navigator.push(context,
                                MaterialPageRoute(builder: (context) => LoginPage()));},
                            color: Color(0x00000000),
                            textColor: Colors.white.withOpacity(0.8),
                            padding: EdgeInsets.all(11.0),
                            child: Text("Sign in".toUpperCase(),
                                style: TextStyle(fontSize: 18, fontFamily: 'OpenSans')),
                          )),
                      SizedBox(height: 7.0),
                      Container(
                          padding: EdgeInsets.only(top: 10.0),
                          width: 240.0,
                          child: RaisedButton(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.white.withOpacity(0.8), width: 1.3)),
                            onPressed: () {  Navigator.push(context,
                                MaterialPageRoute(builder: (context) => SignUpPage()));},
                            color: Color(0x00000000),
                            textColor: Colors.white.withOpacity(0.8),
                            padding: EdgeInsets.all(11.0),
                            child: Text("Sign up".toUpperCase(),
                                style: TextStyle(fontSize: 18)),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
