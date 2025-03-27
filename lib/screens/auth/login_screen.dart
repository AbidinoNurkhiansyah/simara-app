import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../firebase/firebase_auth.dart';
import '../../firebase/firestore.dart';
import 'register_screen.dart';
import '../index.dart';
import '../profile_screen.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../common/theme_helper.dart';
import '../../widgets/header_widget.dart';
import 'forgot_pw_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final double _headerHeight = 250;
  final Key _formKey = GlobalKey<FormState>();

  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  bool sedangProses = false;
  void login() async {
    if (sedangProses) return;

    setState(() => sedangProses = true);
    User? user = await MyFirebaseAuth().loginWithEmail(
      email_controller.text,
      password_controller.text,
    );

    if (user == null) {
      print("Username atau password salah");
      return;
    }

    await Provider.of<MyAuthProvider>(context, listen: false).login();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => IndexScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(
                _headerHeight,
                true,
                Icons.login_rounded,
              ), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.all(
                  20.0,
                ), // This will be the login form
                child: Column(
                  children: [
                    Text(
                      'Selamat Datang',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Signin into your account',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 30.0),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            child: TextField(
                              controller: email_controller,
                              decoration: ThemeHelper().textInputDecoration(
                                'User Name',
                                'Enter your user name',
                              ),
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(height: 30.0),
                          Container(
                            child: TextField(
                              obscureText: true,
                              decoration: ThemeHelper().textInputDecoration(
                                'Password',
                                'Enter your password',
                              ),
                              controller: password_controller,
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(height: 15.0),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgotPasswordPage(),
                                  ),
                                );
                              },
                              child: Text(
                                "Forgot your password?",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          Container(
                            decoration: ThemeHelper().buttonBoxDecoration(
                              context,
                            ),
                            child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  sedangProses
                                      ? 'Processing...'.toUpperCase()
                                      : 'Sign In'.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: login,
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.all(20),
                            //child: Text('Don\'t have an account? Create'),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: "Belum punya akun? "),
                                  TextSpan(
                                    text: 'Daftar',
                                    recognizer:
                                        TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (context) =>
                                                        RegisterScreen(),
                                              ),
                                            );
                                          },
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(
                                            context,
                                          ).colorScheme.secondary,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
