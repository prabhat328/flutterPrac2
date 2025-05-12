import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?) validator;
  final bool readOnly;
  final Widget? suffixIcon;

  const InputField({super.key, 
    required this.controller,
    required this.label,
    required this.validator,
    this.readOnly = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: Colors.teal, // Custom label color
              fontWeight: FontWeight.bold,
            ),
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.teal),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.teal, width: 2),
            ),
            errorStyle: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          validator: validator,
          readOnly: readOnly,
        ),
      ),
    );
  }
}
