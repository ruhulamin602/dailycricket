import 'package:daily_cricket/src/bloc/movie/result_state.dart';

import 'package:daily_cricket/src/models/articles/articles.dart';
import 'package:daily_cricket/src/repository/api_repository.dart';
import 'package:daily_cricket/src/services/api_result.dart';
import 'package:daily_cricket/src/services/network_exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedArticleCubit extends Cubit<ResultState<Articles>> {
  final APIRepository apiRepository;

  FeaturedArticleCubit({this.apiRepository})
      : assert(apiRepository != null),
        super(Idle());

  loadFeaturedArticle() async {
    emit(ResultState.loading());
    ApiResult<Articles> apiResult = await apiRepository.fetchEditorPick();
    print(apiResult);
    apiResult.when(success: (Articles data) {
      emit(ResultState.data(data: data));
    }, failure: (NetworkExceptions error) {
      emit(ResultState.error(error: error));
    });
  }
}
