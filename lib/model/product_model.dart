import 'package:flutter/material.dart';

class Product {
  final String image, title;
  final int id;
  final Color color;
  Product({
    required this.image,
    required this.title,
    required this.color,
    required this.id,
  });
}

List<Product> products = [
  Product(
    id: 1,
    title: "বাংলাদেশের মানচিত্র",
    image: "assets/images/map.png",
    color: Color(0xFF71b8ff),
  ),
  Product(
    id: 2,
    title: "সাত জন বীরশ্রেষ্ঠ",
    image: "assets/images/7bir.png",
    color: Color(0xFFff6374),
  ),
  Product(
    id: 3,
    title: "জাতীয় বিষয়াবলী",
    image: "assets/images/jatiyo.png",
    color: Color(0xFFffaa5b),
  ),
  Product(
    id: 4,
    title: "লেখক পরিচিতি",
    image: "assets/images/graphics.png",
    color: Color(0xFF9ba0fc),
  ),
];
