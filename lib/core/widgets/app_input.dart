import 'package:flutter/material.dart';
import 'package:flutter_starting_pack/core/themes/app_text.dart';

class AppTextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String hintText;
  final Widget? rightIcon;
  final Color? backgroundColor;
  final Color? hintTextColor;
  final bool isPassword;
  final ValueChanged<String>? onChanged;

  const AppTextInput({
    super.key,
    this.controller,
    this.label,
    required this.hintText,
    this.rightIcon,
    this.backgroundColor,
    this.hintTextColor,
    this.isPassword = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: AppTextStyles.bodyText(context),
          ),
          const SizedBox(height: 8),
        ],
        TextField(
          controller: controller,
          obscureText: isPassword,
          onChanged: onChanged, // Use the onChanged callback
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: hintTextColor ?? Colors.grey,
            ),
            suffixIcon: rightIcon, // Use the rightIcon as a widget
            filled: true,
            fillColor: backgroundColor ?? const Color(0xFFF5F7F9),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
