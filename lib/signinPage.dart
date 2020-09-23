import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:questar/meniu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:questar/signupPage.dart';
import 'fbapi.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState  extends State<LoginPage> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    Paint.enableDithering = true;
  }

  _showToast() {
    Widget toast = Column(
      children:  <Widget>[
        SizedBox(height: 105.0),
        Container(
          width: 280,
          height:40,
          padding: EdgeInsets.all(11.0),
        decoration: BoxDecoration(
          color: Color(0x00000000),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
          child: Text("Wrong email or password",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xffaa494c),
              fontSize: 15.0,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w500
            ),
          ),
       )],
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: 30),
    );
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

  Widget _buildPasswordField() {
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
              hintStyle: TextStyle(fontSize: 14.0, color: Colors.white.withOpacity(0.6)),
            ),
          ),
        ),
      ],
    );
  }

   Widget _buildForgotPasswordBtn() {
    return Container(
      //alignment: Alignment.topRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        child: Text(
            'Forgot Password?',
            style: TextStyle(
              color: Colors.black38,
              fontSize: 14.0,
            )
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      width: 280.0,
      child: RaisedButton(
        padding: const EdgeInsets.all(0.0),
        elevation: 2.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: () async {
          setState(() => _isLoading = true);

          try {
          final FirebaseUser user = (await
          FirebaseAuth.instance.signInWithEmailAndPassword(
              email:  _emailController.text,
              password:  _passwordController.text)).user;

          Navigator.push(context, MaterialPageRoute(builder: (context) => MeniuPage()));
          } catch(e){
            print(e.message);
            _showToast();
          };
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
                'LOGIN',
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

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
            'Social Media Login',
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
              fontWeight: FontWeight.w400,
              fontSize: 14,
              letterSpacing: 1,
            )),
      ],
    );
  }


  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap:  () => print('Login with Facebook'),
            child: Container(
              height: 44.0,
              width: 44.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                //borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color(0xff4267B2).withOpacity(0.9),
              ),
              child: Row(
                  children: <Widget>[
                    SizedBox(width: 17),
                  Image.asset('assets/logos/facebooklogo.png', height: 18),
              ]),
            ),
          ),
          SizedBox(width: 15.0),
          GestureDetector(
            onTap:  () => print('Login with Google'),
            child: Container(
              height: 44.0,
              width: 44.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
               // borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color(0xffD44638).withOpacity(0.9)
              ),
              child: Row(
                  children: <Widget>[
                    SizedBox(width: 14.0),
                    Image.asset('assets/logos/googlelogo.png', height: 18),
                  ]),
            ),
          ),
          SizedBox(width: 15.0),
          GestureDetector(
            onTap:  () => print('Login with Twitter'),
            child: Container(
              height: 44.0,
              width: 44.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                  color: Color(0xff1da1f2)
              ),
              child: Row(
                  children: <Widget>[
                    SizedBox(width: 13.0),
                    Image.asset('assets/logos/twitterlogo.png', height: 18),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateAccountButton() {
      return
                  Row(
                      children: <Widget>[
                         SizedBox(width: 80),
                          Text(
                          "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                letterSpacing: 0.5,
                              )),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => SignUpPage()));
                            },
                          child: new Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              letterSpacing: 0.5
                            ))),
                  ]);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
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
                    horizontal: 10.0,
                  ),
                  child: Column (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 90.0),
                        Align(
                            alignment: Alignment.center,
                            child: Text(
                            'SIGN IN',
                            style: GoogleFonts.openSans (
                              color: Colors.white.withOpacity(0.7),
                              fontWeight: FontWeight.w400,
                              letterSpacing: 3,
                              fontSize: 42.0,
                              ),
                        )),
                        SizedBox(height: 40.0),
                        _buildEmailField(),
                        SizedBox(height: 5.0),
                        _buildPasswordField(),
                        SizedBox(height: 15.0),
                        _buildLoginBtn(),
                        _buildForgotPasswordBtn(),
                        SizedBox(height: 40.0),
                        _buildSignInWithText(),
                        SizedBox(height: 5.0),
                        _buildSocialBtnRow(),
                        SizedBox(height: 25.0),
                        _buildCreateAccountButton()
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