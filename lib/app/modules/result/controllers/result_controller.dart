import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ResultController extends GetxController {
  RxInt score = RxInt(Get.arguments[0]);
  share(context) async {
    final box = context.findRenderObject() as RenderBox?;

    await Share.share(
      "I answered $score correct answers in QuizU!",
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }
}
