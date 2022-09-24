import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizu/app/core/colors.dart';
import 'package:quizu/app/core/images.dart';
import 'package:quizu/app/core/text.dart';
import 'package:quizu/app/core/textfields.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                Image.asset(
                  login,
                  width: 250,
                ),
                SizedBox(height: 60),
                phoneField("Phone Number", controller.mobile),
                SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: MaterialButton(
                    color: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    onPressed: () => controller.login(),
                    child: text(
                      text: 'Login',
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
  }
}
