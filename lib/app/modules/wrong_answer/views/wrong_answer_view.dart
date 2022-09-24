import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quizu/app/core/colors.dart';
import 'package:quizu/app/core/images.dart';
import 'package:quizu/app/core/text.dart';
import 'package:quizu/app/routes/app_pages.dart';

import '../controllers/wrong_answer_controller.dart';

class WrongAnswerView extends GetView<WrongAnswerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(wrong_answer, width: 300),
            text(
                text:
                    "Sorry ${GetStorage().read('name')}, you chose the wrong answer",
                size: 25.0,
                color: primaryColor,
                fontWeight: FontWeight.bold),
            SizedBox(height: 20),
            MaterialButton(
                color: primaryColor,
                onPressed: () => Get.offAllNamed(AppPages.QUESTIONS),
                child: text(
                    text: "Try Again",
                    size: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))
          ],
        ),
      )),
    );
  }
}
