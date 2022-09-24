import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:quizu/app/core/alerts.dart';
import 'package:quizu/app/core/database.dart';
import 'package:quizu/app/core/images.dart';
import 'package:quizu/app/routes/app_pages.dart';

class CreateUsernameController extends GetxController {
  TextEditingController name = TextEditingController();
  RxBool load = false.obs;
  start() async {
    print(GetStorage().read("token"));
    if (name.text.trim().isEmpty) {
      Alerts().alert("Please Enter The Name", alert);
    } else {
      load.value = true;
      Map body = {"name": name.text};
      http
          .post(Uri.parse('${Database().url}Name'),
              headers: Database().headersWithToken, body: body)
          .then((res) {
        var result = jsonDecode(res.body);
        if (res.statusCode == 201) {
          load.value = false;
          print(result);
          GetStorage().write('name', result['name']);
          GetStorage().write('mobile', result['mobile']);
          Get.offAllNamed(AppPages.MAIN_SCREEN);
        } else {
          load.value = false;
          Alerts().alert(result, error);
        }
      });
    }
  }
}
