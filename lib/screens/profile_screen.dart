import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simara/firebase/firebase_auth.dart';
import 'package:simara/providers/auth_provider.dart';

import '../widgets/header_widget.dart';
import 'auth/forgot_pw_screen.dart';
import 'auth/forgot_pw_verification.dart';
import 'auth/login_screen.dart';
import 'auth/register_screen.dart';
import 'splash_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  final double _drawerIconSize = 24;
  final double _drawerFontSize = 17;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).colorScheme.secondary,
              ],
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(top: 16, right: 16),
            child: Stack(
              children: <Widget>[
                Icon(Icons.notifications),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(minWidth: 12, minHeight: 12),
                    child: Text(
                      '5',
                      style: TextStyle(color: Colors.white, fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
              colors: [
                // ignore: deprecated_member_use
                Theme.of(context).primaryColor.withOpacity(0.2),
                // ignore: deprecated_member_use
                Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              ],
            ),
          ),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).colorScheme.secondary,
                    ],
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "FlutterTutorial.Net",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.screen_lock_landscape_rounded,
                  size: _drawerIconSize,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Splash Screen',
                  style: TextStyle(
                    fontSize: 17,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SplashScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.login_rounded,
                  size: _drawerIconSize,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Login Page',
                  style: TextStyle(
                    fontSize: _drawerFontSize,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1),
              ListTile(
                leading: Icon(
                  Icons.person_add_alt_1,
                  size: _drawerIconSize,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Registration Page',
                  style: TextStyle(
                    fontSize: _drawerFontSize,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1),
              ListTile(
                leading: Icon(
                  Icons.password_rounded,
                  size: _drawerIconSize,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Forgot Password Page',
                  style: TextStyle(
                    fontSize: _drawerFontSize,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordPage(),
                    ),
                  );
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1),
              ListTile(
                leading: Icon(
                  Icons.verified_user_sharp,
                  size: _drawerIconSize,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Verification Page',
                  style: TextStyle(
                    fontSize: _drawerFontSize,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPwVerification(),
                    ),
                  );
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1),
              ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  size: _drawerIconSize,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: _drawerFontSize,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                onTap: () async {
                  try {
                    await MyFirebaseAuth().logout();
                    await MyAuthProvider().logout();
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 100,
              child: HeaderWidget(100, false, Icons.house_rounded),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: const Offset(5, 5),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Mr. Donald Trump',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Former President',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            bottom: 4.0,
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "User Information",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Card(
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    ...ListTile.divideTiles(
                                      color: Colors.grey,
                                      tiles: [
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 4,
                                          ),
                                          leading: Icon(Icons.my_location),
                                          title: Text("Location"),
                                          subtitle: Text("USA"),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.email),
                                          title: Text("Email"),
                                          subtitle: Text(
                                            "donaldtrump@gmail.com",
                                          ),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.phone),
                                          title: Text("Phone"),
                                          subtitle: Text("99--99876-56"),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.person),
                                          title: Text("About Me"),
                                          subtitle: Text(
                                            "This is a about me link and you can khow about me in this section.",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
          ],
        ),
      ),
    );
  }
}
