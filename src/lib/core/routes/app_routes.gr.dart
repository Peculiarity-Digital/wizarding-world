// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_routes.dart';

abstract class _$AppRoute extends RootStackRouter {
  // ignore: unused_element
  _$AppRoute({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    HomeRouteDetail.name: (routeData) {
      final args = routeData.argsAs<HomeRouteDetailArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomePageDetail(
          house: args.house,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePageDetail]
class HomeRouteDetail extends PageRouteInfo<HomeRouteDetailArgs> {
  HomeRouteDetail({
    required HouseModel house,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRouteDetail.name,
          args: HomeRouteDetailArgs(
            house: house,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRouteDetail';

  static const PageInfo<HomeRouteDetailArgs> page =
      PageInfo<HomeRouteDetailArgs>(name);
}

class HomeRouteDetailArgs {
  const HomeRouteDetailArgs({
    required this.house,
    this.key,
  });

  final HouseModel house;

  final Key? key;

  @override
  String toString() {
    return 'HomeRouteDetailArgs{house: $house, key: $key}';
  }
}
