import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shop/models/models.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class EmptyProductList extends ProductState {}

class LoadingProductList extends ProductState {}

class LoadedProductList extends ProductState {
  final List<Product> list;

  LoadedProductList({@required this.list}) : assert(list != null);

  @override
  List<Object> get props => [list];
}

class ErrorProductList extends ProductState {
  final String error;

  ErrorProductList({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];
}
