import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../Items/appbar.dart';
import '../Items/footer_section.dart';
import '../Items/help_section.dart';

class ProductDetailScreen extends StatelessWidget {
  final String imagePath; // Single image path
  final String productName;
  final String price;
  final String category;
  final String? description;

  const ProductDetailScreen({
    Key? key,
    required this.imagePath,
    required this.productName,
    required this.price,
    required this.category,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAE9F5), // Light pink background color
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(
            title: "Micro Mart",
            expandedHeight: 50, // Adjust height as needed
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),

                      // Main Image with Interactive Viewer for Zoom
                      // Main Image with Interactive Viewer for Zoom
                      // Main Image with Interactive Viewer for Zoom
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            // Show dialog with zoomable image
                            showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                backgroundColor: Colors.transparent,
                                child: InteractiveViewer(
                                  clipBehavior: Clip.none,
                                  panEnabled: true, // Allow panning
                                  scaleEnabled: true, // Allow zooming
                                  minScale: 0.5, // Minimum zoom level (allow zoom out)
                                  maxScale: 5.0, // Maximum zoom level
                                  child: Container(
                                    color: Colors.white, // Set background color to white
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: Image.asset(
                                        imagePath,
                                        fit: BoxFit.contain, // Ensure full visibility of the image
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white, // Set background color to white
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.asset(
                                imagePath,
                                width: 350, // Set specific width
                                height: 550, // Set specific height
                                fit: BoxFit.cover, // Ensure the image covers the container fully
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Product Details Section
                      Text(
                        productName,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: const Color(0xFFFF5A1E),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      if (description != null && description!.isNotEmpty)
                        ExpansionTile(
                          title: const Text(
                            'Product Description',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                description!,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 10),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price:',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '₹$price', // The price number
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w900, // Bold the price number
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerLeft, // Aligns the buttons to the left
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0), // Adds padding to the left for spacing
                          child: Row(
                            children: [
                              // Add to Cart Button
                              ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Added to Cart!'),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFF5A1E), // Color for the button
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16), // Adds spacing between the two buttons

                              // Buy Now Button
                              ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Proceed to Buy Now!'),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4CAF50), // Color for the button
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'Buy Now',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(
              color: Color(0xFFFFC5EC),
              thickness: 2,
              height: 40,
              indent: 20,
              endIndent: 20,
            ),
          ),
          const SliverToBoxAdapter(child: HelpSection()),
          const SliverToBoxAdapter(child: FooterSection()),
          const SliverToBoxAdapter(child: SizedBox(height: 15)),
        ],
      ),
    );
  }
}