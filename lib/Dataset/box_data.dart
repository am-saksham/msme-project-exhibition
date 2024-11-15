// box_data.dart

class BoxData {
  final String imagePath;
  final String productName;
  final String price;

  // Constructor with all necessary properties
  BoxData({
    required this.imagePath,
    required this.productName,
    required this.price,
  });
}

// Sample dataset of products
List<BoxData> boxDataset = [
  BoxData(
    imagePath: 'images/product-images/product1.jpg',
    productName: "Presto! Garbage Bags",
    price: "335",
  ),
  BoxData(
    imagePath: 'images/product-images/product2.jpg',
    productName: "Bella Vita Luxury CEO Man Eau De Parfum Perfume",
    price: "499",
  ),
  BoxData(
    imagePath: 'images/product-images/product3.jpg',
    productName: "Apple 20W USB-C Power Adapter",
    price: "1549",
  ),
  BoxData(
    imagePath: 'images/product-images/product4.jpg',
    productName: "Apple iPhone 16 (128 GB) - Ultramarine",
    price: "77,900",
  ),
  BoxData(
    imagePath: 'images/product-images/product5.png',
    productName: "U.S. POLO ASSN. Men Vertical Stripe Premium Cotton Regular Fit Casual Shirt",
    price: "1649",
  ),
  BoxData(
    imagePath: 'images/product-images/product6.png',
    productName: "Lavie Women's Nova Tote Bag",
    price: "1049",
  ),
  // Add more products as needed
];