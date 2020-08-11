import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shop/models/models.dart';

import 'product_helper.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class EmptyProductList extends ProductState {}

class LoadingProductList extends ProductState {}

class LoadedProductList extends ProductState {
  final List<Product> list;
  final ProductSort sort;

  LoadedProductList({@required this.list, this.sort = ProductSort.novelty})
      : assert(list != null);

  @override
  List<Object> get props => [list, sort];
}

class ErrorProductList extends ProductState {
  final String error;

  ErrorProductList({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];
}
