import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:msme_exhibition/Items/collection_box.dart';
import 'package:msme_exhibition/Items/footer_section.dart';
import 'package:msme_exhibition/Items/help_section.dart';

import '../Dataset/box_data.dart';
import '../Items/capsule.dart';  // Import Capsule widget
import '../Items/rounded_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showMoreCapsules = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> roundedBoxes = boxDataset.map((box) => RoundedBox(
      imagePath: box.imagePath,
      productName: box.productName,
      price: box.price, category: box.category,
    )).toList();

    // Default capsules
    List<Capsule> capsules = [
      const Capsule(text: "All", textColor: Colors.black, borderColor: Colors.black),
      const Capsule(text: "Men", textColor: Colors.black, borderColor: Colors.black),
      const Capsule(text: "Women", textColor: Colors.black, borderColor: Colors.black),
      const Capsule(text: "Electronics", textColor: Colors.black, borderColor: Colors.black),
      const Capsule(text: "Accessories", textColor: Colors.black, borderColor: Colors.black),
      const Capsule(text: "Beauty", textColor: Colors.black, borderColor: Colors.black),
      const Capsule(text: "Sports", textColor: Colors.black, borderColor: Colors.black),
    ];

    // Only show the first four capsules by default
    List<Capsule> displayedCapsules = capsules.take(4).toList();
    List<Capsule> additionalCapsules = capsules.sublist(4);

    return Scaffold(
      backgroundColor: const Color(0xFFFAE9F5),
      body: CustomScrollView(
        slivers: [
          // SliverAppBar
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

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Wrap widget for default and additional capsules
                        Column(
                          children: [
                            // First Row for default capsules (4 capsules)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                for (int i = 0; i < displayedCapsules.length; i++) ...[
                                  displayedCapsules[i],
                                  if (i != displayedCapsules.length - 1) const SizedBox(width: 8),
                                ],
                                // Arrow button beside the last capsule (Electronics)
                                IconButton(
                                  icon: Icon(
                                    showMoreCapsules ? Icons.arrow_downward : Icons.arrow_forward,
                                    color: const Color(0xFFFF5A1E),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      showMoreCapsules = !showMoreCapsules;
                                    });
                                  },
                                ),
                              ],
                            ),
                            // If 'showMoreCapsules' is true, show additional capsules below
                            if (showMoreCapsules)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  for (int i = 0; i < additionalCapsules.length; i++) ...[
                                    additionalCapsules[i],
                                    if (i != additionalCapsules.length - 1) const SizedBox(width: 8),
                                  ],
                                ],
                              ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Rounded border boxes below capsules
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

              // "Collections" section below the boxes
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: RoundedRectangle(
                  imagePath: 'images/app-images/men_collection.jpg',
                  height: 250.0,
                  labelText: 'Men',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: RoundedRectangle(
                  imagePath: 'images/app-images/women_collection.jpg',
                  height: 250.0,
                  labelText: 'Women',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: RoundedRectangle(
                  imagePath: 'images/app-images/electronics_collection.jpg',
                  height: 250.0,
                  labelText: 'Electronics',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: RoundedRectangle(
                  imagePath: 'images/app-images/jewellery_collection.jpg',
                  height: 250.0,
                  labelText: 'Jewellery',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: RoundedRectangle(
                  imagePath: 'images/app-images/all_collection.jpg',
                  height: 450.0,
                  labelText: 'All',
                ),
              ),
              const Divider(
                color: Color(0xFFFFC5EC),
                thickness: 2,
                height: 40,
                indent: 20,
                endIndent: 20,
              ),
            ]),
          ),

          // Footer
          const SliverToBoxAdapter(child: HelpSection()),
          const SliverToBoxAdapter(child: FooterSection()),
          const SliverToBoxAdapter(child: SizedBox(height: 15)),
        ],
      ),
    );
  }
}