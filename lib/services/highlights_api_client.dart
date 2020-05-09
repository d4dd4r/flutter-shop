import 'package:shop/models/models.dart';

class HighlightsApiClient {
  const HighlightsApiClient();

  Future<List<Highlight>> getHighlightList() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Highlight.fromJson({
        'id': '1a2zvw5n',
        'title': 'Highlight title',
        'bannerUrl':
            'https://www.office-dv.ru/images/news/novosty/44444124.jpg',
        'filter': {'id': 'fm4le0am'},
      }),
      Highlight.fromJson({
        'id': '9jfn3jq2',
        'title': 'Best Sale',
        'bannerUrl':
            'https://www.office-dv.ru/images/news/novosty/44444124.jpg',
        'filter': {'id': 'igj42om1'},
      }),
    ];
  }
}
