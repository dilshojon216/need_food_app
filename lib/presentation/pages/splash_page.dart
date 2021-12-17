import 'dart:async';

import 'package:flutter/material.dart';
import 'package:need_food_app/data/auth_firebase_service.dart';
import 'package:need_food_app/presentation/pages/home_page.dart';
import 'package:need_food_app/presentation/pages/main_page.dart';
import 'package:need_food_app/presentation/pages/onboaring_page.dart';
import 'package:need_food_app/presentation/widgets/splash_widget.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  AuthFirebaseService networkService = AuthFirebaseService();

  @override
  void initState() {
    Timer(const Duration(seconds: 2), () => chekadUser());
    super.initState();
  }

  void chekadUser() async {
    bool type = await networkService.chekadUser();
    if (type) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnboaringPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(53, 182, 255, 1),
      body: splashWidget(),
    );
  }
}
