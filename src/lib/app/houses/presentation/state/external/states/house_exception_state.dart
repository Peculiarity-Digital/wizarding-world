import 'package:dio/dio.dart';
import 'package:wizarding_world/lib.dart';

class ExternalHouseExceptionState extends ExternalHouseState {
  const ExternalHouseExceptionState(
    DioException exception,
  ) : super(exception: exception);
}
