import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:quizu/app/core/images.dart';
import 'package:quizu/app/core/textfields.dart';

import '../../../core/colors.dart';
import '../../../core/text.dart';
import '../controllers/create_username_controller.dart';

class CreateUsernameView extends GetView<CreateUsernameController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: text(
                text: 'Create Username',
                size: 22.0,
                color: primaryColor,
                fontWeight: FontWeight.bold),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: primaryColor),
          ),
          body: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: [
                  Image.asset(
                    username,
                    width: 250,
                  ),
                  SizedBox(height: 60),
                  textfield("Name", controller.name),
                  SizedBox(height: 50),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: MaterialButton(
                      color: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      onPressed: () => controller.start(),
                      child: controller.load.value
                          ? SpinKitThreeBounce(color: Colors.white)
                          : text(
                              text: 'Start',
                              size: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
