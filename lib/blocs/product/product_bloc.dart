import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:shop/blocs/blocs.dart';
import 'package:shop/services/services.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService productService;

  ProductBloc({@required this.productService})
      : assert(productService != null),
        super(LoadingProductList());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is ProductFetchList) yield* _mapProductFetchListToState(event);
    if (event is ProductChangeSort) yield* _mapProductChangeSortToState(event);
  }

  Stream<ProductState> _mapProductFetchListToState(
      ProductFetchList event) async* {
    yield LoadingProductList();
    try {
      final list = await productService.getList(event.filter);
      yield list.isNotEmpty
          ? LoadedProductList(list: list)
          : EmptyProductList();
    } catch (error) {
      yield ErrorProductList(error: error);
    }
  }

  Stream<ProductState> _mapProductChangeSortToState(
      ProductChangeSort event) async* {
    yield LoadingProductList();
    if (state is LoadedProductList == false) {
      yield EmptyProductList();
    }

    final list = (state as LoadedProductList).list;
    sortProductList(list, event.sort);
    yield LoadedProductList(list: list);
  }
}
