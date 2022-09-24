import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'text.dart';

TextStyle ts = GoogleFonts.aleo(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
          height: 1.5,
          color: primaryColor
);

double size = 20.0;

textfield(label, control) => TextField(
      textInputAction: TextInputAction.done,
      controller: control,
      style: ts,
      cursorColor: primaryColor,
      decoration: InputDecoration(
          fillColor: textfieldColor,
          filled: true,
          label: text(
              text: label,
              color: primaryColor.withOpacity(.5),
              fontWeight: FontWeight.bold,
              size: size),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: primaryColor))),
    );

  

phoneField(label, control) => TextField(
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      keyboardType:
          TextInputType.numberWithOptions(signed: true, decimal: false),
      textDirection: TextDirection.ltr,
      maxLength: 9,
      controller: control,
      style: ts,
      cursorColor: primaryColor,
      decoration: InputDecoration(
          fillColor: textfieldColor,
          filled: true,
          counterText: '',
          prefix: text(text: '+966  '),
          hintTextDirection: TextDirection.ltr,
          label: text(
              text: label,
              color: primaryColor.withOpacity(.5),
              fontWeight: FontWeight.bold,
              size: size),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: primaryColor))),
    );