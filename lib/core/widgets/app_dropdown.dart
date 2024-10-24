import 'package:flutter/material.dart';
import 'package:flutter_starting_pack/core/themes/app_text.dart';

class AppDropdown extends StatefulWidget {
  final String? label;
  final String hintText;
  final List<String> items; // List of items for the dropdown
  final String? selectedValue; // Currently selected value
  final ValueChanged<String?>?
      onChanged; // Callback for when the selected value changes
  final Color? backgroundColor; // Background color for the dropdown
  final Color? hintTextColor; // Color for the hint text

  const AppDropdown({
    super.key,
    this.label,
    required this.hintText,
    required this.items,
    this.selectedValue,
    this.onChanged,
    this.backgroundColor,
    this.hintTextColor,
  });

  @override
  State<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: AppTextStyles.bodyText(context),
          ),
          const SizedBox(height: 8),
        ],
        Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? const Color(0xFFF5F7F9),
            borderRadius: BorderRadius.circular(12),
            // Set border to none
            border: const Border(
              top: BorderSide.none,
              bottom: BorderSide.none,
              left: BorderSide.none,
              right: BorderSide.none,
            ),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 12), // Add padding to the container
          child: DropdownButtonHideUnderline(
            // Hide the underline
            child: DropdownButton<String>(
              isExpanded: true, // Ensures dropdown takes full width
              value: widget.selectedValue,
              hint: Text(
                widget.hintText,
                style: TextStyle(
                  color: widget.hintTextColor ?? Colors.grey,
                ),
              ),
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 16,
              style: AppTextStyles.bodyText(context).copyWith(
                color: Colors.black, // Text color for selected item
              ),
              onChanged: widget.onChanged,
              items: widget.items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0), // Vertical padding for items
                    child: Text(value),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
