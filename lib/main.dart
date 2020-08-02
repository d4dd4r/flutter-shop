import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/my_bloc_observer.dart';
import 'package:shop/services/services.dart';

import 'app.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  final HighlightService highlightService = HighlightService(
    apiClient: HighlightsApiClient(),
  );

  runApp(
    App(highlightService: highlightService),
  );
}
