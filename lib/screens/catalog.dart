import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart' as icons;
import 'package:shop/blocs/blocs.dart';
import 'package:shop/widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const divider =
      const Divider(height: 1, thickness: 1, color: Colors.white24);

  static const _emptyProductList = const Center(
    child: const Text('Список пуст'),
  );

  static const _loadingProductList = const Center(
    child: const CircularProgressIndicator(),
  );

  static _errorProductList(String error) => Center(
        child: Text(error),
      );

  @override
  Widget build(BuildContext context) {
    final favoriteBlock = BlocProvider.of<FavoriteBloc>(context);
    final productBlock = BlocProvider.of<ProductBloc>(context);
    print('==========> [CatalogScreen] Build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
      ),
      body: Column(
        children: [
          divider,
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Row(
              children: const ['Обувь', 'Одежда', 'Аксессуары']
                  .map((label) => Container(
                        margin: const EdgeInsets.only(right: 8.0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 16.0),
                        decoration: const BoxDecoration(
                            color: Colors.black45,
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(16.0))),
                        child: Text(label,
                            style: const TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.bold)),
                      ))
                  .toList(),
            ),
          ),
          divider,
          Row(
            children: [
              _HeaderButton(
                onPressed: () {},
                icon: icons.MaterialCommunityIcons.filter_outline,
                label: const Text('Фильтры'),
              ),
              _HeaderButton(
                icon: icons.MaterialCommunityIcons.sort,
                label: const Text('Сортировка'),
                onPressed: () => showCupertinoModalPopup(
                    context: context,
                    builder: (ctx) => CupertinoActionSheet(
                        title: const Text('Сортировать каталог'),
                        actions: ProductSort.values
                            .map((sort) => CupertinoActionSheetAction(
                                  child: Text(productSortTitle[sort]),
                                  onPressed: () {
                                    productBlock
                                        .add(ProductChangeSort(sort: sort));
                                    Navigator.of(ctx).pop();
                                  },
                                ))
                            .toList(),
                        cancelButton: CupertinoActionSheetAction(
                          child: const Text('Отменить'),
                          isDefaultAction: true,
                          onPressed: () => Navigator.of(ctx).pop(),
                        ))),
              ),
            ],
          ),
          divider,
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (_, state) {
                if (state is EmptyProductList) return _emptyProductList;

                if (state is LoadingProductList) return _loadingProductList;

                if (state is LoadedProductList) {
                  favoriteBlock.add(FavoriteMerge.fromProducts(state.list));
                  return ProductGrid(
                      list: state.list,
                      onFavoriteTap: (String productId) {
                        favoriteBlock.add(FavoriteSwitch(productId: productId));
                      });
                }

                if (state is ErrorProductList)
                  return _errorProductList(state.error);

                return _loadingProductList;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderButton extends StatelessWidget {
  final IconData icon;
  final Text label;
  final VoidCallback onPressed;

  _HeaderButton({
    @required this.icon,
    @required this.label,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: FlatButton(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Icon(icon),
                  const SizedBox(width: 8.0),
                  label,
                ],
              ),
              onPressed: onPressed,
              highlightColor: Colors.black26,
            ),
          ),
        ],
      ),
    );
  }
}
