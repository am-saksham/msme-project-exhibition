// capsule.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Capsule extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color borderColor;

  const Capsule({
    Key? key,
    required this.text,
    required this.textColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0), // Adjust padding
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 12, // Slightly smaller font for better fit
        ),
      ),
    );
  }
}