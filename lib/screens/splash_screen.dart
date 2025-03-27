import 'dart:async';
import 'package:flutter/material.dart';
import 'auth/login_screen.dart'; // Import LoginScreen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();

    // Animasi muncul logo
    Future.delayed(Duration(milliseconds: 10), () {
      setState(() {
        _isVisible = true;
      });
    });

    // Tunggu 2 detik sebelum navigasi ke LoginScreen
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).primaryColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0,
          duration: Duration(milliseconds: 1200),
          child: Center(
            child: Container(
              height: 140.0,
              width: 140.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 2.0,
                    offset: Offset(5.0, 3.0),
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: Center(
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/logo_simara.png',
                    width: 128,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
