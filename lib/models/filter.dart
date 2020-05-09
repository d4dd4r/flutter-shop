import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Filter extends Equatable {
  final String id;

  const Filter({@required this.id}) : assert(id != null);

  static Filter fromHighlightJson(dynamic json) {
    return Filter(id: json['id']);
  }

  @override
  List<Object> get props => [id];
}
