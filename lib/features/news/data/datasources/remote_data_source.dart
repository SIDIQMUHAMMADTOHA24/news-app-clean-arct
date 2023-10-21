import 'dart:convert';
import 'package:news_app/common/config.dart';
import 'package:news_app/common/exeption.dart';
import 'package:news_app/features/news/data/models/news_model.dart';
import 'package:http/http.dart' as http;

abstract class NewsRemoteDataSource {
  Future<NewsModel> getData();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  // final Dio dio;
  final http.Client client;

  NewsRemoteDataSourceImpl(
    this.client,
  );
  @override
  Future<NewsModel> getData() async {
    final responseV2 = await http.get(
        Uri.parse('${baseUrl}top-headlines?country=$country&apiKey=$apiKey'));
    if (responseV2.statusCode == 200) {
      return NewsModel.fromJson(json.decode(responseV2.body));
    } else {
      throw ServerException();
    }
  }
}
