import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/features/news/data/models/news_model.dart';
import 'package:news_app/features/news/domain/usecases/get_news_usecases.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';

import 'news_bloc_test.mocks.dart';

@GenerateMocks([GetNewsUseCase])
void main() {
  late NewsBloc newsBloc;
  late MockGetNewsUseCase mockGetNewsUseCase;
  setUp(() {
    mockGetNewsUseCase = MockGetNewsUseCase();
    newsBloc = NewsBloc(getNewsUseCase: mockGetNewsUseCase);
  });

  final article = Article(
      author: "Poskota",
      title:
          "Nonton Bokeh Terbaru 2023 Durasi Panjang Lewat Yandex Com Yandex Browser Jepang Tanpa VPN - poskota.co.id - Poskota",
      description: null,
      url:
          "https://news.google.com/rss/articles/CBMiemh0dHBzOi8vcG9za290YS5jby5pZC8yMDIzLzEwLzIyL25vbnRvbi1ib2tlaC10ZXJiYXJ1LTIwMjMtZHVyYXNpLXBhbmphbmctbGV3YXQteWFuZGV4LWNvbS15YW5kZXgtYnJvd3Nlci1qZXBhbmctdGFucGEtdnBu0gEA?oc=5",
      urlToImage: null,
      publishedAt: DateTime.parse("2023-10-22T06:31:09Z"),
      content: null);

  final listArticle = <Article>[article];

  group('news article', () {
    test('initial state should be initial', () {
      expect(newsBloc.state, GetDataNewsInitial());
    });

    blocTest<NewsBloc, NewsState>(
      'should emit [GetDataNewsLoading, GetDataSuccess] when data complete',
      build: () {
        when(mockGetNewsUseCase.execute())
            .thenAnswer((_) async => Right(listArticle));
        return newsBloc;
      },
      act: (bloc) => bloc.add(GetDataNewsEvent()),
      expect: () =>
          [GetDataNewsLoading(), GetDataNewsSuccess(articles: listArticle)],
      verify: (_) => verify(mockGetNewsUseCase.execute()),
    );

    blocTest<NewsBloc, NewsState>(
      'should emit [GetDataNewsLoading, GetDataSuccess] when data failed',
      build: () {
        when(mockGetNewsUseCase.execute())
            .thenAnswer((_) async => const Left(ServerFailure('failed')));
        return newsBloc;
      },
      act: (bloc) => bloc.add(GetDataNewsEvent()),
      expect: () =>
          [GetDataNewsLoading(), const GetDataNewsFailed(message: 'failed')],
      verify: (_) => verify(mockGetNewsUseCase.execute()),
    );
  });
}
