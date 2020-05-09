import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop/models/models.dart';
import 'package:shop/services/services.dart';

import 'highlight.dart';

class HighlightBloc extends Bloc<HighlightEvent, HighlightState> {
  final HighlightService highlightService;

  HighlightBloc({@required this.highlightService})
      : assert(highlightService != null);

  @override
  HighlightState get initialState => StartHighlightList();

  @override
  Stream<HighlightState> mapEventToState(HighlightEvent event) async* {
    if (event is FetchList) {
      yield* _mapFetchHighlightListToState(event);
    }
  }

  Stream<HighlightState> _mapFetchHighlightListToState(
      HighlightEvent event) async* {
    yield LoadingHighlightList();
    try {
      final List<Highlight> list = await highlightService.getList();
      if (list.isNotEmpty)
        yield LoadedHighlightList(list: list);
      else
        yield EmptyHighlightList();
    } catch (_) {
      yield ErrorHighlightList(error: 'Не удалось загрузить список');
    }
  }
}
