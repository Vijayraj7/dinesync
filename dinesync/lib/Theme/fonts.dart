import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fonts {
  static TextStyle primary({TextStyle? style}) {
    return GoogleFonts.montserrat(
        textStyle:
            style != null ? style : TextStyle(fontWeight: FontWeight.w600));
  }

  static TextStyle secondary({TextStyle? style}) {
    return GoogleFonts.karla(textStyle: style);
  }

  static TextStyle fsecondary({required TextStyle style}) {
    return GoogleFonts.lobster(
      textStyle: style,
    );
  }

  static TextStyle fprimary({required TextStyle style}) {
    return GoogleFonts.comfortaa(
      textStyle: style,
    );
  }

  static TextStyle normal({required TextStyle style}) {
    return style;
  }

  static TextStyle title({required TextStyle style}) {
    return GoogleFonts.mulish(
      textStyle: style,
    );
  }

  static TextStyle pricetitle({required TextStyle style}) {
    return GoogleFonts.mukta(
      textStyle: style,
    );
  }

  static TextStyle abril({required TextStyle style}) {
    return GoogleFonts.abrilFatface(
      textStyle: style,
    );
  }
}
