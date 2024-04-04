import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:wizarding_world/lib.dart';

part 'houses_service.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class HousesService {
  factory HousesService(Dio dio) = _HousesService;

  @GET('/houses')
  Future<HttpResponse<List<HouseModel>>> getHouses();

  @GET('/houses/{id}')
  Future<HttpResponse<HouseModel>> getHouseById(
    @Path('id') String id,
  );
}
