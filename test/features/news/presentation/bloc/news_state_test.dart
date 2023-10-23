import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/features/news/data/models/news_model.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';

import '../../../../fixture/fixture_reader.dart';

void main() {
  test('state initial success', () async {
    expect(GetDataNewsInitial().props, []);
  });

  test('state loading success', () async {
    expect(GetDataNewsLoading().props, []);
  });

  test('state failed success', () async {
    expect(const GetDataNewsFailed(message: 'failed').props, ['failed']);
  });

  test('state success', () async {
    final newsModel =
        NewsModel.fromJson(json.decode(fixture('news_model.json')));

    final listArticle = newsModel.articles;
    final getDataNewsArticleSuccess = GetDataNewsSuccess(articles: listArticle);
    expect(
        getDataNewsArticleSuccess.props, [getDataNewsArticleSuccess.articles]);
  });
}
