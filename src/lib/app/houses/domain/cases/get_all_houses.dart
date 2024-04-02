import 'package:wizarding_world/lib.dart';

class GetAllHousesCase
    implements BaseCase<ResultState<List<HouseEntity>>, void> {
  final HouseRepository _repository;

  GetAllHousesCase(this._repository);

  @override
  Future<ResultState<List<HouseEntity>>> call({void params}) {
    return _repository.getHouses();
  }
}
