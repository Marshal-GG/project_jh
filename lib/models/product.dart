import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });
}

List<Product> products = [
  Product(
    id: 1,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/icons8-product-100-4.png",
    color: const Color(0xFF3D82AE),
  ),
  Product(
    id: 2,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/icons8-product-100-2.png",
    color: const Color(0xFF3D82AE),
  ),
  Product(
    id: 3,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/icons8-product-100-3.png",
    color: const Color(0xFF3D82AE),
  ),
  Product(
    id: 4,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/icons8-product-100-4.png",
    color: const Color(0xFF3D82AE),
  ),
];

String dummyText = "Sample Text For Testing";
