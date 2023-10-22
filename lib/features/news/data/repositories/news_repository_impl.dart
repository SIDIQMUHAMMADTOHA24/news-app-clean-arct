import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/core/network/network_info.dart';
import 'package:news_app/features/news/data/models/news_model.dart';
import 'package:news_app/features/news/domain/repositories/news_repository.dart';

import '../datasources/remote_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource newsRemoteDataSource;
  final NetworkInfo networkInfo;

  NewsRepositoryImpl(
      {required this.newsRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Article>>> getData() async {
    var isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        var result = await newsRemoteDataSource.getData();
        return Right(result.articles);
      } on Exception catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(ConnectioFailure('connection failure'));
    }
  }
}
