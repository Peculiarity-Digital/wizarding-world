import 'dart:io';

import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/dio.dart';
import 'package:wizarding_world/lib.dart';

import 'house_respository_impl_test.mocks.dart';

@GenerateMocks([HousesService])
void main() {
  late HouseRepositoryImpl repository;
  late MockHousesService mockService;

  setUp(() {
    mockService = MockHousesService();
    repository = HouseRepositoryImpl(mockService);
  });

  group(
    'Get all houses implementation',
    () {
      test('can successfully return Houses from service', () async {
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

        final response = HttpResponse<List<HouseModel>>(
          houses,
          Response(
            data: houses,
            statusCode: HttpStatus.ok,
            requestOptions: RequestOptions(),
          ),
        );

        when(mockService.getHouses()).thenAnswer(
          (_) async => response,
        );

        // Act
        final result = await repository.getHouses();

        // Assert
        expect(result.result, houses);
      });

      test('result from API results in exception', () async {
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

        // Act
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

        final response = HttpResponse<List<HouseModel>>(
          houses,
          Response(
            data: houses,
            statusCode: HttpStatus.badRequest,
            requestOptions: RequestOptions(),
          ),
        );

        when(mockService.getHouses()).thenAnswer(
          (_) async => response,
        );

        // Act
        final result = await repository.getHouses();

        // Assert
        expect(result.error!.type, DioExceptionType.badResponse);
      });

      test('result from API results in exception', () async {
        // Arrange
        final dioException = DioException(
          requestOptions: RequestOptions(path: '/houses'),
        );
        when(mockService.getHouses()).thenThrow(dioException);

        // Act
        final result = await repository.getHouses();

        // Assert
        expect(result.error, isNotNull);
        expect(result.error!.type, DioExceptionType.unknown);
      });
    },
  );

  group(
    'Get house by identifier implementation',
    () {
      test('can successfully return house by id from service', () async {
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

        final HouseModel house = HouseModel(
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
        );

        final response = HttpResponse<HouseModel>(
          house,
          Response(
            data: house.toJson(),
            statusCode: HttpStatus.ok,
            requestOptions: RequestOptions(),
          ),
        );

        when(mockService.getHouseById(id)).thenAnswer(
          (_) async => response,
        );

        // Act
        final result = await repository.getHouseById(id: id);

        // Assert
        expect(result.result, house);
      });

      test('result from API results in exception', () async {
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

        final HouseModel house = HouseModel(
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
        );

        final response = HttpResponse<HouseModel>(
          house,
          Response(
            data: house,
            statusCode: HttpStatus.badRequest,
            requestOptions: RequestOptions(),
          ),
        );

        when(mockService.getHouseById(id)).thenAnswer(
          (_) async => response,
        );

        // Act
        final result = await repository.getHouseById(id: id);

        // Assert
        expect(result.error!.type, DioExceptionType.badResponse);
      });

      test('result from API results in exception', () async {
        // Arrange
        final dioException = DioException(
          requestOptions: RequestOptions(path: '/house/{id}'),
        );
        when(mockService.getHouseById(any)).thenThrow(dioException);

        // Act
        final result = await repository.getHouseById(id: faker.guid.guid());

        // Assert
        expect(result.error, isNotNull);
        expect(result.error!.type, DioExceptionType.unknown);
      });
    },
  );
}
