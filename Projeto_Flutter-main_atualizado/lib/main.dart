import 'package:flutter/material.dart';
import 'package:flutter_create_vscode/pages/LoadingScreen.dart';
import 'package:flutter_create_vscode/pages/LoginScreen.dart';
import 'package:flutter_create_vscode/pages/RegisterScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ClackMovie',
      home: ProgressIndicatorApp(),
    );
  }
}
