import 'package:flutter/material.dart';
import 'package:shop/helpers/helpers.dart';

class Price extends StatelessWidget {
  static const priceTextStyle = TextStyle(
    letterSpacing: -0.3,
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
  );

  final int finalPrice;
  final int oldPrice;
  final String currency;

  Price({
    @required this.finalPrice,
    this.oldPrice = 0,
    this.currency = '₽',
  });

  List<Widget> _buildPrices() {
    final isDiscountWith = finalPrice != 0;
    final List<Widget> widgetList = [];

    if (isDiscountWith) {
      widgetList.add(
        Text(priceFormatter(oldPrice),
            style: const TextStyle(
                color: Colors.white30,
                fontSize: 10.0,
                letterSpacing: -0.3,
                decoration: TextDecoration.lineThrough,
                decorationStyle: TextDecorationStyle.solid,
                decorationColor: Colors.white30)),
      );

      widgetList.add(const SizedBox(width: 6.0));
    }

    widgetList.add(Text(
      '${priceFormatter(isDiscountWith ? finalPrice : oldPrice)} $currency',
      style: priceTextStyle.copyWith(
          color: isDiscountWith ? Colors.red : Colors.white),
    ));

    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildPrices(),
    );
  }
}
