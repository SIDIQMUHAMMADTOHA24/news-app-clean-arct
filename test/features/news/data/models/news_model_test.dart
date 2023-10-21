import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/news/data/models/news_model.dart';

import '../../../../fixture/fixture_reader.dart';

void main() {
  final article = Article(
      author: "Liputan6.com",
      title:
          "Bos Meta Umumkan Pengguna WhatsApp Bakal Bisa Punya 2 Akun di 1 Perangkat - Liputan6.com",
      description: null,
      url:
          "https://news.google.com/rss/articles/CBMidWh0dHBzOi8vd3d3LmxpcHV0YW42LmNvbS90ZWtuby9yZWFkLzU0Mjc3MzcvYm9zLW1ldGEtdW11bWthbi1wZW5nZ3VuYS13aGF0c2FwcC1iYWthbC1iaXNhLXB1bnlhLTItYWt1bi1kaS0xLXBlcmFuZ2thdNIBAA?oc=5",
      urlToImage: null,
      publishedAt: DateTime.parse("2023-10-20T00:30:58Z"),
      content: null);

  final newsModel =
      NewsModel(status: 'ok', totalResults: 38, articles: [article]);

  test('article', () {
    expect(
      newsModel.props,
      [
        newsModel.status,
        newsModel.totalResults,
        newsModel.articles,
      ],
    );
    expect(
      article.props,
      [
        article.author,
        article.title,
        article.description,
        article.url,
        article.urlToImage,
        article.publishedAt,
        article.content,
      ],
    );
  });

  group('from json', () {
    test(
        'make sure the fromJson function returns a valid model object when reading valid JSON',
        () {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('article_model.json'));
      final result = NewsModel.fromJson(jsonMap);
      expect(result, newsModel);

      final articleJsonMap = jsonMap['articles'][0];
      final resultArticle = Article.fromJson(articleJsonMap);
      expect(resultArticle, article);
    });

    // test('make sure from json func handle invalid Json gradfull', () {
    //   const invalidJson =
    //       '{"status": "error","code": "apiKeyMissing","message": "Your API key is missing. Append this to the URL with the apiKey param, or use the x-api-key HTTP header."}';
    //   final Map<String, dynamic> jsonMap = json.decode(invalidJson);
    //   expect(
    //       () => NewsModel.fromJson(jsonMap), throwsA(isA<ServerException>()));
    //   try {
    //     final Map<String, dynamic> jsonMap = json.decode(invalidJson);
    //     final result = NewsModel.fromJson(jsonMap);

    //     // Jika berhasil menciptakan objek, ini adalah kesalahan yang harus dihindari
    //     fail('Expected a ServerException but succeeded with result: $result');
    //   } catch (e) {
    //     expect(e, isA<ServerException>());
    //     expect((e as ServerException),
    //         "Your API key is missing. Append this to the URL with the apiKey param, or use the x-api-key HTTP header.");
    //   }
    // });
  });

  group('to json', () {
    test('make sure the toJson function returns a JSON value in the form of a',
        () {
      final resultNewsModel = newsModel.toJson();
      final resultArticle = article.toJson();
      final expectedMapArticle = {
        "author": "Liputan6.com",
        "title":
            "Bos Meta Umumkan Pengguna WhatsApp Bakal Bisa Punya 2 Akun di 1 Perangkat - Liputan6.com",
        "description": null,
        "url":
            "https://news.google.com/rss/articles/CBMidWh0dHBzOi8vd3d3LmxpcHV0YW42LmNvbS90ZWtuby9yZWFkLzU0Mjc3MzcvYm9zLW1ldGEtdW11bWthbi1wZW5nZ3VuYS13aGF0c2FwcC1iYWthbC1iaXNhLXB1bnlhLTItYWt1bi1kaS0xLXBlcmFuZ2thdNIBAA?oc=5",
        "urlToImage": null,
        "publishedAt": '2023-10-20T00:30:58.000Z',
        "content": null
      };
      final expectedMapNewsModel = {
        'status': 'ok',
        'totalResults': 38,
        'articles': [
          expectedMapArticle,
        ],
      };
      expect(resultNewsModel, expectedMapNewsModel);
      expect(resultArticle, expectedMapArticle);
    });
  });
}
