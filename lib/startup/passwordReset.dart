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


  bool _visible = false;
  bool _successful = false;

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
              fontSize: 13.0,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 15.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white.withOpacity(0.7),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.4))),
              hintText: 'Email',
              hintStyle: TextStyle(fontSize: 13.0, color: Colors.white.withOpacity(0.6)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResetBtn() {
    return Container(
        width: 260.0,
        child: RaisedButton(
          padding: const EdgeInsets.all(0.0),
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          onPressed: () {
            setState(() {
              _visible = false;
            });
            Future.delayed(const Duration(milliseconds: 250),
                    () async {
                  try {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(
                        email: _emailController.text);
                    setState(() {
                      _successful = true;
                      _visible = true;
                    });
                  } catch (e) {
                    //In caz de esec
                    setState(() {
                      _successful = false;
                      _visible = true;
                    });
                  }
                });
          },
              child: Ink(
                        decoration: BoxDecoration(
                          color: Color(0xff3c6488),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Container(
                          width: 260,
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Reset Password',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              letterSpacing: 1.5,
                              fontSize: 14.0,
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
          backgroundColor: Color(0xff181a33),
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
                            Color(0xff191b34),
                            Color(0xff3d678b),
                        ],
                          stops: [0, 1],
                        ),
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                      ),
                      child: Column (
                          children: <Widget>[
                            SizedBox(height: 50.0),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'Forgot password?',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.openSans (
                                    color: Colors.white.withOpacity(0.7),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 28.0,
                                  ),
                                )),
                            SizedBox(height: 20.0),
                            Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Enter your email adress and we will send you '
                                      'a link to recover your password.',
                                  style: GoogleFonts.openSans (
                                    color: Colors.white.withOpacity(0.4),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                )),
                            SizedBox(height: 20.0),
                            _buildEmailField(),
                            SizedBox(height: 30.0),
                            _buildResetBtn(),
                            ///Reset error
                            AnimatedOpacity(
                                opacity: _visible ? 1.0 : 0.0,
                                duration: Duration(milliseconds: 300),
                                child: Container(
                                    padding: EdgeInsets.only(top: 10),
                                  alignment: Alignment.center,
                                  child: Text(
                                    (_emailController.text != "")
                                        ? (_successful
                                        ? "A reset email has been sent to ${_emailController.text}"
                                        : "No account associated with this email.")
                                        : "Please enter your email address.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: _successful
                                          ? Color(0x14db71).withOpacity(
                                          0.8)
                                          : Color(0xffD44638)
                                          .withOpacity(0.8),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                )),
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