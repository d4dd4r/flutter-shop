import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:shop/models/models.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class FavoriteMerge extends FavoriteEvent {
  static FavoriteMerge fromProducts(List<Product> list) {
    return FavoriteMerge(
      pack: list.fold<Map<String, bool>>({}, (acc, product) {
        acc[product.id] = product.isFavorite;
        return acc;
      }),
    );
  }

  final Map<String, bool> pack;

  FavoriteMerge({@required this.pack});

  @override
  List<Object> get props => [pack];
}

class FavoriteSwitch extends FavoriteEvent {
  final String productId;

  FavoriteSwitch({@required this.productId});

  @override
  List<Object> get props => [productId];
}
