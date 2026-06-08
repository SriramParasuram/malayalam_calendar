import 'package:flutter/material.dart';

/// Centralised palette for the skeuomorphic wall-calendar aesthetic.
///
/// The colours are deliberately warm and desaturated to mimic painted plaster
/// and aged paper rather than flat material surfaces.
class AppColors {
  AppColors._();

  /// Base colour of the painted "wall" behind the calendar.
  static const Color wall = Color(0xFFF2EFE9);
  static const Color wallShade = Color(0xFFE7E2D9);

  /// Off-white "paper" tones used for the calendar sheet.
  static const Color paper = Color(0xFFFBF8F1);
  static const Color paperShade = Color(0xFFEDE7D8);
  static const Color paperEdge = Color(0xFFD9D0BD);

  /// Ink colours.
  static const Color ink = Color(0xFF2C2A26);
  static const Color inkSoft = Color(0xFF6E665A);

  /// Accent red used for Sundays / holidays on physical calendars.
  static const Color holiday = Color(0xFFB23A2E);

  /// Plastic hook/hanger tones.
  static const Color hook = Color(0xFFDDDAD3);
  static const Color hookShade = Color(0xFFB9B4AA);
}
