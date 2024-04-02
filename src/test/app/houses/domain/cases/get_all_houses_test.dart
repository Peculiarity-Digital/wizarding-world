import 'dart:io';

import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/dio.dart';
import 'package:wizarding_world/app/houses/domain/cases/get_all_houses.dart';
import 'package:wizarding_world/lib.dart';

import 'get_all_houses_test.mocks.dart';

@GenerateMocks([HouseRepository])
void main() {
  late HouseRepositoryImpl mockRepository;
  late GetAllHousesCase useCase;

  setUp(() {
    mockRepository = MockHouseRepositoryImpl();
    useCase = GetAllHousesCase(mockRepository);
  });

  group('Get all houses use case', () {
    test('can successfully retrieve houses', () async {
      // Arrange
      final String id = faker.guid.guid();
      final String name = faker.company.name();
      final String houseColours = faker.color.color();
      final String founder = faker.person.name();
      final String animal = faker.animal.name();
      final String element = faker.food.cuisine();
      final String ghost = faker.vehicle.make();
      final String commonRoom = faker.conference.name();
      final List<HouseHeadModel> heads = [
        HouseHeadModel(
          id: faker.guid.guid(),
          firstName: faker.person.firstName(),
          lastName: faker.person.lastName(),
        ),
      ];
      final List<HouseTraitModel> traits = [
        HouseTraitModel(
          id: faker.guid.guid(),
          name: faker.sport.name(),
        ),
      ];

      final List<HouseModel> houses = [
        HouseModel(
          id: id,
          name: name,
          houseColours: houseColours,
          founder: founder,
          animal: animal,
          element: element,
          ghost: ghost,
          commonRoom: commonRoom,
          heads: heads,
          traits: traits,
        ),
      ];

      final responses = ResultSuccess<List<HouseModel>>(
        houses,
      );

      when(mockRepository.getHouses()).thenAnswer(
        (_) async => responses,
      );

      // Act
      final result = await useCase.call();

      // Assert
      expect(result.error, isNull);
      expect(result.result, houses);
    });
  });
}
