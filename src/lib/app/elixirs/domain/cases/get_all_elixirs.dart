import 'package:wizarding_world/lib.dart';

class GetAllElixirsCase
    implements BaseCase<ResultState<List<ElixirEntity>>, void> {
  final ElixirRepository _repository;

  GetAllElixirsCase(this._repository);

  @override
  Future<ResultState<List<ElixirEntity>>> call({void params}) {
    return _repository.getElixirs(
      null,
      null,
      null,
      null,
      null,
    );
  }
}
