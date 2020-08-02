import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shop/models/models.dart';

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
