import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizu/app/core/images.dart';
import 'package:quizu/app/core/text.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                logo,
                width: 300,
              ),
              SizedBox(height: 40),
              text(
                  text: "Welcome To QuizU!",
                  size: 25.0,
                  fontWeight: FontWeight.bold)
            ],
          ),
        ));
  }
}
