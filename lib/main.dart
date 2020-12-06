import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_bank_ui_concept/loadingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Concept Banking App',
      theme: ThemeData(
        fontFamily: 'Default',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
          centerTitle: true,
        ),
      ),
      home: LoadingScreen(),
    );
  }
}
