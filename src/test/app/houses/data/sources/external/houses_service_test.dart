import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wizarding_world/lib.dart';

import 'houses_service_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  group('Wizarding World Service', () {
    late MockDio mockDio;
    late HousesService service;

    setUp(() {
      mockDio = MockDio();
      service = HousesService(mockDio);
    });

    test('can successfully retrieve houses from API', () async {
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

      final response = Response(
        data: houses.map((e) => e.toJson()).toList(),
        statusCode: 200,
        requestOptions: RequestOptions(baseUrl: ''),
      );

      when(mockDio.options).thenReturn(BaseOptions(baseUrl: apiBaseUrl));

      when(
        mockDio.fetch<List<Map<String, dynamic>>>(any),
      ).thenAnswer(
        (_) async {
          return response;
        },
      );

      final result = await service.getHouses();

      verify(mockDio.fetch<List<Map<String, dynamic>>>(any)).called(1);
      expect(result.data, equals(houses));
    });

    test('can successfully retrieve house from API by identifier', () async {
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

      final response = Response(
        data: house.toJson(),
        statusCode: 200,
        requestOptions: RequestOptions(baseUrl: apiBaseUrl),
      );

      when(mockDio.options).thenReturn(BaseOptions(baseUrl: apiBaseUrl));

      when(
        mockDio.fetch<Map<String, dynamic>>(any),
      ).thenAnswer(
        (_) async {
          return response;
        },
      );

      final result = await service.getHouseById(id);

      verify(mockDio.fetch<Map<String, dynamic>>(any)).called(1);
      expect(result.data, equals(house));
    });
  });
}
