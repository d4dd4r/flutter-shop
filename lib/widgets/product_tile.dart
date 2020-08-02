import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart' as icons;
import 'package:shop/helpers/helpers.dart';
import 'package:shop/models/models.dart';
import 'package:shop/widgets/widgets.dart';

// TODO: сделать провайдер для каждого товара при билде продукт тайла

class ProductTile extends StatelessWidget {
  static const _bottomHeight = 80.0;

  static const _sizedBox = const SizedBox(height: 3);

  static const _paddingValue = 6.0;

  final String id;
  final List<String> imageList;
  final int finalPrice;
  final int oldPrice;
  final int discount;
  final ClothBrand brand;
  final String category;
  final List<ClothSize> sizes;
  final bool isPremium;
  final bool isFavorite;
  final bool isNew;
  final Function onFavoriteTap;

  ProductTile({
    @required this.id,
    @required this.imageList,
    @required this.finalPrice,
    @required this.brand,
    @required this.category,
    @required this.sizes,
    this.isPremium = false,
    this.isFavorite = false,
    this.isNew = false,
    this.discount = 0,
    this.oldPrice = 0,
    this.onFavoriteTap = null,
  });

  String get sizeText {
    return sizes.fold(
        '',
        (acc, size) =>
            acc != '' ? '$acc, ${describeEnum(size)}' : describeEnum(size));
  }

  List<Widget> get _badges {
    final List<Widget> badges = [];
    if (isNew) {
      badges.add(
          Badge(color: Badge.getColorByType(BadgeType.isNew), text: 'new'));
    }
    if (discount != 0) {
      badges.add(Badge(
          color: Badge.getColorByType(BadgeType.discount),
          text: '-$discount%'));
    }
    return badges;
  }

  @override
  Widget build(BuildContext context) {
    final badges = _badges;

    return Stack(
      fit: StackFit.expand,
      children: [
        /* image  */
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: _bottomHeight,
          child: Container(
            child: Image.network(imageList[0], fit: BoxFit.cover),
          ),
        ),

        /* badges */
        badges.isNotEmpty
            ? Positioned(
                left: _paddingValue,
                bottom: _bottomHeight - _paddingValue,
                child: Row(children: addSizedBoxBetweenWidgets(badges)),
              )
            : Container(),

        /* favorite */
        Positioned(
          top: _paddingValue,
          right: _paddingValue,
          child: GestureDetector(
            onTap: onFavoriteTap,
            child: ProductFavorite(productId: id, onFavoriteTap: onFavoriteTap),
          ),
        ),

        /* toCart */
        Positioned(
          right: _paddingValue,
          bottom: _bottomHeight + _paddingValue,
          child: GestureDetector(
            onTap: null,
            child: Icon(icons.MaterialCommunityIcons.cart_arrow_down,
                color: Colors.black87, size: 18),
          ),
        ),

        /* info */
        Positioned(
          height: _bottomHeight,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Price(finalPrice: finalPrice, oldPrice: oldPrice),
                _sizedBox,
                Text(camelCaseToUpperSpaceBetween(describeEnum(brand)),
                    style: Theme.of(context).textTheme.subtitle2),
                _sizedBox,
                Text(category, style: Theme.of(context).textTheme.subtitle2),
                _sizedBox,
                Text(sizeText,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(color: Colors.white54)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
