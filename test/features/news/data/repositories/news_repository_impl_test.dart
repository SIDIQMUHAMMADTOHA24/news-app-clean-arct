import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/features/news/data/models/news_model.dart';
import 'package:news_app/features/news/data/repositories/news_repository_impl.dart';

import '../../../../helper/tes_helper.mocks.dart';

void main() {
  late NewsRepositoryImpl newsRepositoryImpl;
  late MockNetworkInfo mockNetworkInfo;
  late MockNewsRemoteDataSource mockNewsRemoteDataSource;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockNewsRemoteDataSource = MockNewsRemoteDataSource();
    newsRepositoryImpl = NewsRepositoryImpl(
        newsRemoteDataSource: mockNewsRemoteDataSource,
        networkInfo: mockNetworkInfo);
  });
  final article = Article(
      author: "Nasional Kompas.com",
      title:
          "Golkar Resmi Dukung Gibran Jadi Cawapres Prabowo Subianto - Kompas.com - Nasional Kompas.com",
      description: null,
      url:
          "https://news.google.com/rss/articles/CBMibmh0dHBzOi8vbmFzaW9uYWwua29tcGFzLmNvbS9yZWFkLzIwMjMvMTAvMjEvMTEyNjI4NzEvZ29sa2FyLXJlc21pLWR1a3VuZy1naWJyYW4tamFkaS1jYXdhcHJlcy1wcmFib3dvLXN1YmlhbnRv0gFyaHR0cHM6Ly9hbXAua29tcGFzLmNvbS9uYXNpb25hbC9yZWFkLzIwMjMvMTAvMjEvMTEyNjI4NzEvZ29sa2FyLXJlc21pLWR1a3VuZy1naWJyYW4tamFkaS1jYXdhcHJlcy1wcmFib3dvLXN1YmlhbnRv?oc=5",
      urlToImage: null,
      publishedAt: DateTime.parse('2023-10-21T04:26:00Z'),
      content: null);

  final newsModel =
      NewsModel(status: 'ok', totalResults: 37, articles: [article]);

  group('playing newsmodel', () {
    test('should check if the device is online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockNewsRemoteDataSource.getData())
          .thenAnswer((realInvocation) async => newsModel);
      await newsRepositoryImpl.getData();
      verify(mockNetworkInfo.isConnected);
    });
  });
}
