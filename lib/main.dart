import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const ZipZipTopApp());
}

class ZipZipTopApp extends StatelessWidget {
  const ZipZipTopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZıpZıp Top',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
    );
  }
}
