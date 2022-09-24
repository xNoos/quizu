import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:quizu/app/core/alerts.dart';
import 'package:quizu/app/core/images.dart';
import 'package:quizu/app/routes/app_pages.dart';
import 'package:simple_timer/simple_timer.dart';
import '../../../core/colors.dart';
import '../../../core/text.dart';
import '../controllers/questions_controller.dart';

class QuestionsView extends GetView<QuestionsController> {
  @override
  Widget build(BuildContext context) {
    Get.put(QuestionsController());
    return Obx(() {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: text(
                text: 'Questions',
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
              ? SpinKitThreeBounce(color: primaryColor)
              : Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                        width: 180,
                        height: 180,
                        child: SimpleTimer(
                          status: controller.timer.value,
                          progressTextStyle: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                          duration: Duration(minutes: 2),
                          strokeWidth: 15.0,
                          onEnd: () {
                            Get.offAllNamed(AppPages.RESULT,
                                arguments: [controller.score]);
                            controller.saveScore();
                          },
                          progressIndicatorColor: primaryColor,
                        )),
                    SizedBox(height: 40),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: PageView.builder(
                            itemCount: controller.questions.length,
                            controller: controller.pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(35),
                                            bottomRight: Radius.circular(35))),
                                    child: text(
                                        text: 'Question ${index + 1}',
                                        size: 35.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: primaryColor),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        children: [
                                          text(
                                              text: controller.questions[index]
                                                  ['Question'],
                                              size: 20.0,
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold),
                                          SizedBox(height: 30),
                                          answers(
                                              controller.questions[index], "a"),
                                          SizedBox(height: 10),
                                          answers(
                                              controller.questions[index], "b"),
                                          SizedBox(height: 10),
                                          answers(
                                              controller.questions[index], "c"),
                                          SizedBox(height: 10),
                                          answers(
                                              controller.questions[index], "d"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                  Visibility(
                                    visible: !controller.isSkiped.value,
                                    child: MaterialButton(
                                      color: cardColors,
                                      onPressed: () {
                                        skipDialog();
                                      },
                                      child: text(text: 'Skip', size: 20.0),
                                    ),
                                  )
                                ],
                              );
                            }),
                      ),
                    ),
                  ],
                ));
    });
  }

  answers(answers, answer) => SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
            onPressed: () {
              if (answer == answers['correct']) {
                controller.score++;
                if (controller.pageController.page !=
                    controller.questions.length.toDouble() - 1.0) {
                  controller.pageController.nextPage(
                      duration: Duration(milliseconds: 1), curve: Curves.ease);
                } else {
                  Get.offAllNamed(AppPages.RESULT,
                      arguments: [controller.score]);
                  controller.saveScore();
                }
              } else {
                Get.offAllNamed(AppPages.WRONG_ANSWER);
              }
            },
            child:
                text(text: answers[answer], size: 18.0, color: Colors.white)),
      );

  skipDialog() {
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
              Text(
                  "You can only use the Skip Question button once. Are you sure?",
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
                            controller.isSkiped.value = true;
                            controller.pageController.nextPage(
                                duration: Duration(milliseconds: 1),
                                curve: Curves.ease);
                            Get.back();
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
