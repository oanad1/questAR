import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PasswordResetPage extends StatefulWidget {
  @override
  _PasswordResetPageState createState() => _PasswordResetPageState();
}

class _PasswordResetPageState  extends State<PasswordResetPage> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _emailController = TextEditingController();


  @override
  void initState() {
    super.initState();
    Paint.enableDithering = true;
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 45.0,
          width: 280,
          child: TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontFamily: 'OpenSans',
              fontSize: 14.0,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 15.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white.withOpacity(0.7),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.white.withOpacity(0.3),
                  )),
              hintText: 'Email',
              hintStyle: TextStyle(fontSize: 14.0, color: Colors.white.withOpacity(0.6)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResetBtn() {
    return Container(
        width: 280.0,
        child: RaisedButton(
          padding: const EdgeInsets.all(0.0),
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          onPressed: () async{
          try {
            await FirebaseAuth.instance.sendPasswordResetEmail(
                email: _emailController.text);
          } catch(e) {print(e.message);}
          },
          child: Ink(
              decoration: BoxDecoration(
                color: Color(0xff045872),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Container(
                width: 300,
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Reset Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    letterSpacing: 1.5,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'OpenSans',
                  ),
                ),
              )
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff0b1540),
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 65.0,
                      ),
                      child: Column (
                          children: <Widget>[
                            SizedBox(height: 80.0),
                            Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Forgot your password?',
                                  style: GoogleFonts.openSans (
                                    color: Colors.white.withOpacity(0.7),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 34.0,
                                  ),
                                )),
                            SizedBox(height: 20.0),
                            Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Enter your email adress and we will send you '
                                      'a link to reset your password.',
                                  style: GoogleFonts.openSans (
                                    color: Colors.white.withOpacity(0.4),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                )),
                            SizedBox(height: 25.0),
                            _buildEmailField(),
                            SizedBox(height: 10.0),
                            _buildResetBtn()
                          ]
                      ),
                    )
                  ]
              )
          ),
        )
    );
  }
}