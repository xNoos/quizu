import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

text({@required text, size, color, fontWeight, height, align}) => Text(
      text.toString(),
      textScaleFactor: 1.0,
      overflow: TextOverflow.fade,
      softWrap: true,
      textAlign: align ?? TextAlign.center,
      style: GoogleFonts.aleo(
          fontSize: size,
          color: color,
          fontWeight: fontWeight,
          height: height),
    );