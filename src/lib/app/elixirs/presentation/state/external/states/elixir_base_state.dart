import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:wizarding_world/lib.dart';

abstract class ExternalElixirState extends Equatable {
  final List<ElixirEntity>? elixirs;
  final DioException? exception;

  const ExternalElixirState({
    this.elixirs,
    this.exception,
  });

  @override
  List<Object> get props => [elixirs!, exception!];
}
