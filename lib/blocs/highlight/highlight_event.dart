import 'package:equatable/equatable.dart';

abstract class HighlightEvent extends Equatable {
  const HighlightEvent();

  @override
  List<Object> get props => [];
}

class HighlightFetchList extends HighlightEvent {}
