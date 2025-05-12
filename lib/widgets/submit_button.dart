import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SubmitButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5, // Slight elevation
        shadowColor: Colors.teal.withOpacity(0.5),
      ),
      child: Text(
        "Submit",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
