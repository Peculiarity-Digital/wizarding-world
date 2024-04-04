import 'package:wizarding_world/lib.dart';

abstract class HouseRepository {
  Future<ResultState<List<HouseEntity>>> getHouses();
  Future<ResultState<HouseEntity>> getHouseById({
    String id,
  });
}
