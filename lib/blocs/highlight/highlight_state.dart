import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shop/models/models.dart';

abstract class HighlightState extends Equatable {
  const HighlightState();

  @override
  List<Object> get props => [];
}

class StartHighlightList extends HighlightState {}

class EmptyHighlightList extends HighlightState {}

class LoadingHighlightList extends HighlightState {}

class LoadedHighlightList extends HighlightState {
  final List<Highlight> list;

  LoadedHighlightList({@required this.list}) : assert(list != null);

  @override
  List<Object> get props => [list];
}

class ErrorHighlightList extends HighlightState {
  final String error;

  ErrorHighlightList({@required this.error}) : assert(error != null);

  @override
  List<Object> get props => [error];
}
