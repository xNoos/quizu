import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quizu/app/core/database.dart';

class LeaderboardController extends GetxController {
  RxList leaderboard = RxList([]);
  RxBool loading = false.obs;
  getLeaderboard() async {
    loading.value = true;
    http
        .get(Uri.parse('${Database().url}TopScores'),
            headers: Database().headersWithToken)
        .then((res) {
      leaderboard.value = jsonDecode(res.body);
      loading.value = false;
    });
  }

  @override
  void onInit() {
    super.onInit();
    getLeaderboard();
  }
}
