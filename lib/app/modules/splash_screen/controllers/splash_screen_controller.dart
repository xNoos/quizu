import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quizu/app/core/alerts.dart';
import 'package:quizu/app/core/database.dart';
import 'package:quizu/app/core/images.dart';
import 'package:quizu/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  late Timer timer;

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(Duration(seconds: 2), (_) {
      if (GetStorage().read('token') == null ||
          GetStorage().read('name') == null) {
        Get.offAllNamed(AppPages.LOGIN);
        timer.cancel();
      } else {
        timer.cancel();
        http
            .get(Uri.parse('${Database().url}Token'),
                headers: Database().headersWithToken)
            .then((res) {
          var result = jsonDecode(res.body);
          if (result['message'] == "Unauthorized! your token is invalid") {
            Get.offAllNamed(AppPages.LOGIN);
          } else if (result['message'] == "Your token is valid!") {
            Get.offAllNamed(AppPages.MAIN_SCREEN);
          } else {
            Alerts().alert(result.toString(), error);
            timer.cancel();
          }
        });
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    timer.cancel();
  }
}
