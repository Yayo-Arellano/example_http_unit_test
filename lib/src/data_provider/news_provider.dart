import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_unit_test/src/data_provider/response/api_response.dart';
import 'package:http_unit_test/src/exceptions/custom_exception.dart';
import 'package:http_unit_test/src/model/article.dart';

class NewsProvider {
  static const String _apiKey = 'Change to your own api key';

  static const String _baseUrl = 'newsapi.org';
  static const String _topHeadlines = '/v2/top-headlines';

  final http.Client _httpClient;

  NewsProvider({http.Client httpClient}) : _httpClient = httpClient ?? http.Client();

  Future<List<Article>> topHeadlines(String country) async {
    final result = await _callGetApi(
      endpoint: _topHeadlines,
      params: {
        'country': country,
        'apiKey': _apiKey,
      },
    );
    return result.articles;
  }

  Future<ApiResponse> _callGetApi({String endpoint, Map<String, String> params}) async {
    var uri = Uri.https(_baseUrl, endpoint, params);

    final response = await _httpClient.get(uri);
    final result = ApiResponse.fromJson((json.decode(response.body)));

    print(response.body);

    if (result.status == 'error') {
      if (result.code == 'apiKeyMissing') throw MissingApiKeyException();
      if (result.code == 'apiKeyInvalid') throw ApiKeyInvalidException();
      throw Exception();
    }
    return result;
  }
}
