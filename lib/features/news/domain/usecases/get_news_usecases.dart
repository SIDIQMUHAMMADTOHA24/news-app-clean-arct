import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/features/news/data/models/news_model.dart';
import 'package:news_app/features/news/domain/repositories/news_repository.dart';

class GetNewsUseCase {
  final NewsRepository newsRepository;

  GetNewsUseCase(this.newsRepository);
  Future<Either<Failure, List<Article>>> execute() {
    return newsRepository.getData();
  }
}
