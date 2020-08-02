import 'package:flutter/material.dart';

const sizedBox = const SizedBox(width: 6);

List<Widget> addSizedBoxBetweenWidgets(List<Widget> widgets) {
  var i = -1;
  return widgets.fold<List<Widget>>([], (acc, widget) {
    ++i;
    if (i != 0 && i != widgets.length) {
      acc.add(sizedBox);
    }

    acc.add(widget);
    return acc;
  });
}
