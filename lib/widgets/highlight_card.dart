import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/blocs/blocs.dart';
import 'package:shop/models/models.dart';
import 'package:shop/screens/screens.dart';
import 'package:shop/services/services.dart';

class HighlightCard extends StatelessWidget {
  final ProductService productService;
  final String bannerUrl;
  final String title;
  final String subtitle;
  final Filter filter;

  const HighlightCard({
    @required this.productService,
    @required this.bannerUrl,
    @required this.title,
    @required this.subtitle,
    @required this.filter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (_) => ProductBloc(productService: productService)
                    ..add(ProductFetchList(filter: filter)),
                  child: CatalogScreen(),
                ),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: 200,
            child: Image.network(
              bannerUrl,
              height: 200,
              fit: BoxFit.cover,
              frameBuilder: (_, child, frame, isLoaded) {
                if (isLoaded) {
                  return child;
                }
                return AnimatedOpacity(
                  child: child,
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOut,
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 48.0),
          child: Column(
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context).textTheme.caption,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
