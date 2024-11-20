import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Items/appbar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            title: 'Micro Mart',
            expandedHeight: 50.0, // Optional: you can add a subtitle here
          ),
          SliverFillRemaining(
            child: Container(
              color: const Color(0xFFFAE9F5), // Set background color here
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 20.0), // Padding from left and top
                child: Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    fontSize: 36, // Adjust font size as needed
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFF5A1E), // Title color
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}