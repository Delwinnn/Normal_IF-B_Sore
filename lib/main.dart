import 'package:agile_git/LoginPage.dart';
import 'package:agile_git/PurchasingPage.dart';
import 'package:agile_git/SalesPage.dart';
import 'package:agile_git/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
