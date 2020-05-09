import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'models.dart';

class Highlight extends Equatable {
  final String id;
  final String title;
  final String bannerUrl;
  final Filter filter;

  const Highlight({
    @required this.id,
    @required this.title,
    @required this.bannerUrl,
    @required this.filter,
  });

  static Highlight fromJson(dynamic json) {
    return Highlight(
      id: json['id'],
      title: json['title'],
      bannerUrl: json['bannerUrl'],
      filter: Filter.fromHighlightJson(json['filter']),
    );
  }

  @override
  List<Object> get props => [id, title, bannerUrl, filter];
}
