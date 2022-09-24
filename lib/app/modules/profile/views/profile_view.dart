import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quizu/app/core/textfields.dart';
import 'package:quizu/app/routes/app_pages.dart';

import '../../../core/colors.dart';
import '../../../core/text.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: text(
              text: 'Profile',
              size: 22.0,
              color: primaryColor,
              fontWeight: FontWeight.bold),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: primaryColor),
          automaticallyImplyLeading: false,
          actions: [
            GestureDetector(
                onTap: () => logout(),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.logout)))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text(
                  text: 'Name',
                  size: 25.0,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: textfieldColor,
                    child: Center(
                        child: controller.loading.value
                            ? SpinKitThreeBounce(color: primaryColor)
                            : text(
                                text: controller.name,
                                color: Colors.black,
                                size: 20.0,
                                fontWeight: FontWeight.bold))),
              ),
              SizedBox(height: 25),
              text(
                  text: 'Phone Number',
                  size: 25.0,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: textfieldColor,
                    child: Center(
                        child: controller.loading.value
                            ? SpinKitThreeBounce(color: primaryColor)
                            : text(
                                text: controller.mobile,
                                color: Colors.black,
                                size: 20.0,
                                fontWeight: FontWeight.bold))),
              ),
              SizedBox(height: 30),
              text(
                  text: 'My Score',
                  size: 25.0,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
              Expanded(
                child: controller.myScore.isEmpty
                    ? Center(
                        child: text(
                            text: "You have no Scores",
                            size: 20.0,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      )
                    : ListView.builder(
                        itemCount: controller.myScore.length,
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
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        color: textfieldColor,
                                        child: Center(
                                          child: text(
                                              text: controller.myScore[index]
                                                  ['date'],
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
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      color: primaryColor,
                                      child: Center(
                                        child: text(
                                            text: controller.myScore[index]
                                                ['score'],
                                            size: 20.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                              ],
                            ),
                          );
                        }),
              ),
            ],
          ),
        ),
      );
    });
  }

  logout() {
    Get.defaultDialog(
      title: '',
      titleStyle: TextStyle(fontSize: 0, height: 0.0),
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: Column(children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: double.infinity,
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.black,
                  )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text("Are you sure you want to logout?",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'myfont',
                      height: 2)),
              const SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        color: primaryColor,
                      ),
                      child: Material(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {
                            GetStorage().erase();
                            Get.offAllNamed(AppPages.SPLASH_SCREEN);
                          },
                          splashColor: Colors.black.withOpacity(.2),
                          child: Center(
                            child: text(
                              text: 'Yes',
                              size: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        color: cardColors,
                      ),
                      child: Material(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () => Get.back(),
                          splashColor: Colors.black.withOpacity(.2),
                          child: Center(
                            child: text(
                              text: 'No',
                              size: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
