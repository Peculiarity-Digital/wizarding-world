import 'package:wizarding_world/lib.dart';

abstract class ElixirRepository {
  Future<ResultState<List<ElixirEntity>>> getElixirs(
    String? name,
    String? difficulty,
    String? ingredient,
    String? inventorFullName,
    String? manufacturer,
  );

  Future<ResultState<ElixirEntity>> getElixirById({
    String? id,
  });
}
