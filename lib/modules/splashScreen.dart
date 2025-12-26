import 'dart:async'; // مكتبة الوقت
import 'package:flutter/material.dart';
import 'package:imdb_test/modules/home/homeScreen.dart';
import 'package:imdb_test/shared/components/constants.dart';

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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homescreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(kBlurBackground),
          ),
          Center(
            child: Image.asset(kLogo, height: 250),
          ),
        ],
      ),
    );
  }
}