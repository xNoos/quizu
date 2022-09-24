import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:quizu/app/core/alerts.dart';
import 'package:quizu/app/core/database.dart';
import 'package:quizu/app/core/images.dart';
import 'package:simple_timer/simple_timer.dart';
class QuestionsController extends GetxController {

  RxList questions = RxList([]);
  int score = 0;
  RxBool isSkiped = false.obs;
  PageController pageController = PageController(initialPage: 0);
  late Rx<TimerStatus> timer = TimerStatus.pause.obs;
  RxBool loading = false.obs;
  
  getQuestions () async {
    loading.value = true;
    http.get(Uri.parse("${Database().url}Questions"), headers: Database().headersWithToken).then((res){
      var result = jsonDecode(res.body);
      if(res.statusCode == 200) {
        questions.value = result;
        timer.value = TimerStatus.start;
        loading.value = false;
      } else {
        Alerts().alert(result, error);
        loading.value = false;
      }
    });
  }

  saveScore () async {
    List myScore = GetStorage().read("myScore") ?? [];
    
    http.post(Uri.parse('${Database().url}Score'), headers: Database().headersWithToken, body: jsonEncode({"score" : score.toString()})).then((res){
     myScore.add({"date" : DateFormat("d MMM yyyy | hh:mm aa").format(DateTime.now()), "score" : score});
    GetStorage().write("myScore", myScore);
    });
  }

  @override
  void onInit() {
    super.onInit();
    getQuestions();
  }
}
