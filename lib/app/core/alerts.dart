import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizu/app/core/colors.dart';
import 'text.dart';

class Alerts {
  alert(title, image) {
    Get.defaultDialog(
      title: '',
      titleStyle: TextStyle(fontSize: 0, height: 0.0),
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: Wrap(children: [
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
              Image.asset(
                image,
                width: 200,
              ),
              const SizedBox(height: 50),
              Text(title.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'myfont',
                      height: 2)),
              const SizedBox(height: 50),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  color: primaryColor,
                ),
                child: Material(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () => Get.back(),
                    splashColor: Colors.black.withOpacity(.2),
                    child: Center(
                      child: text(
                        text: 'Done',
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
