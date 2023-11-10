import 'package:flutter/material.dart';
import 'package:http_json/json_fetch.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any necessary initialization logic here
    Future.delayed(
      Duration(seconds: 3),
      () {
        // Navigate to the next screen after the splash screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                JsonFetchDemo(), // Replace with your home screen
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/offlinejson.json',
          height: 300, // Adjust the height as needed
          width: 300, // Adjust the width as needed
        ),
      ),
    );
  }
}
