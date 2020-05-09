import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/app.dart';
import 'package:shop/services/services.dart';
import 'package:shop/simple_bloc_delegate.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final HighlightService highlightService = HighlightService(
    apiClient: HighlightsApiClient(),
  );

  runApp(
    App(highlightService: highlightService),
  );
}
