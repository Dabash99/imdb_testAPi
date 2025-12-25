import 'package:flutter/material.dart';
import 'package:imdb_test/shared/components/constants.dart';


class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('assets/images/blur.png'),
          ),
          Center(child: Image.asset(kLogo,height: 250,),),
        ],
      ),
    );
  }
}
