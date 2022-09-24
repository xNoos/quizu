import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../core/database.dart';

class ProfileController extends GetxController {
  RxList myScore = RxList([]);
  RxString mobile = ''.obs;
  RxString name = ''.obs;
  RxBool loading = false.obs;

  getUserInfo() async {
    loading.value = true;
    http
        .get(Uri.parse('${Database().url}UserInfo'),
            headers: Database().headersWithToken)
        .then((res) {
      mobile.value = jsonDecode(res.body)['mobile'];
      name.value = jsonDecode(res.body)['name'];
      loading.value = false;
    });
  }

  @override
  void onInit() {
    super.onInit();
    myScore.value = GetStorage().read('myScore') ?? [];
    getUserInfo();
  }
}
