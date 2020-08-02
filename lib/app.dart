import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/blocs/blocs.dart';
import 'package:shop/cubits/cubit.dart';
import 'package:shop/screens/screens.dart';
import 'package:shop/services/services.dart';

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
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          textTheme: TextTheme(
            caption: GoogleFonts.zillaSlab(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0.75,
            ),
            subtitle1: GoogleFonts.zillaSlab(
              color: Colors.white54,
              fontSize: 12.0,
              letterSpacing: 0.5,
            ),
            subtitle2: GoogleFonts.zillaSlab(
              color: Colors.white,
              fontSize: 10.0,
              letterSpacing: 0.5,
            ),
          ),
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<HighlightBloc>(
              create: (_) => HighlightBloc(highlightService: highlightService)
                ..add(HighlightFetchList()),
            ),
            BlocProvider<FavoriteBloc>(create: (_) => FavoriteBloc()),
            BlocProvider<BottomNavigatorCubit>(create: (_) => BottomNavigatorCubit()),
          ],
          child: HomeScreen(),
        ));
  }
}
