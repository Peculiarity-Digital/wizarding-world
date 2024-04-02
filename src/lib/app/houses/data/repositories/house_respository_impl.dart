import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wizarding_world/app/index.dart';
import 'package:wizarding_world/core/index.dart';

class HouseRepositoryImpl implements HouseRepository {
  final WizardingWorldService _service;

  const HouseRepositoryImpl(this._service);

  @override
  Future<ResultState<HouseModel>> getHouseById({String? id}) async {
    try {
      if (id == null) {
        throw Exception('id cannot be null');
      }

      final result = await _service.getHouseById(id);

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
  Future<ResultState<List<HouseModel>>> getHouses() async {
    try {
      final result = await _service.getHouses();

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
