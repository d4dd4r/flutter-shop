import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop/blocs/blocs.dart';
import 'package:shop/models/models.dart';
import 'package:shop/services/services.dart';

class HighlightBloc extends Bloc<HighlightEvent, HighlightState> {
  final HighlightService highlightService;

  HighlightBloc({@required this.highlightService})
      : assert(highlightService != null), super(LoadingHighlightList());

  @override
  Stream<HighlightState> mapEventToState(HighlightEvent event) async* {
    if (event is HighlightFetchList)
      yield* _mapFetchHighlightListToState(event);
  }

  Stream<HighlightState> _mapFetchHighlightListToState(
      HighlightEvent event) async* {
    yield LoadingHighlightList();
    try {
      final List<Highlight> list = await highlightService.getList();
      yield list.isNotEmpty
          ? LoadedHighlightList(list: list)
          : EmptyHighlightList();
    } catch (_) {
      yield ErrorHighlightList(error: 'Не удалось загрузить список');
    }
  }
}
