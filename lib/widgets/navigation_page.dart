import 'package:flutter/material.dart';

class NavigationPage extends StatelessWidget {
  final Widget child;

  const NavigationPage({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Navigator(onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => child,
      );
    });
  }
}
