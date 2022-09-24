import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:quizu/app/core/colors.dart';
import 'package:quizu/app/core/images.dart';

import '../../../core/text.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: text(
            text: 'Phone Verification',
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
        child: Column(
          children: [
            Image.asset(otp),
            SizedBox(height: 50),
            Form(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: PinCodeTextField(
                    textInputAction: TextInputAction.done,
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    keyboardType: TextInputType.numberWithOptions(
                        signed: true, decimal: false),
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.scale,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      selectedFillColor: primaryColor.withOpacity(.7),
                      activeColor: textfieldColor,
                      selectedColor: textfieldColor,
                      inactiveFillColor: textfieldColor,
                      inactiveColor: textfieldColor.withOpacity(.5),
                      activeFillColor: primaryColor,
                      borderRadius: BorderRadius.circular(15),
                      fieldHeight: 60,
                      fieldWidth: 60,
                    ),
                    cursorColor: Colors.transparent,
                    animationDuration: Duration(milliseconds: 300),
                    textStyle: TextStyle(
                        fontSize: 20, height: 1.6, color: Colors.white),
                    enableActiveFill: true,
                    controller: controller.code,
                    onChanged: (value) {
                      controller.code.text = value;
                    },
                  )),
            ),
            SizedBox(height: 30),
            Obx(() {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: MaterialButton(
                    color: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    onPressed: () => controller.confirm(),
                    child: controller.load.value
                        ? SpinKitThreeBounce(color: Colors.white)
                        : text(
                            text: 'Confirm',
                            size: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                  ),
                ),
              );
            }),
          ],
        ),
      )),
    );
  }
}
