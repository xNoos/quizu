import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quizu/app/core/images.dart';
import 'package:quizu/app/routes/app_pages.dart';

import '../../../core/colors.dart';
import '../../../core/text.dart';
import '../controllers/result_controller.dart';

class ResultView extends GetView<ResultController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: text(
            text: 'Result',
            size: 22.0,
            color: primaryColor,
            fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: primaryColor),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(win, width: 250),
              SizedBox(height: 50),
              text(
                  text: "You have completed",
                  size: 30.0,
                  color: primaryColor,
                  height: 1.7,
                  fontWeight: FontWeight.bold),
              text(
                  text: controller.score.toString(),
                  size: 70.0,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
              text(
                  text: "correct answers!",
                  size: 30.0,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
              SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        onPressed: () => Get.offAllNamed(AppPages.MAIN_SCREEN),
                        icon: Icon(Icons.home, color: Colors.white),
                        label: text(
                          text: 'Home',
                          size: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        onPressed: () => controller.share(context),
                        icon: Icon(Icons.ios_share, color: Colors.white),
                        label: text(
                          text: 'Share',
                          size: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
