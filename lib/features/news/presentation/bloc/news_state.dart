part of 'news_bloc.dart';

sealed class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class GetDataNewsInitial extends NewsState {}

class GetDataNewsLoading extends NewsState {}

class GetDataNewsSuccess extends NewsState {
  final List<Article> articles;

  const GetDataNewsSuccess({required this.articles});
  @override
  List<Object> get props => [articles];
}

class GetDataNewsFailed extends NewsState {
  final String message;

  const GetDataNewsFailed({required this.message});
  @override
  List<Object> get props => [message];
}
