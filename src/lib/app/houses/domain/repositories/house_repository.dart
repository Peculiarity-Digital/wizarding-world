import 'package:wizarding_world/app/index.dart';
import 'package:wizarding_world/core/index.dart';

abstract class HouseRepository {
  Future<ResultState<List<HouseEntity>>> getHouses();
  Future<ResultState<HouseEntity>> getHouseById({
    String id,
  });
}
