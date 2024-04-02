import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:wizarding_world/lib.dart';

abstract class ExternalHouseState extends Equatable {
  final List<HouseEntity>? houses;
  final DioException? exception;

  const ExternalHouseState({
    this.houses,
    this.exception,
  });

  @override
  List<Object> get props => [houses!, exception!];
}
