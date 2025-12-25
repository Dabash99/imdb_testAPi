import 'package:flutter/material.dart';
import 'package:imdb_test/shared/styles/themes.dart';

import 'modules/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMDB Testing',
      theme: AppTheme.darkTheme,
      home: Splashscreen(),
    );
  }
}
