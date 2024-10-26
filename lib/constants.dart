import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

TextStyle loginStyle(Size size) {
  return GoogleFonts.ubuntu(
      fontSize: size.height * 0.060, fontWeight: FontWeight.bold);
}

TextStyle termsAndCondition(Size size) {
  return GoogleFonts.ubuntu(fontSize: size.height * 0.1, color: Colors.blue);
}
