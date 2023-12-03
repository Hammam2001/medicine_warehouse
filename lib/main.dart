import 'package:flutter/material.dart';
import 'feature/first_screen/First_Screen.dart';
import 'feature/home_view/home_view.dart';
import 'feature/login/login_page.dart';
import 'feature/product/add_prodact.dart';
import 'feature/splash_view/splash_view.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      home: Lecture(),
      debugShowCheckedModeBanner: false,
    );
  }
}
//SplashView()