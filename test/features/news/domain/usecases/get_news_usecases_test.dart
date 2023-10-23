import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/features/news/data/models/news_model.dart';
import 'package:news_app/features/news/domain/repositories/news_repository.dart';
import 'package:news_app/features/news/domain/usecases/get_news_usecases.dart';

import '../../../../fixture/fixture_reader.dart';
import 'get_news_usecases_test.mocks.dart';

@GenerateMocks([NewsRepository])
void main() {
  late GetNewsUseCase getNewsUseCase;
  late MockNewsRepository mockNewsRepository;
  setUp(() {
    mockNewsRepository = MockNewsRepository();
    getNewsUseCase = GetNewsUseCase(newsRepository: mockNewsRepository);
  });

  test(
      'make sure that NewsRepository successfully gets a successful or failed response from the getTopHeadlinesNews ',
      () async {
    final newsModel =
        NewsModel.fromJson(json.decode(fixture('news_model.json')));

    final listArticle = newsModel.articles;
    when(mockNewsRepository.getData())
        .thenAnswer((_) async => Right(listArticle));

    final result = await getNewsUseCase.execute();
    expect(result, Right(listArticle));
    verify(mockNewsRepository.getData());
  });
}
