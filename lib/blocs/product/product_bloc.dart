import 'dart:async';

import 'package:bloc/bloc.dart';
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
    if (event is ProductFetchList) yield* _mapFetchProductListToState(event);
  }

  Stream<ProductState> _mapFetchProductListToState(
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
}
