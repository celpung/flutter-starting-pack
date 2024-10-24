import 'package:flutter/material.dart';
import 'package:flutter_starting_pack/core/themes/app_text.dart';

class AppRadioButton<T> extends StatelessWidget {
  final String? label;
  final List<T> options; // List of options for the radio buttons
  final T? selectedValue; // Currently selected value
  final ValueChanged<T?>?
      onChanged; // Callback for when the selected value changes
  final Color? labelColor; // Color for the label text
  final Axis orientation; // Orientation of the radio buttons

  const AppRadioButton({
    super.key,
    this.label,
    required this.options,
    this.selectedValue,
    this.onChanged,
    this.labelColor,
    this.orientation = Axis.vertical, // Default to vertical orientation
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
        // Change the orientation of the radio buttons
        orientation == Axis.vertical
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: options.map((option) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio<T>(
                        value: option,
                        groupValue: selectedValue,
                        onChanged: onChanged,
                        activeColor: Colors.deepPurple,
                      ),
                      const SizedBox(width: 4), // Control spacing
                      Expanded(
                        child: Text(
                          option.toString(),
                          style: TextStyle(color: labelColor ?? Colors.black),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              )
            : Wrap(
                // Use Wrap to allow items to flow to the next line
                spacing: 8.0, // Space between items horizontally
                children: options.map((option) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio<T>(
                        value: option,
                        groupValue: selectedValue,
                        onChanged: onChanged,
                        activeColor: Colors.deepPurple,
                      ),
                      const SizedBox(width: 4), // Space between radio and text
                      Text(
                        option.toString(),
                        style: TextStyle(color: labelColor ?? Colors.black),
                      ),
                    ],
                  );
                }).toList(),
              ),
      ],
    );
  }
}
