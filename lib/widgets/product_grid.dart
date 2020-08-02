import 'package:flutter/material.dart';
import 'package:shop/models/models.dart';
import 'package:shop/widgets/widgets.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> list;
  final Function onFavoriteTap;

  ProductGrid({@required this.list, this.onFavoriteTap = null})
      : assert(list != null);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 3 / 5,
      crossAxisSpacing: 2,
      children: list
          .map((product) => ProductTile(
                id: product.id,
                brand: product.brand,
                category: product.category,
                finalPrice: product.discountPrice,
                oldPrice: product.price,
                imageList: product.imageUrls,
                sizes: product.sizes,
                discount: product.discount,
                isFavorite: product.isFavorite,
                isPremium: product.isPremium,
                isNew: product.isNew,
                onFavoriteTap: () => onFavoriteTap(product.id),
              ))
          .toList(),
    );
  }
}
