import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shop/models/models.dart';

import 'product_helper.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductFetchList extends ProductEvent {
  final Filter filter;

  const ProductFetchList({@required this.filter});

  @override
  List<Object> get props => [filter];
}

class ProductChangeSort extends ProductEvent {
  final ProductSort sort;

  const ProductChangeSort({@required this.sort});

  @override
  List<Object> get props => [sort];
}
