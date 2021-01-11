
import 'package:daily_cricket/src/models/articles/article_response.dart';
import 'package:daily_cricket/src/models/articles/articles.dart';
import 'package:daily_cricket/src/services/api_result.dart';
import 'package:daily_cricket/src/services/dio_client.dart';
import 'package:daily_cricket/src/services/network_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_config/flutter_config.dart';


class APIRepository {
  DioClient dioClient;
  
  String _baseUrl = FlutterConfig.get("API_UR");

  APIRepository() {
    var dio = Dio();

    dioClient = DioClient(_baseUrl, dio);
  }

  Future<ApiResult<List<Articles>>> fetchArticleList() async {
    try {
      final response = await dioClient
          .get("movie/popular",);
      List<Articles> movieList = ArticleResponse.fromJson(response).data;
      return ApiResult.success(data: movieList);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
