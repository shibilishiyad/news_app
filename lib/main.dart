import 'package:flutter/material.dart';
import 'package:newsapp/Utility/screen_size.dart';
import 'package:newsapp/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          ScreenUtil.init(context);
          return const Home();
        },
      ),
    );
  }
}
