import 'package:dio/dio.dart';
import 'package:wizarding_world/lib.dart';

class ExternalElixirExceptionState extends ExternalHouseState {
  const ExternalElixirExceptionState(
    DioException exception,
  ) : super(exception: exception);
}
