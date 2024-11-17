import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:msme_exhibition/Items/collection_box.dart';

import '../Dataset/box_data.dart';
import '../Items/capsule.dart';
import '../Items/rounded_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Refactored method for displaying collection sections
  Widget buildCollectionSection(String label, String imagePath, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: RoundedRectangle(
        imagePath: imagePath,
        height: height,
        labelText: label,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> roundedBoxes = boxDataset.map((box) => RoundedBox(
      imagePath: box.imagePath,
      productName: box.productName,
      price: box.price,
    )).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFAE9F5),
      body: CustomScrollView(
        slivers: [
          // SliverAppBar for the app bar that stays visible
          SliverAppBar(
            backgroundColor: Colors.black54,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.8,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'images/app-images/hero-1.jpeg',
                    fit: BoxFit.cover,
                  ),
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
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Micro Mart',
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

          // Sliver for the rest of the content
          SliverList(
            delegate: SliverChildListDelegate([
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
                      rowWidth += capsule.text.length * 10 + 40;
                      if (rowWidth > constraints.maxWidth) {
                        isOverflowing = true;
                        break;
                      }
                    }

                    return Row(
                      children: [
                        for (int i = 0; i < capsules.length; i++) ...[
                          capsules[i],
                          if (i != capsules.length - 1) const SizedBox(width: 8),
                        ],
                        if (isOverflowing)
                          const Icon(Icons.arrow_forward, color: Color(0xFFFF5A1E)),
                        if (!isOverflowing)
                          const SizedBox(width: 8),
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
                    List<Widget> rows = [];
                    for (int i = 0; i < roundedBoxes.length; i += boxesPerRow) {
                      rows.add(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int j = i; j < i + boxesPerRow && j < roundedBoxes.length; j++) ...[
                              Expanded(child: roundedBoxes[j]),
                              if (j < i + boxesPerRow - 1) const SizedBox(width: 16),
                            ],
                          ],
                        ),
                      );
                      if (i + boxesPerRow < roundedBoxes.length) {
                        rows.add(const SizedBox(height: 16));
                      }
                    }

                    return Column(
                      children: rows,
                    );
                  },
                ),
              ),

              // "Collections" title below the boxes
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 5.0),
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

              // Using the refactored method for each collection section
              buildCollectionSection('Men', 'images/app-images/men_collection.jpg', 250.0),
              buildCollectionSection('Women', 'images/app-images/women_collection.jpg', 250.0),
              buildCollectionSection('Electronics', 'images/app-images/electronics_collection.jpg', 250.0),
              buildCollectionSection('Jewellery', 'images/app-images/jewellery_collection.jpg', 250.0),
              buildCollectionSection('All', 'images/app-images/all_collection.jpg', 450.0),
            ]),
          ),
        ],
      ),
    );
  }
}