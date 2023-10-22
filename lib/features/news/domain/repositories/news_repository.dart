import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/features/news/data/models/news_model.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<Article>>> getData();
}
