import 'package:flutter/material.dart';
import 'package:regester/feature/login/login_page.dart';

import '../widget/image_app.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    navigateHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const ImageApp() ,
          CircularProgressIndicator(color: Theme.of(context).primaryColor,)
        ],
      ),
    );
  }

  void navigateHome() {
    Future.delayed(
      const Duration(seconds: 1),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login(),)),
    );
  }
}
