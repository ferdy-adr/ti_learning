import 'package:flutter/material.dart';

abstract class Fonts {
  static const TextStyle poppins = TextStyle(
    fontFamily: 'Poppins',
    color: Colors.white,
    leadingDistribution: TextLeadingDistribution.even,
    letterSpacing: 0,
  );
  static const TextStyle mainText = TextStyle(
    fontFamily: 'Poppins',
    color: Colors.white,
    leadingDistribution: TextLeadingDistribution.even,
    letterSpacing: 0,
  );
  static const TextStyle buttonText = TextStyle(
    fontFamily: 'Poppins',
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    leadingDistribution: TextLeadingDistribution.even,
    letterSpacing: 0,
  );
  static const TextStyle hintText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    leadingDistribution: TextLeadingDistribution.even,
    letterSpacing: 0,
  );
}
