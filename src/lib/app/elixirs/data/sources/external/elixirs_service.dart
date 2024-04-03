import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:wizarding_world/lib.dart';

part 'elixirs_service.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class ElixirsService {
  factory ElixirsService(Dio dio) = _ElixirsService;

  @GET('/elixirs')
  Future<HttpResponse<List<ElixirModel>>> getElixirs(
    @QueryParam('name') String? name,
    @QueryParam('difficulty') String? difficulty,
    @QueryParam('ingredient') String? ingredient,
    @QueryParam('inventorFullName') String? inventorFullName,
    @QueryParam('manufacturer') String? manufacturer,
  );

  @GET('/elixirs/{id}')
  Future<HttpResponse<ElixirModel>> getElixirById(
    @Path('id') String id,
  );
}
