import 'package:flutter/material.dart';
import 'package:flutter_starting_pack/core/themes/app_text.dart';
import 'package:flutter_starting_pack/core/widgets/app_button.dart';
import 'package:flutter_starting_pack/core/widgets/app_input.dart';
import '../core/widgets/app_checklist.dart';
import '../core/widgets/app_dropdown.dart';
import '../core/widgets/app_radio_button.dart';
import '../core/widgets/app_textarea.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  bool _isPasswordVisible = false;
  String? _selectedItem;
  String? _selectedRadio;
  String? _selectedRadioHorizontal;
  List<String> _selectedValuesVertical = []; // For vertical checklist
  List<String> _selectedValuesHorizontal = []; // For horizontal checklist

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sample Page"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            // Removed SizedBox
            children: <Widget>[
              Text(
                "this is h1",
                style: AppTextStyles.h1(context),
              ),
              const SizedBox(height: 20),
              Text(
                "this is h2",
                style: AppTextStyles.h2(context),
              ),
              const SizedBox(height: 20),
              Text(
                "this is h3",
                style: AppTextStyles.h3(context),
              ),
              const SizedBox(height: 20),
              Text(
                "this is body text",
                style: AppTextStyles.bodyText(context),
              ),
              const SizedBox(height: 20),
              AppButton(
                text: "PRIMARY BUTTON",
                onPressed: () {},
                icon: const Icon(Icons.edit_note),
              ),
              const SizedBox(height: 20),
              AppButton(
                text: "SECONDARY BUTTON",
                type: ButtonType.secondary,
                onPressed: () {},
                icon: const Icon(Icons.edit_note),
              ),
              const SizedBox(height: 20),
              AppButton(
                text: "INFO BUTTON",
                type: ButtonType.info,
                onPressed: () {},
                icon: const Icon(Icons.edit_note),
              ),
              const SizedBox(height: 20),
              AppButton(
                text: "SUCCESS BUTTON",
                type: ButtonType.success,
                onPressed: () {},
                icon: const Icon(Icons.edit_note),
              ),
              const SizedBox(height: 20),
              AppButton(
                text: "WARNING BUTTON",
                type: ButtonType.warning,
                onPressed: () {},
                icon: const Icon(Icons.edit_note),
              ),
              const SizedBox(height: 20),
              AppButton(
                text: "DANGER BUTTON",
                type: ButtonType.danger,
                onPressed: () {},
                icon: const Icon(Icons.edit_note),
              ),
              const SizedBox(height: 20),
              const AppTextInput(
                hintText: "text here",
                rightIcon: Icon(Icons.email),
              ),
              const SizedBox(height: 20),
              // Use a TextField for password input with toggleable visibility
              TextField(
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Masukkan password',
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF5F7F9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AppDropdown(
                // label: "Select an option",
                hintText: "Choose one",
                items: const ["Option 1", "Option 2", "Option 3"],
                selectedValue: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              ),
              const SizedBox(height: 20),
              AppTextArea(
                // label: "Comments",
                hintText: "Write your comments here...",
                onChanged: (text) {
                  // Handle text change
                },
              ),
              const SizedBox(height: 20),
              AppRadioButton<String>(
                label: "Choose an option (Horizontal)",
                options: [
                  "Option D",
                  "Option E",
                  "Option F",
                  "Option G",
                  "Option H"
                ],
                selectedValue: _selectedRadioHorizontal,
                onChanged: (value) {
                  setState(() {
                    _selectedRadioHorizontal =
                        value; // Update selected radio value
                  });
                },
                orientation: Axis.horizontal, // Set to horizontal
              ),
              const SizedBox(height: 20),
              AppRadioButton<String>(
                label: "Choose an option (Vertical)",
                options: ["Option A", "Option B", "Option C"],
                selectedValue: _selectedRadio,
                onChanged: (value) {
                  setState(() {
                    _selectedRadio = value; // Update selected radio value
                  });
                },
                orientation: Axis.vertical, // Set to vertical
              ),
              const SizedBox(height: 20),

              // Vertical AppCheckList
              AppCheckList<String>(
                label: "Select your hobbies (Vertical)",
                options: ["Reading", "Traveling", "Cooking", "Gaming"],
                selectedValues: _selectedValuesVertical,
                onChanged: (List<String> selected) {
                  setState(() {
                    _selectedValuesVertical =
                        selected; // Update selected values
                  });
                },
                orientation: Axis.vertical, // Set to vertical
              ),

              const SizedBox(height: 20),

              // Horizontal AppCheckList
              AppCheckList<String>(
                label: "Select your hobbies (Horizontal)",
                options: ["Reading", "Traveling", "Cooking", "Gaming"],
                selectedValues: _selectedValuesHorizontal,
                onChanged: (List<String> selected) {
                  setState(() {
                    _selectedValuesHorizontal =
                        selected; // Update selected values
                  });
                },
                orientation: Axis.horizontal, // Set to horizontal
              ),
            ],
          ),
        ),
      ),
    );
  }
}
