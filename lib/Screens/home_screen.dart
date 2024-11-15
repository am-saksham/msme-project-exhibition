import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Dataset/box_data.dart';
import '../Items/capsule.dart';
import '../Items/rounded_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<Widget> roundedBoxes = boxDataset.map((box) => RoundedBox(
      imagePath: box.imagePath,
      productName: box.productName,
      price: box.price,
    )).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFAE9F5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with fixed height
            Stack(
              children: [
                Image.asset(
                  'images/app-images/hero-1.jpeg',
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: double.infinity,
                ),

                // Transparent app bar in front of the image
                Positioned(
                  top: 67,
                  left: 16,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Micro Mart',
                        style: GoogleFonts.nunito(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: Colors.white, // Set text color to stand out on the image
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
                            icon: const Icon(Icons.shopping_bag, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.person, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Bottom text overlay aligned with the end of the image
                Positioned(
                  bottom: 20,
                  left: 16,
                  right: 16,
                  child: Text(
                    'ACCESS RESOURCES, TOOLS, AND\nSUPPORT TAILORED TO\nYOUR BUSINESS NEEDS.',
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
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 5.0),
              child: Text(
                "Quick View",
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFFFF5A1E),
                ),
                textAlign: TextAlign.left,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 8.0, bottom: 10.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  bool isOverflowing = false;
                  double rowWidth = 0;

                  List<Capsule> capsules = [
                    const Capsule(text: "All", textColor: Colors.black, borderColor: Colors.black),
                    const Capsule(text: "Men", textColor: Colors.black, borderColor: Colors.black),
                    const Capsule(text: "Women", textColor: Colors.black, borderColor: Colors.black),
                    const Capsule(text: "Electronics", textColor: Colors.black, borderColor: Colors.black),
                  ];

                  for (var capsule in capsules) {
                    // Calculate the width based on the length of each capsule's text
                    rowWidth += capsule.text.length * 10 + 40; // Approximate width per character + padding
                    if (rowWidth > constraints.maxWidth) {
                      isOverflowing = true;
                      break;
                    }
                  }

                  return Row(
                    children: [
                      // Adding SizedBox between capsules
                      for (int i = 0; i < capsules.length; i++) ...[
                        capsules[i],
                        if (i != capsules.length - 1) const SizedBox(width: 8),
                      ],
                      if (isOverflowing)
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward, color: Color(0xFFFF5A1E)),
                      if (!isOverflowing)
                        const SizedBox(width: 8), // Space between capsules and "More"
                      if (!isOverflowing)
                        const Text(
                          "More",
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFFFF5A1E),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),

            // Rounded border boxes below capsules, two in a row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int boxesPerRow = constraints.maxWidth > 800 ? 3 : 2;
                  // Create rows dynamically based on the number of boxes
                  List<Widget> rows = [];
                  for (int i = 0; i < roundedBoxes.length; i += boxesPerRow) {
                    rows.add(
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int j = i; j < i + boxesPerRow && j < roundedBoxes.length; j++) ...[
                            Expanded(child: roundedBoxes[j]), // Use the RoundedBox widget here
                            if (j < i + boxesPerRow - 1) const SizedBox(width: 16),
                          ],
                        ],
                      ),
                    );
                    if (i + boxesPerRow < roundedBoxes.length) {
                      rows.add(const SizedBox(height: 16)); // Add space between rows
                    }
                  }

                  return Column(
                    children: rows,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0, bottom: 10.0),
              child: Text(
                "Collections",
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFFFF5A1E),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}