import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wizarding_world/lib.dart';

final loc = GetIt.instance;

Future<void> init() async {
  loc
    ..registerSingleton<Dio>(Dio())
    ..registerSingleton<WizardingWorldService>(WizardingWorldService(loc()))
    ..registerSingleton<HouseRepository>(HouseRepositoryImpl(loc()))
    ..registerSingleton<GetAllHousesCase>(GetAllHousesCase(loc()))
    ..registerFactory<ExternalHousesBloc>(() => ExternalHousesBloc(loc()));
}
