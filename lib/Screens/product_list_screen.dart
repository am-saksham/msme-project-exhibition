import 'package:flutter/material.dart';
import 'package:msme_exhibition/Screens/product_detail_screen.dart';
import '../Dataset/box_data.dart'; // Assuming BoxData is defined in box_data.dart // Import the product detail screen

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<BoxData> filteredProducts = boxDataset;
  String searchQuery = '';

  void filterProducts(String query) {
    setState(() {
      searchQuery = query;
      filteredProducts = boxDataset
          .where((product) =>
          product.productName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: filterProducts,
              decoration: InputDecoration(
                hintText: 'Search for a product...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          final product = filteredProducts[index];
          return ListTile(
            leading: Image.asset(product.imagePath),
            title: Text(
              product.productName,
              overflow: TextOverflow.ellipsis, // Truncate if text is too long
              maxLines: 1, // Show product name in one line
            ),
            subtitle: Text('₹${product.price}'), // Add rupee symbol before the price
            onTap: () {
              // Navigate to the ProductDetailScreen and pass the selected product
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    imagePath: product.imagePath, // Pass the imagePath
                    productName: product.productName, // Pass the productName
                    price: product.price, // Pass the price
                    category: product.category, // Pass the category
                    description: product.description, // Pass the productDescription
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}