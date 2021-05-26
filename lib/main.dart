import 'package:coffee_house/home.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ColorPalette {
  final Color titleColor = Color(0xFF1F0D3C);
  final Color firstSlice = Color.fromRGBO(83, 208, 236, 1);
  final Color secondSlice = Color(0xFFFCC07E);
  final Color buttonColor = Color(0xFFFD866E);
  final Color leftBarColor = Color(0xFFFFF8F6);
}
