import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import '../../../core/colors.dart';
import '../../../core/text.dart';
import '../controllers/leaderboard_controller.dart';

class LeaderboardView extends GetView<LeaderboardController> {
  @override
  Widget build(BuildContext context) {
    Get.put(LeaderboardController());
    return Obx(() {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: text(
                text: 'Leaderboard',
                size: 22.0,
                color: primaryColor,
                fontWeight: FontWeight.bold),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: primaryColor),
            automaticallyImplyLeading: false,
          ),
          body: controller.loading.value
              ? Center(child: SpinKitThreeBounce(color: primaryColor))
              : ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  itemCount: controller.leaderboard.length,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: textfieldColor,
                                  child: Center(
                                    child: text(
                                        text: controller.leaderboard[index]
                                            ['name'],
                                        size: 20.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 50,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: primaryColor,
                                child: Center(
                                  child: text(
                                      text: controller.leaderboard[index]
                                          ['score'],
                                      size: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                    );
                  }));
    });
  }
}
