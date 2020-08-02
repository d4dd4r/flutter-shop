import 'dart:async';

import 'package:meta/meta.dart';
import 'package:shop/models/models.dart';
import 'package:shop/services/services.dart';

class ProductService {
  final ProductsApiClient apiClient;

  const ProductService({@required this.apiClient}) : assert(apiClient != null);

  Future<List<Product>> getList(Filter filter) {
    return apiClient.getProductList().then((list) => list.where((product) {
          var hasBrand = filter.brandMap[product.brand] ?? false;
          var hasCategory = filter.categoryMap[product.category] ?? false;
          return hasBrand || hasCategory;
        }).toList());
  }
}
