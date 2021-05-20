import 'package:conversion_app/loading%20page.dart';
import 'package:flutter/material.dart';

const Color primaryColor = Color(0XFFFFD741);
const Color backgroundColor = Color(0XFFFFD741);
const String f = '';
void main() {
  runApp(ConvertionApp());
}

class ConvertionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Conversion App',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: LoadingScreen(f),
    );
  }
}
