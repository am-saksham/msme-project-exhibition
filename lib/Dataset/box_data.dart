// box_data.dart

/// Represents the data model for a product box in the app.
class BoxData {
  final String imagePath;   // Path to the product image
  final String productName; // Name of the product
  final String price;       // Price of the product
  final String category;    // Category to which the product belongs
  final String? description; // Optional detailed description of the product

  /// Constructor with all necessary properties
  BoxData({
    required this.imagePath,
    required this.productName,
    required this.price,
    required this.category,
    this.description,
  });
}

/// A sample dataset containing a list of products
List<BoxData> boxDataset = [
  BoxData(
    imagePath: 'images/product-images/product1.png',
    productName: "Odonil Gel Pocket Mix - 30g (Assorted pack of 3 new fragrances)",
    price: "129",
    category: 'Home Essentials',
    description: 'Odonil Gel Pocket Mix - 30g (Assorted pack of 3 new fragrances) | Infused with Essential Oils | Germ Protection | Lasts Up to 30 days | Air Freshener for Bathroom and Toilet',
  ),
  BoxData(
    imagePath: 'images/product-images/product2.png',
    productName: "Bella Vita Luxury CEO Man Eau De Parfum Perfume",
    price: "499",
    category: 'Men',
    description: "Life in the Fast Lane! Perfect for everyday wear, CEO MAN Eau De Parfum "
        "elevates the 'CEO' in you. Refreshingly daring yet long-lasting with top hints of lemon "
        "and sugar delicately energizing with Lavender at its heart and finally, arise the vetiver, "
        "moss and tonka's sharply-dressed base. This perfume honors your debonair and charismatic "
        "personality, allowing you to be true to yourself, just with the 'CEO' touch added to it!",
  ),
  BoxData(
    imagePath: 'images/product-images/product3.png',
    productName: "Apple 20W USB-C Power Adapter",
    price: "1549",
    category: 'Electronics',
    description: 'The Apple 20W USB‑C Power Adapter offers fast, efficient charging at home, in the office, '
        'or on the go. While the power adapter is compatible with any USB‑C-enabled device, Apple recommends '
        'pairing it with the 11-inch iPad Pro and 12.9-inch iPad Pro (3rd generation) for optimal charging performance. '
        'You can also pair it with iPhone 8 or later to take advantage of the fast-charging feature.',
  ),
  BoxData(
    imagePath: 'images/product-images/product4.png',
    productName: "Apple iPhone 16 (128 GB) - Ultramarine",
    price: "77,900",
    category: 'Electronics',
    description: 'Built for Apple Intelligence with the all-new A18 chip, both models feature Camera Control, '
        'powerful upgrades to the advanced camera system, the Action button to quickly access useful features, '
        'and a big boost in battery life.',
  ),
  BoxData(
    imagePath: 'images/product-images/product5.png',
    productName: "U.S. POLO ASSN. Men Vertical Stripe Premium Cotton Regular Fit Casual Shirt",
    price: "1649",
    category: 'Men',
    description: 'This striped shirt from the Sunwashed Spring is light, breezy, and a great wardrobe choice '
        'for a relaxed casual look.',
  ),
  BoxData(
    imagePath: 'images/product-images/product6.png',
    productName: "Lavie Women's Nova Tote Bag",
    price: "1049",
    category: 'Women',
    description: 'Lavie Malnov tote is a stylish offering for ladies. It is durable, lightweight, and super spacious. '
        'Made from vegan leather, this large handbag comes in Herringbone, Woven, and Croco texture patterns at the front.',
  ),
  // Additional products can be added here as needed.
];