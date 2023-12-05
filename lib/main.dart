import 'package:flutter/material.dart';
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
      home: const SplashView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
//SplashView()