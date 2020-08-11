import 'package:flutter/foundation.dart';
import 'package:shop/models/models.dart';

enum ProductSort {
  discount,
  brand,
  priceToHigh,
  priceToLow,
  novelty,
}

const Map<ProductSort, String> productSortTitle = {
  ProductSort.discount: 'по скидкам',
  ProductSort.brand: 'по брендам',
  ProductSort.priceToHigh: 'по возрастанию цены',
  ProductSort.priceToLow: 'по убыванию цены',
  ProductSort.novelty: 'по новинкам',
};

void sortProductList(List<Product> list, ProductSort sort) {
  switch (sort) {
    case ProductSort.discount:
      return list.sort((a, b) => b.discount.compareTo(a.discount));
    case ProductSort.brand:
      return list.sort(
          (a, b) => describeEnum(a.brand).compareTo(describeEnum(b.brand)));
    case ProductSort.priceToHigh:
      return list.sort((a, b) =>
          (a.discountPrice == 0 ? a.price : a.discountPrice)
              .compareTo((b.discountPrice == 0 ? b.price : b.discountPrice)));
    case ProductSort.priceToLow:
      return list.sort((a, b) =>
          (b.discountPrice == 0 ? b.price : b.discountPrice)
              .compareTo((a.discountPrice == 0 ? a.price : a.discountPrice)));
    case ProductSort.novelty:
      return list.sort((a, b) => a.isNew ? -1 : 1);
  }
}
