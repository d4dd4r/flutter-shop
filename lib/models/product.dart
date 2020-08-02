import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum ClothSize { xs, s, m, l, xl }

enum ClothColor { black, green, yellow, white, red, grey, blue, brown, pink }

enum ClothBrand {
  vila,
  lostInk,
  mango,
  marselesa,
  befree,
  cleverWomanStudio,
  gloss,
}

enum ClothGender { male, female }

// TODO: add categories

class Product extends Equatable {
  final String id;
  final String articleId;
  final ClothBrand brand;
  final String category;
  final ClothGender gender;
  final List<ClothSize> sizes;
  final List<ClothColor> colors;
  final List<String> imageUrls;
  final bool isPremium;
  final bool isFavorite;
  final bool isNew;
  final int discount;
  final int discountPrice;
  final int price;

  Product({
    @required this.id,
    @required this.articleId,
    @required this.brand,
    @required this.category,
    @required this.gender,
    @required this.sizes,
    @required this.colors,
    @required this.imageUrls,
    @required this.isPremium,
    @required this.isFavorite,
    @required this.isNew,
    @required this.discount,
    @required this.discountPrice,
    @required this.price,
  });

  static List<Product> fromHighlightJson(List<Map<String, dynamic>> json) {
    return json
        .map((json) => Product(
              id: json['id'],
              articleId: json['articleId'],
              brand: json['brand'],
              category: json['category'],
              gender: json['gender'],
              sizes: json['sizes'],
              colors: json['colors'],
              imageUrls: json['imageUrls'],
              isPremium: json['isPremium'],
              isFavorite: json['isFavorite'],
              isNew: json['isNew'],
              discount: json['discount'],
              discountPrice: json['discountPrice'],
              price: json['price'],
            ))
        .toList();
  }

  int get sale {
    return price - discountPrice;
  }

  @override
  List<Object> get props => [
        id,
        articleId,
        brand,
        category,
        gender,
        sizes,
        colors,
        imageUrls,
        isPremium,
        isFavorite,
        isNew,
        discount,
        discountPrice,
        price,
        sale,
      ];
}
