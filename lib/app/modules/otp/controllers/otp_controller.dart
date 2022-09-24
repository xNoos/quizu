import 'dart:async';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/alerts.dart';
import '../../../core/database.dart';
import '../../../core/images.dart';
import '../../../routes/app_pages.dart';

class OtpController extends GetxController {
  TextEditingController code = TextEditingController();
  RxBool load = false.obs;
  String mobile = Get.arguments[0];
  RxInt time = RxInt(60);
  RxString resend = RxString('Resend SMS Code');

  @override
  void onInit() {
    super.onInit();

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (time.value > 0) {
        time.value -= 1;
        resend.value = 'Resend SMS Code ($time)';
      } else {
        resend.value = 'Resend SMS Code';
      }
    });
  }

  confirm() {
    if (code.text.isEmpty) {
      Alerts().alert('Please Enter The Code', alert);
    } else {
      load.value = true;
      Map body = {"mobile": mobile, "OTP": code.text};
      http
          .post(Uri.parse('${Database().url}login'),
              headers: Database().headers, body: jsonEncode(body))
          .then((res) {
        var result = jsonDecode(res.body);
        if (result['message'] == "Unauthorized! Your OTP is invalid") {
          Alerts().alert("Code is Wrong", error);
          load.value = false;
        } else if (result['success']) {
          load.value = false;
          GetStorage().write("token", result['token']);

          if (result['user_status'] == "new" || result['name'] == null) {
            Get.toNamed(AppPages.CREATE_USERNAME);
          } else {
            GetStorage().write("mobile", result['mobile']);
            GetStorage().write("name", result['name']);
            Get.offAllNamed(AppPages.MAIN_SCREEN);
          }
        } else {
          load.value = false;
          Alerts().alert(result, error);
        }
      });
    }
  }
}
