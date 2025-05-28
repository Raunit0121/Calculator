import 'dart:async';
import 'package:flutter/material.dart';
import 'calculator_page.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // User not logged in — go to LoginScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CalculatorPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.calculate_rounded, size: 80, color: Colors.white),
              SizedBox(height: 20),
              Text(
                "Calulator",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 200, // Set your desired width here
                  child: LinearProgressIndicator(
                    color: Colors.white,
                    backgroundColor: Colors.blue.shade200,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
