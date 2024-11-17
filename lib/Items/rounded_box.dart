import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedBox extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String price;
  final String category; // Keep category to organize products, but don't display it

  // Constructor to accept image, name, price, and category for each product
  const RoundedBox({
    Key? key,
    required this.imagePath,
    required this.productName,
    required this.price,
    required this.category, // Accept category here, but won't display it
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Product Image Box
        Container(
          width: 165,
          height: 165, // Fixed size for the box
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imagePath,
              width: 100,  // Fixed width for the image
              height: 100, // Fixed height for the image
              fit: BoxFit.contain, // Ensures the image does not stretch and stays within the box
            ),
          ),
        ),

        const SizedBox(height: 10), // Spacing between image and text

        // Product Name and Add to Cart icon row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Product Name (Left side)
              // Use Expanded or Flexible to prevent overflow
              Expanded(
                child: Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis, // Truncate if too long
                ),
              ),

              // Add to Cart Icon (Right side)
              IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                color: const Color(0xFFFF5A1E),
                onPressed: () {
                  // Add to cart action
                },
              ),
            ],
          ),
        ),

        const SizedBox(height: 5), // Space between the name+icon row and price

        // Product Price directly below the product name and left-aligned
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start, // Align price to the left
            children: [
              Text(
                '₹$price',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        // Category Badge (Optional, currently hidden)
        // const SizedBox(height: 8),
        // Container(
        //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        //   decoration: BoxDecoration(
        //     color: Colors.grey.withOpacity(0.2),
        //     borderRadius: BorderRadius.circular(12),
        //   ),
        //   child: Text(
        //     category, // Display the category name (currently hidden)
        //     style: const TextStyle(
        //       fontSize: 12,
        //       color: Colors.black,
        //       fontWeight: FontWeight.w400,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}