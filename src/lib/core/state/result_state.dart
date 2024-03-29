import 'package:dio/dio.dart';

abstract class ResultState<TResult> {
  const ResultState({
    this.result,
    this.error,
  });

  final TResult? result;
  final DioException? error;
}
