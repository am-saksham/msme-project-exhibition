import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedBox extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String price;

  // Constructor to accept image, name, and price for each product
  const RoundedBox({
    Key? key,
    required this.imagePath,
    required this.productName,
    required this.price,
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
      ],
    );
  }
}