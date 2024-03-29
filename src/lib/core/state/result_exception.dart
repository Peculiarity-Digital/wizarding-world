import 'package:dio/dio.dart';
import 'package:wizarding_world/core/state/index.dart';

class ResultException<TResult> extends ResultState<TResult> {
  const ResultException(DioException error) : super(error: error);
}
