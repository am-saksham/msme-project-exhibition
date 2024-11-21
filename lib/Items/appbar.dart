import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:msme_exhibition/Screens/login_screen.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String title;
  final double expandedHeight;
  final String? backgroundImage;
  final String? subtitle;

  const CustomSliverAppBar({
    Key? key,
    required this.title,
    this.expandedHeight = 200.0,
    this.backgroundImage,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check if the current screen is the LoginScreen
    bool isLoginScreen = ModalRoute.of(context)?.settings.name == '/login';

    return SliverAppBar(
      backgroundColor: Colors.black54,
      pinned: true,
      expandedHeight: expandedHeight,
      iconTheme: const IconThemeData(
        color: Colors.white, // Sets the back button color to white
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: backgroundImage != null
            ? Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              backgroundImage!,
              fit: BoxFit.cover,
            ),
            if (subtitle != null)
              Positioned(
                bottom: 20,
                left: 16,
                right: 16,
                child: Text(
                  subtitle!,
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
          ],
        )
            : null,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.nunito(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_rounded, color: Colors.white),
              ),
              // Disable the person icon if already on LoginScreen
              IconButton(
                onPressed: isLoginScreen ? null : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.person, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}