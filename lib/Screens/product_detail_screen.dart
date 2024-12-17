import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'cart_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final String imagePath;
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
      backgroundColor: const Color(0xFFFAE9F5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    backgroundColor: Colors.transparent,
                    child: InteractiveViewer(
                      panEnabled: true,
                      scaleEnabled: true,
                      child: Image.asset(imagePath),
                    ),
                  ),
                );
              },
              child: Image.asset(imagePath, height: 400, fit: BoxFit.cover),
            ),

            // Product Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '₹$price',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Description
                  if (description != null && description!.isNotEmpty)
                    ExpansionTile(
                      title: Text(
                        'Product Description',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            description!,
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                        ),
                      ],
                    ),

                  const SizedBox(height: 20),

                  // Buttons
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          final cartProvider = Provider.of<CartProvider>(
                            context,
                            listen: false,
                          );

                          cartProvider.addToCart(CartItem(
                            productName: productName,
                            price: price,
                            imagePath: imagePath,
                            category: category,
                          ));

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('$productName added to cart!'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        child: const Text('Add to Cart'),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Buy Now is under development!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        child: const Text('Buy Now'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
