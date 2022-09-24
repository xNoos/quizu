import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizu/app/core/images.dart';
import 'package:quizu/app/routes/app_pages.dart';

import '../../../core/colors.dart';
import '../../../core/text.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: text(
            text: 'Home',
            size: 22.0,
            color: primaryColor,
            fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: primaryColor),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(
              quiz,
              width: 300,
            ),
            text(
                text: "Ready to test your knoweldge and challenge others?",
                size: 25.0,
                color: primaryColor,
                fontWeight: FontWeight.bold),
            SizedBox(height: 40),
            SizedBox(
              width: 155,
              height: 50,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: primaryColor,
                onPressed: () => Get.toNamed(AppPages.QUESTIONS),
                child: text(
                    text: "Start Now!",
                    color: Colors.white,
                    size: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(20),
              child: text(
                  text: "Answer as mush questions correctly within 2 minutes",
                  size: 20.0,
                  color: secondryColor),
            )
          ],
        ),
      ),
    );
  }
}
