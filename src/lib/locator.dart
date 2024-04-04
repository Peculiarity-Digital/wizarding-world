// coverage:ignore-file

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wizarding_world/lib.dart';

final loc = GetIt.instance;

Future<void> init() async {
  loc
    ..registerSingleton<Dio>(Dio())
    ..registerSingleton<HousesService>(HousesService(loc()))
    ..registerSingleton<HouseRepository>(HouseRepositoryImpl(loc()))
    ..registerSingleton<GetAllHousesCase>(GetAllHousesCase(loc()))
    ..registerFactory<ExternalHousesBloc>(() => ExternalHousesBloc(loc()))
    ..registerSingleton<ElixirsService>(ElixirsService(loc()))
    ..registerSingleton<ElixirRepository>(ElixirRepositoryImpl(loc()))
    ..registerSingleton<GetAllElixirsCase>(GetAllElixirsCase(loc()))
    ..registerFactory<ExternalElixirBloc>(() => ExternalElixirBloc(loc()));
}
