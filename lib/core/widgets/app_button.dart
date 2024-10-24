import 'package:flutter/material.dart';
import '../themes/app_colors.dart';
import '../themes/app_text.dart';

// Define an enum for button types
enum ButtonType { primary, secondary, info, success, warning, danger }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type; // Add a button type parameter
  final double width;
  final double? height; // Make height nullable to calculate responsively
  final Icon? icon; // Optional icon
  final double borderRadius; // New property to control corner radius

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.primary, // Default to primary button type
    this.width = double.infinity,
    this.height, // Default height is nullable
    this.icon, // Optional icon
    this.borderRadius = 8.0, // Default border radius (you can customize it)
  });

  @override
  Widget build(BuildContext context) {
    // Determine the button color based on the button type
    Color buttonColor;
    switch (type) {
      case ButtonType.primary:
        buttonColor = AppColors.primary;
        break;
      case ButtonType.secondary:
        buttonColor = AppColors.secondary;
        break;
      case ButtonType.info:
        buttonColor = AppColors.info;
        break;
      case ButtonType.success:
        buttonColor = AppColors.success;
        break;
      case ButtonType.warning:
        buttonColor = AppColors.warning;
        break;
      case ButtonType.danger:
        buttonColor = AppColors.danger;
        break;
    }

    // Calculate responsive height based on device height
    final double screenHeight = MediaQuery.of(context).size.height;
    final double responsiveHeight =
        height ?? screenHeight * 0.06; // Default to 7% of screen height

    // Get the text style to extract its color for the icon
    final textStyle = AppTextStyles.buttonText(context);
    final textColor =
        textStyle.color ?? Colors.white; // Fallback to white if null

    return SizedBox(
      width: width,
      height: responsiveHeight, // Use responsive height
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(borderRadius), // Custom border radius
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: textStyle,
            ),
            if (icon != null) ...[
              const SizedBox(width: 8), // Spacing between text and icon
              Icon(
                icon!.icon,
                color: textColor, // Set icon color to match the text color
              ),
            ],
          ],
        ),
      ),
    );
  }
}
