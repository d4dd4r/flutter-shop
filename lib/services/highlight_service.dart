import 'dart:async';

import 'package:meta/meta.dart';
import 'package:shop/models/models.dart';
import 'services.dart';

class HighlightService {
  final HighlightsApiClient apiClient;

  HighlightService({@required this.apiClient}) : assert(apiClient != null);

  Future<List<Highlight>> getList() {
    return apiClient.getHighlightList();
  }

}
