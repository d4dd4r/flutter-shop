import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shop/models/models.dart';

class Filter extends Equatable {
  static Filter fromHighlightJson(dynamic json) {
    final List<dynamic> jsonBrandList = json['brandList'] ?? [];
    final List<ClothBrand> brandList = jsonBrandList.fold([], (acc, brand) {
      if (brand is ClothBrand) acc.add(brand);
      return acc;
    });

    return Filter(
      id: json['id'],
      brandList: brandList,
      categoryList: json['categoryList'] ?? [],
    );
  }

  final String id;
  final List<ClothBrand> brandList;
  final List<String> categoryList;

  Filter({
    @required this.id,
    this.brandList = const [],
    this.categoryList = const [],
  });

  Map<ClothBrand, bool> get brandMap {
    return Map.fromIterable(brandList, value: (_) => true);
  }

  Map<String, bool> get categoryMap {
    return Map.fromIterable(categoryList, value: (_) => true);
  }

  @override
  List<Object> get props =>
      [id, brandList, categoryList, brandMap, categoryMap];
}
