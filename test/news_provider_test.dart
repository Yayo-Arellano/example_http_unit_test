import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:http_unit_test/src/data_provider/news_provider.dart';
import 'package:http_unit_test/src/exceptions/custom_exception.dart';

void main() {
  test('Top headlines response is correct', () async {
    final client = _getClient('test/top_headlines.json');
    final articles = await client.topHeadlines('us');

    expect(articles.length, 2);
    expect(articles[0].author, 'Sophie Lewis');
    expect(articles[1].author, 'KOCO Staff');
  });

  test('Api key missing exception is thrown correctly', () async {
    final client = _getClient('test/api_key_missing.json');
    expect(client.topHeadlines('mx'), throwsA(predicate((exception) => exception is MissingApiKeyException)));
  });

  test('Invalid Api key exception is thrown correctly', () async {
    final client = _getClient('test/api_key_invalid.json');
    expect(client.topHeadlines('mx'), throwsA(predicate((exception) => exception is ApiKeyInvalidException)));
  });
}

final headers = {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'};

NewsProvider _getClient(String filePath) => NewsProvider(httpClient: _getMockClient(filePath));

MockClient _getMockClient(String filePath) =>
    MockClient((_) async => Response(await File(filePath).readAsString(), 200, headers: headers));