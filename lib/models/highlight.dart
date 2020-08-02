import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'models.dart';

class Highlight extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String bannerUrl;
  final String pageTitle;
  final Filter filter;

  const Highlight({
    @required this.id,
    @required this.title,
    @required this.subtitle,
    @required this.bannerUrl,
    @required this.pageTitle,
    @required this.filter,
  });

  static Highlight fromJson(dynamic json) {
    return Highlight(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      bannerUrl: json['bannerUrl'],
      pageTitle: json['pageTitle'],
      filter: Filter.fromHighlightJson(json['filter']),
    );
  }

  @override
  List<Object> get props => [id, title, subtitle, bannerUrl, pageTitle, filter];
}
