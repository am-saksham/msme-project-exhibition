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
      padding: const EdgeInsets.symmetric(horizontal: 12.0), // Adjust padding for smaller size
      height: 22, // Set height to 22
      decoration: BoxDecoration(
        border: Border.all(color: borderColor), // Border color
        borderRadius: BorderRadius.circular(25), // Border radius of 25
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: textColor,
            fontWeight: FontWeight.w700, // Adjust font weight if needed
            fontSize: 14, // Adjust font size to fit in the smaller capsule
          ),
        ),
      ),
    );
  }
}