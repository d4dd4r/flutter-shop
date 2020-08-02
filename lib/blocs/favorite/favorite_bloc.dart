import 'dart:async';

import 'package:bloc/bloc.dart';

import './favorite.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteState());

  @override
  Stream<FavoriteState> mapEventToState(
    FavoriteEvent event,
  ) async* {
    if (event is FavoriteMerge) yield* _mapMergeToState(event);
    if (event is FavoriteSwitch) yield* _mapSwitchToState(event);
  }

  Stream<FavoriteState> _mapMergeToState(FavoriteMerge event) async* {
    yield FavoriteState(
        productFavoriteMap: FavoriteState.merge(state.all, event.pack));
  }

  Stream<FavoriteState> _mapSwitchToState(FavoriteSwitch event) async* {
    yield FavoriteState(
        productFavoriteMap:
            FavoriteState.switchProduct(state.all, event.productId));
  }
}
