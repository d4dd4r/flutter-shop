import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum BadgeSize {
  small,
  medium,
  large,
}

enum BadgeType {
  discount,
  isNew,
}

class _Params {
  final double paddingVertical;
  final double paddingHorizontal;

  const _Params(this.paddingVertical, this.paddingHorizontal);
}

class Badge extends StatelessWidget {
  final Color color;
  final String text;
  final BadgeSize size;

  const Badge({@required this.color, @required this.text, this.size});

  static Color getColorByType(BadgeType type) {
    switch (type) {
      case BadgeType.discount:
        return Colors.red;
      case BadgeType.isNew:
        return Colors.lightGreen;
      default:
        return Colors.red;
    }
  }

  _Params _getParams() {
    switch (size) {
      case BadgeSize.small:
        return const _Params(2.0, 4.0);
      case BadgeSize.medium:
        return const _Params(4.0, 6.0);
      case BadgeSize.large:
        return const _Params(6.0, 8.0);
      default:
        return const _Params(2.0, 4.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final params = _getParams();

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: params.paddingVertical,
          horizontal: params.paddingHorizontal),
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.elliptical(4, 2))),
      child: Text(text.toUpperCase(),
          style: GoogleFonts.robotoMono(
              letterSpacing: 0, fontSize: 8, fontWeight: FontWeight.bold)),
    );
  }
}
