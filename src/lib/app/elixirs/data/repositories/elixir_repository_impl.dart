import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wizarding_world/lib.dart';

class ElixirRepositoryImpl implements ElixirRepository {
  final ElixirsService _service;

  const ElixirRepositoryImpl(this._service);

  @override
  Future<ResultState<ElixirModel>> getElixirById({String? id}) async {
    try {
      if (id == null) {
        throw Exception('id cannot be null');
      }

      final result = await _service.getElixirById(id);

      if (result.response.statusCode == HttpStatus.ok) {
        return ResultSuccess(result.data);
      } else {
        return ResultException(
          DioException(
            error: result.response.statusMessage,
            response: result.response,
            type: DioExceptionType.badResponse,
            requestOptions: result.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return ResultException(e);
    }
  }

  @override
  Future<ResultState<List<ElixirModel>>> getElixirs(
    String? name,
    String? difficulty,
    String? ingredient,
    String? inventorFullName,
    String? manufacturer,
  ) async {
    try {
      final result = await _service.getElixirs(
        name,
        difficulty,
        ingredient,
        inventorFullName,
        manufacturer,
      );

      if (result.response.statusCode == HttpStatus.ok) {
        return ResultSuccess(result.data);
      } else {
        return ResultException(
          DioException(
            error: result.response.statusMessage,
            response: result.response,
            type: DioExceptionType.badResponse,
            requestOptions: result.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return ResultException(e);
    }
  }
}
