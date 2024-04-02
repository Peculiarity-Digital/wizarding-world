import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:wizarding_world/lib.dart';

part 'wizarding_world_service.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class WizardingWorldService {
  factory WizardingWorldService(Dio dio) = _WizardingWorldService;

  @GET('/houses')
  Future<HttpResponse<List<HouseModel>>> getHouses();

  @GET('/houses/{id}')
  Future<HttpResponse<HouseModel>> getHouseById(
    @Path('id') String id,
  );
}
