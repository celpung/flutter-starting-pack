import 'package:flutter/material.dart';
import 'package:flutter_starting_pack/core/themes/app_text.dart';

class AppCheckList<T> extends StatefulWidget {
  final String? label;
  final List<T> options; // List of options for the checkboxes
  final List<T> selectedValues; // Currently selected values
  final ValueChanged<List<T>>?
      onChanged; // Callback for when the selected values change
  final Color? labelColor; // Color for the label text
  final Axis orientation; // Orientation of the checklist

  const AppCheckList({
    super.key,
    this.label,
    required this.options,
    required this.selectedValues,
    this.onChanged,
    this.labelColor,
    this.orientation = Axis.vertical, // Default to vertical orientation
  });

  @override
  State<AppCheckList<T>> createState() => _AppCheckListState<T>();
}

class _AppCheckListState<T> extends State<AppCheckList<T>> {
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
        // Change the orientation of the checkboxes
        widget.orientation == Axis.vertical
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.options.map((option) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: widget.selectedValues.contains(option),
                        onChanged: (bool? isChecked) {
                          setState(() {
                            if (isChecked == true) {
                              // Add the option to selected values
                              widget.selectedValues.add(option);
                            } else {
                              // Remove the option from selected values
                              widget.selectedValues.remove(option);
                            }
                            // Call the onChanged callback
                            if (widget.onChanged != null) {
                              widget.onChanged!(widget.selectedValues);
                            }
                          });
                        },
                      ),
                      const SizedBox(
                          width: 4), // Reduced space between checkbox and title
                      Expanded(
                        child: Text(
                          option.toString(),
                          style: TextStyle(
                              color: widget.labelColor ?? Colors.black),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              )
            : Wrap(
                // Use Wrap to allow items to flow to the next line
                spacing: 8.0, // Space between items horizontally
                children: widget.options.map((option) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: widget.selectedValues.contains(option),
                        onChanged: (bool? isChecked) {
                          setState(() {
                            if (isChecked == true) {
                              // Add the option to selected values
                              widget.selectedValues.add(option);
                            } else {
                              // Remove the option from selected values
                              widget.selectedValues.remove(option);
                            }
                            // Call the onChanged callback
                            if (widget.onChanged != null) {
                              widget.onChanged!(widget.selectedValues);
                            }
                          });
                        },
                      ),
                      const SizedBox(
                          width: 4), // Space between checkbox and title
                      Text(
                        option.toString(),
                        style:
                            TextStyle(color: widget.labelColor ?? Colors.black),
                      ),
                    ],
                  );
                }).toList(),
              ),
      ],
    );
  }
}
