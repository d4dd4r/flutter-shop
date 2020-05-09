import 'package:flutter/material.dart';
import 'package:shop/models/models.dart';

class HighlightList extends StatelessWidget {
  final List<Highlight> list;

  HighlightList({@required this.list}) : assert(list != null);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final highlight = list[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Text(
            highlight.title,
            textAlign: TextAlign.justify,
          ),
        );
      },
    );
  }
}
