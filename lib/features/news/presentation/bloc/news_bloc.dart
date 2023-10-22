import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/features/news/data/models/news_model.dart';
import 'package:news_app/features/news/domain/usecases/get_news_usecases.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<GetDataNewsEvent, NewsState> {
  final GetNewsUseCase getNewsUseCase;
  NewsBloc({required this.getNewsUseCase}) : super(GetDataNewsInitial()) {
    on<GetDataNewsEvent>(_getDataNewsEvent);
  }

  _getDataNewsEvent(GetDataNewsEvent event, Emitter<NewsState> emit) async {
    emit(GetDataNewsLoading());
    final result = await getNewsUseCase.execute();
    result.fold((failure) => emit(GetDataNewsFailed(message: failure.message)),
        (data) {
      emit(GetDataNewsSuccess(articles: data));
      if (data.isEmpty) {
        emit(GetDataNewsLoading());
      }
    });
  }
}
