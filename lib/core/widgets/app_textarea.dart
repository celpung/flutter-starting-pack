import 'package:flutter/material.dart';
import 'package:flutter_starting_pack/core/themes/app_text.dart';

class AppTextArea extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String hintText;
  final Color? backgroundColor;
  final Color? hintTextColor;
  final ValueChanged<String>? onChanged;

  const AppTextArea({
    super.key,
    this.controller,
    this.label,
    required this.hintText,
    this.backgroundColor,
    this.hintTextColor,
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
          maxLines: 5, // Set max lines for the TextArea
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: hintTextColor ?? Colors.grey,
            ),
            filled: true,
            fillColor: backgroundColor ?? const Color(0xFFF5F7F9),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none, // No border
            ),
          ),
        ),
      ],
    );
  }
}
