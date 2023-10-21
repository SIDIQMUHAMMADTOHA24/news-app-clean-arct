import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:news_app/features/news/data/datasources/remote_data_source.dart';
import 'package:news_app/features/news/data/models/news_model.dart';
import 'package:http/http.dart' as http;
import '../../../../fixture/fixture_reader.dart';
import '../../../../helper/tes_helper.mocks.dart';

void main() {
  late NewsRemoteDataSourceImpl newsRemoteDataSourceImpl;
  late MockHttpClient mockHttpClient;

  //setup
  setUp(() {
    mockHttpClient = MockHttpClient();
    newsRemoteDataSourceImpl = NewsRemoteDataSourceImpl(mockHttpClient);
  });

  group('get data news api', () {
    final newsModel =
        NewsModel.fromJson(json.decode(fixture('news_model.json')));
    test('get data success', () async {
      //susuaikan data api, kareana sering berubah ubah
      when(mockHttpClient.get(Uri.parse(
              'https://newsapi.org/v2/top-headlines?country=id&apiKey=37da427941c4453ab51ff422cd4ff9e1')))
          .thenAnswer((_) async =>
              http.Response(fixture('news_model.json'), 200, headers: {
                HttpHeaders.contentTypeHeader:
                    'application/json; charset=utf-8',
              }));
      final respone = await newsRemoteDataSourceImpl.getData();
      expect(respone, equals(newsModel));
    });
  });

  // test('should throw a ServerException when the response code is 404 or other',
  //     () async {
  //   // arrange
  //   when(
  //     mockHttpClient.get(Uri.parse(
  //         'https://newsapi.org/v2/top-headlines')),
  //   ).thenAnswer((_) async => http.Response('Not Found', 401));
  //   // act
  //   final call = newsRemoteDataSourceImpl.getData();
  //   // assert
  //   expect(() => call, throwsA(isA<ServerException>()));
  // });
}
