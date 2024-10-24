import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Helper function to scale font size based on screen width
  static double _scaleFontSize(BuildContext context, double fontSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Scale fontSize based on a reference screen width (e.g., 375)
    return fontSize * (screenWidth / 375.0);
  }

  static TextStyle h1(BuildContext context) {
    return GoogleFonts.montserrat(
      fontSize: _scaleFontSize(context, 24.0),
      fontWeight: FontWeight.bold,
      color: AppColors.text,
    );
  }

  static TextStyle h2(BuildContext context) {
    return GoogleFonts.montserrat(
      fontSize: _scaleFontSize(context, 20.0),
      fontWeight: FontWeight.w600,
      color: AppColors.text,
    );
  }

  static TextStyle h3(BuildContext context) {
    return GoogleFonts.montserrat(
      fontSize: _scaleFontSize(context, 18.0),
      fontWeight: FontWeight.w600,
      color: AppColors.text,
    );
  }

  static TextStyle bodyText(BuildContext context) {
    return GoogleFonts.montserrat(
      fontSize: _scaleFontSize(context, 16.0),
      color: AppColors.text,
    );
  }

  static TextStyle buttonText(BuildContext context) {
    return GoogleFonts.montserrat(
      fontSize: _scaleFontSize(context, 18.0),
      fontWeight: FontWeight.w500,
      color: Colors.white,
    );
  }

  static TextStyle errorText(BuildContext context) {
    return GoogleFonts.montserrat(
      fontSize: _scaleFontSize(context, 14.0),
      color: AppColors.danger,
    );
  }
}
