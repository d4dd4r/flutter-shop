import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/blocs/blocs.dart';
import 'package:shop/services/services.dart';
import 'package:shop/screens/screens.dart';

class App extends StatelessWidget {
  final HighlightService highlightService;

  App({Key key, @required this.highlightService})
      : assert(highlightService != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Shop',
      initialRoute: HighlightScreen.routeName,
      routes: {
        HighlightScreen.routeName: (_) => BlocProvider(
          create: (_) => HighlightBloc(highlightService: highlightService),
          child: HighlightScreen(),
        ),
      },
    );
  }
}
