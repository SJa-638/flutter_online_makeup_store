class ProductData {
  String id;
  String title;
  String description;
  double price;
  List<String> images;
  List<String> sizes;

  // Update the constructor to accept the required fields directly
  ProductData({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.sizes,
  });

  // Factory method to convert map to ProductData object
  factory ProductData.fromMap(Map<String, dynamic> map) {
    return ProductData(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      price: (map['price'] ?? 0.0).toDouble(),
      images: List<String>.from(map['images']),
      sizes: List<String>.from(map['sizes']),
    );
  }

  Map<String, dynamic> toResumeMap() {
    return {
      'title': title,
      'description': description,
      'price': price,
    };
  }
}

// Example usage:
void main() {
  Map<String, dynamic> sampleProductData = {
    'id': '1',
    'title': 'Sample Product',
    'description': 'This is a sample product',
    'price': 10.0,
    'images': ['image1.jpg', 'image2.jpg'],
    'sizes': ['S', 'M', 'L'],
  };

  ProductData product = ProductData.fromMap(sampleProductData);

  print('Product ID: ${product.id}');
  print('Product Title: ${product.title}');
  print('Product Description: ${product.description}');
  print('Product Price: ${product.price}');
  print('Product Images: ${product.images}');
  print('Product Sizes: ${product.sizes}');
}