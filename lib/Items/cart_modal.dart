import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';  // Import Google Fonts

class CartModal extends StatelessWidget {
  const CartModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen height
    double screenHeight = MediaQuery.of(context).size.height;

    // Increase the height of the modal to 90% of the screen height
    double modalHeight = screenHeight;  // Increased to 90% of screen height

    // Set the height of the bottom container to increase its size
    double bottomContainerHeight = 200;  // Set a larger height for the bottom container

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0), // Set the top-left corner radius
        topRight: Radius.circular(30.0), // Set the top-right corner radius
      ),
      child: Container(
        color: const Color(0xFFFAE9F5),  // Set the background color of the modal
        width: double.infinity,  // Use full width of the screen
        height: modalHeight,     // Set the height dynamically (90% of screen height)
        child: Stack(
          children: [
            // Center the content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,  // Center content vertically
                crossAxisAlignment: CrossAxisAlignment.center,  // Center content horizontally
                children: [
                  Text(
                    'Your Cart is Empty',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 60),  // Add space between text and any further content

                ],
              ),
            ),
            Positioned(
              bottom: 0,  // Set to 0 to ensure the container touches the bottom of the screen
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: Container(
                  color: Colors.white,  // White color for the bottom rectangle
                  width: double.infinity,
                  height: bottomContainerHeight,  // Set the height of the bottom container
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),  // Padding for content
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 10),
                      // Row with 'Total' and '₹0.00' text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '₹0.00',
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      // Remove or reduce the gap between text and buttons
                      const SizedBox(height: 0), // Removed gap between text and buttons
                      // Row with 'Empty the cart' and 'Check out' buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  // Spread buttons evenly across the row
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Action to empty the cart
                            },
                            child: Text(
                              'Empty the cart',
                              style: GoogleFonts.poppins(  // Apply Poppins font style
                                fontSize: 18,  // Increase font size for bigger text
                                fontWeight: FontWeight.bold,
                                color: Colors.black,  // Text color black
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white, // Black text color
                              side: BorderSide(color: Color(0xFFFF5A1E), width: 2), // Border color and width
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),  // Increase padding for bigger buttons
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15), // Rounded corners
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Action to check out
                            },
                            child: Text(
                              'Check out',
                              style: GoogleFonts.poppins(  // Apply Poppins font style
                                fontSize: 18,  // Increase font size for bigger text
                                fontWeight: FontWeight.bold,
                                color: Colors.black,  // Text color black
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white, // Black text color
                              side: BorderSide(color: Color(0xFFFF5A1E), width: 2), // Border color and width
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),  // Increase padding for bigger buttons
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15), // Rounded corners
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}