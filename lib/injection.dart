import 'package:connectivity/connectivity.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/core/network/network_info.dart';
import 'package:news_app/features/news/data/datasources/remote_data_source.dart';
import 'package:news_app/features/news/data/repositories/news_repository_impl.dart';
import 'package:news_app/features/news/domain/repositories/news_repository.dart';
import 'package:news_app/features/news/domain/usecases/get_news_usecases.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';

final sl = GetIt.instance;

void init() async {
  //bloc
  sl.registerFactory(() => NewsBloc(getNewsUseCase: sl()));

  //usecase
  sl.registerLazySingleton(() => GetNewsUseCase(newsRepository: sl()));

  //repository
  sl.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(networkInfo: sl(), newsRemoteDataSource: sl()));

  //data source
  sl.registerLazySingleton<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl(client: sl()));

  //core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectivity: sl()));

  sl.registerLazySingleton(() => Connectivity());
}
