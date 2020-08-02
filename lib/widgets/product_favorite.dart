import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart' as icons;
import 'package:shop/blocs/blocs.dart';

class ProductFavorite extends StatelessWidget {
  static const Widget _fillHeart =
      const Icon(icons.FontAwesome.heart, color: Colors.pink, size: 18);

  static const Widget _outlineHeart =
      const Icon(icons.FontAwesome.heart_o, color: Colors.black87, size: 18);

  final String productId;
  final Function onFavoriteTap;

  const ProductFavorite({@required this.productId, this.onFavoriteTap = null});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      buildWhen: (previous, current) =>
          FavoriteState.isProductFavorite(previous.all, productId) !=
          FavoriteState.isProductFavorite(current.all, productId),
      builder: (_, state) {
        final isFavorite =
            FavoriteState.isProductFavorite(state.all, productId);
        return GestureDetector(
          onTap: onFavoriteTap,
          child: isFavorite ? _fillHeart : _outlineHeart,
        );
      },
    );
  }
}
