import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_number/phone_number.dart';
import 'package:quizu/app/core/alerts.dart';
import 'package:quizu/app/core/images.dart';
import 'package:quizu/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController mobile = TextEditingController();

  login() async {
    if (mobile.text.trim().isEmpty) {
      Alerts().alert("Please Enter The Phone Number", alert);
    } else {
      bool isValid = await PhoneNumberUtil().validate("+966${mobile.text}");
      isValid
          ? Get.toNamed(AppPages.OTP, arguments: ["+966${mobile.text}"])
          : Alerts().alert("The Phone Number is Wrong", alert);
    }
  }
}
