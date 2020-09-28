import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:questar/meniu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'authentication.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState  extends State<SignUpPage> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();

  bool _visible = false;
  String _errorMsg;

  @override
  void initState() {
    super.initState();
    Paint.enableDithering = true;
  }

  Widget _buildEmailTF() {
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
              hintStyle: TextStyle(fontSize: 14.0,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 45.0,
          width: 280,
          child: TextField(
            controller: _userController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontFamily: 'OpenSans',
              fontSize: 14.0,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 15.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white.withOpacity(0.7),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.white.withOpacity(0.3),
                  )),
              hintText: 'Username',
              hintStyle: TextStyle(fontSize: 14.0,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 45.0,
          width: 280,
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontFamily: 'OpenSans',
              fontSize: 14.0,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 15.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white.withOpacity(0.7),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.white.withOpacity(0.3),
                  )),
              hintText: 'Password',
              hintStyle: TextStyle(fontSize: 14.0,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRePasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 45.0,
          width: 280,
          child: TextField(
            controller: _rePasswordController,
            obscureText: true,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontFamily: 'OpenSans',
              fontSize: 14.0,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 15.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white.withOpacity(0.7),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.white.withOpacity(0.3),
                  )),
              hintText: 'Confirm Password',
              hintStyle: TextStyle(fontSize: 14.0,
                  color: Colors.white.withOpacity(0.6)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpBtn() {
    return Container(
        width: 280.0,
        child: RaisedButton(
          padding: const EdgeInsets.all(0.0),
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          onPressed: () {
            setState((){_visible = false;});
            Future.delayed(const Duration(milliseconds: 200), () async{
               _errorMsg = await firebase_signup(_emailController,
                  _userController, _passwordController, _rePasswordController,
                  context);
              setState((){
                if(_errorMsg != null) _visible = true;
              });
            });
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
                  'SIGN UP',
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 70,
                          ),
                          child: Column (
                              children: <Widget>[
                                Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'SIGN UP',
                                      style: GoogleFonts.openSans (
                                        color: Colors.white.withOpacity(0.7),
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 3,
                                        fontSize: 42.0,
                                      ),
                                    )),
                                SizedBox(height: 10.0),
                                AnimatedOpacity(
                                    opacity: _visible ? 1.0 : 0.0,
                                    duration: Duration(milliseconds: 250),
                                    child: Container(
                                      width: 280.0,
                                      height: 40.0,
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        (_errorMsg != null)? _errorMsg: "",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.openSans (
                                          color: Color(0xffD44638).withOpacity(0.8),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    )),
                                _buildEmailTF(),
                                SizedBox(height: 5.0),
                                _buildUserTF(),
                                SizedBox(height: 5.0),
                                _buildPasswordTF(),
                                SizedBox(height: 5.0),
                                _buildRePasswordTF(),
                                SizedBox(height: 15.0),
                                _buildSignUpBtn(),
                              ]
                          ),
                        )
                    ),
                  ]
              )
          ),
        )
    );
  }
}