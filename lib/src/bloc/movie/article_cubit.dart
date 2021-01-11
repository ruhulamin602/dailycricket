import 'package:daily_cricket/src/bloc/movie/result_state.dart';

import 'package:daily_cricket/src/models/articles/articles.dart';
import 'package:daily_cricket/src/repository/api_repository.dart';
import 'package:daily_cricket/src/services/api_result.dart';
import 'package:daily_cricket/src/services/network_exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ArticleCubit extends Cubit<ResultState<List<Articles>>> {
  final APIRepository apiRepository;

  ArticleCubit({this.apiRepository})
      : assert(apiRepository != null),
        super(Idle());

  loadArticles() async {
    emit(ResultState.loading());
    ApiResult<List<Articles>> apiResult = await apiRepository.fetchArticleList();
    apiResult.when(success: (List<Articles> data) {
      emit(ResultState.data(data: data));
    }, failure: (NetworkExceptions error) {
      emit(ResultState.error(error: error));
    });
  }
}
