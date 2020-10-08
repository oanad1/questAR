import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:questar/meniu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:questar/startup/passwordReset.dart';
import 'package:questar/startup/signupPage.dart';
import 'authentication.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _visible = false;
  bool _buildLoginScreen = false;

  @override
  void initState() {
    super.initState();
    Paint.enableDithering = true;

    FirebaseAuth.instance.currentUser().then((user) => () {
          if (user == null)
            setState(() {
              _buildLoginScreen = true;
            });
          else
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MeniuPage()));
        }());
  }

  Widget _createEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          height: 45.0,
          width: 260,
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
                borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
              ),
              hintText: 'Email',
              hintStyle: TextStyle(
                  fontSize: 13.0, color: Colors.white.withOpacity(0.6)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _createPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 45.0,
          width: 260,
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontFamily: 'OpenSans',
              fontSize: 13.0,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 15.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white.withOpacity(0.7),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
              hintText: 'Password',
              hintStyle: TextStyle(
                  fontSize: 13.0, color: Colors.white.withOpacity(0.6)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _createForgotPasswordButton() {
    return Container(
      //alignment: Alignment.topRight,
      child: FlatButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PasswordResetPage()));
          setState(() {
            _visible = false;
          });
        },
        child: Text('Forgot Password?',
            style: TextStyle(
              color: Color(0xff191b34).withOpacity(0.8),
              fontSize: 14.0,
            )),
      ),
    );
  }

  Widget _createSigninButton() {
    return Container(
        width: 220.0,
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
            Future.delayed(const Duration(milliseconds: 200), () async {
              bool _tempVisible = await firebase_signin(
                  _emailController, _passwordController, context);
              setState(() {
                _visible = _tempVisible;
              });
            });
          },
          child: Ink(
              decoration: BoxDecoration(
                color: Color(0xff3c6488),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Container(
                width: 300,
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'LOGIN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    letterSpacing: 1.5,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'OpenSans',
                  ),
                ),
              )),
        ));
  }

  Widget _createSocialButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () => print('Login with Facebook'),
            child: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                //borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color(0xff4267B2).withOpacity(0.9),
              ),
              child: Row(children: <Widget>[
                SizedBox(width: 16),
                Image.asset('assets/logos/facebooklogo.png', height: 18),
              ]),
            ),
          ),
          SizedBox(width: 15.0),
          GestureDetector(
            onTap: () => print('Login with Google'),
            child: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color(0xffD44638).withOpacity(0.9)),
              child: Row(children: <Widget>[
                SizedBox(width: 13.0),
                Image.asset('assets/logos/googlelogo.png', height: 18),
              ]),
            ),
          ),
          SizedBox(width: 15.0),
          GestureDetector(
            onTap: () => print('Login with Twitter'),
            child: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xff1da1f2)),
              child: Row(children: <Widget>[
                SizedBox(width: 11.0),
                Image.asset('assets/logos/twitterlogo.png', height: 18),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateAccountButton() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text("Don't have an account? ",
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontWeight: FontWeight.w400,
            fontSize: 14,
            letterSpacing: 0.5,
          )),
      InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpPage()));
            setState(() {
              _visible = false;
            });
          },
          child: new Text("Sign Up",
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.w600,
                fontSize: 14,
                letterSpacing: 0.5,
              ))),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(children: <Widget>[
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
                    horizontal: 10.0,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 70.0),
                        Align(
                            alignment: Alignment.center,
                            child: Text(
                              'SIGN IN',
                              style: GoogleFonts.openSans(
                                color: Colors.white.withOpacity(0.7),
                                fontWeight: FontWeight.w400,
                                letterSpacing: 3,
                                fontSize: 35.0,
                              ),
                            )),
                        SizedBox(height: 5.0),
                        AnimatedOpacity(
                            opacity: _visible ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 250),
                            child: Container(
                              width: 280.0,
                              height: 20.0,
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                'Wrong email or password.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  color: Color(0xffD44638).withOpacity(0.8),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0,
                                ),
                              ),
                            )),
                        SizedBox(height: 5.0),
                        _createEmailField(),
                        SizedBox(height: 5.0),
                        _createPasswordField(),
                        SizedBox(height: 30.0),
                        _createSigninButton(),
                        _createForgotPasswordButton(),
                        SizedBox(height: 50.0),
                        _createSocialButtons(),
                        SizedBox(height: 20.0),
                        _buildCreateAccountButton()
                      ]),
                )
              ])),
        ));
  }
}
