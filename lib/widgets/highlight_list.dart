import 'package:flutter/material.dart';
import 'package:shop/models/models.dart';
import 'package:shop/widgets/widgets.dart';
import 'package:shop/services/services.dart';

class HighlightList extends StatelessWidget {
  static const _apiClient = const ProductsApiClient();

  static const _productService = ProductService(apiClient: _apiClient);

  final List<Highlight> list;

  HighlightList({@required this.list}) : assert(list != null);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final highlight = list[index];
        return HighlightCard(
          productService: _productService,
          bannerUrl: highlight.bannerUrl,
          title: highlight.title,
          subtitle: highlight.subtitle,
          filter: highlight.filter,
        );
      },
    );
  }
}
