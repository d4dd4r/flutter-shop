import 'package:shop/models/models.dart';

class HighlightsApiClient {
  const HighlightsApiClient();

  Future<List<Highlight>> getHighlightList() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Highlight.fromJson({
        'id': '1a2zvw5n',
        'title': 'Сделай себе подарок',
        'subtitle': 'Купите то, что давно хотели',
        'bannerUrl':
            'https://static.rasprodaga.ru/pictures/actions/group-sticker/522/3772147002_orig.jpg',
        'filter': {'id': 'fm4le0am', 'categoryList': ['Платье', 'Комбинезон', 'Юбка', 'Блуза']},
      }),
      Highlight.fromJson({
        'id': '9jfn3jq2',
        'title': 'Летние коллекции',
        'subtitle': 'Только лучшее',
        'bannerUrl':
            'https://image.jimcdn.com/app/cms/image/transf/dimension=1280x10000:format=png/path/s02d3fa3e2896df68/image/i53439f21dcb6d986/version/1441047666/image.png',
        'filter': {'id': 'igj42om1', 'brandList': [ClothBrand.lostInk]},
      }),
      Highlight.fromJson({
        'id': 'jd9a29f',
        'title': 'Готовы к лету?',
        'subtitle': 'Все для домашних тренировок',
        'bannerUrl':
            'https://static.vecteezy.com/system/resources/previews/000/339/629/large_2x/big-sale-banner-vector.jpg',
        'filter': {'id': 'aosdj2j1', 'brandList': [ClothBrand.vila]},
      }),
      Highlight.fromJson({
        'id': 'asdk83hjf',
        'title': 'О чем говорит одежда?',
        'subtitle': 'Пройдите тест и получите ответы',
        'bannerUrl':
            'https://static.vecteezy.com/system/resources/previews/000/259/380/original/black-friday-sale-banner-vector-ilustration.jpg',
        'filter': {'id': 'lsdf82jd', 'brandList': [ClothBrand.vila]},
      }),
      Highlight.fromJson({
        'id': 'fh8n2mazs',
        'title': 'Хорошее начало',
        'subtitle': 'Промокод: LETSGO',
        'bannerUrl':
            'https://sun9-7.userapi.com/c849416/v849416696/e0a29/TVKFy5ZR8iU.jpg',
        'filter': {'id': 'flksfm2932s', 'brandList': []},
      }),
    ];
  }
}
