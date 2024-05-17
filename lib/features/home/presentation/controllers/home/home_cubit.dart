// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/home/domain/usecases/get_headlines_usecase.dart';
import 'package:news_app/features/search_news/domain/entities/news_search.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHeadlines getHeadlinesUsecase;

  HomeCubit({required this.getHeadlinesUsecase}) : super(const HomeInitialState());

  void initHome() async {
    emit(const HomeLoadingState());

    final headlinesOrFailure = await getHeadlinesUsecase.call(NoParams());

    headlinesOrFailure.fold(
      (failure) => emit(
        const HomeFailureState(),
      ),
      (headlines) {
        if (headlines.articles != null) {
          if (headlines.articles!.isEmpty) {
            emit(
              const HomeFailureState(),
            );
          } else {
            emit(
              HomeSuccessState(
                headlines: headlines,
              ),
            );
          }
        } else {
          emit(
            const HomeFailureState(),
          );
        }
      },
    );
  }
}
