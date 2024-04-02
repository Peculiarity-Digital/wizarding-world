import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wizarding_world/lib.dart';

part 'app_routes.gr.dart';

@AutoRouterConfig()
class AppRoute extends _$AppRoute {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: HomeRouteDetail.page),
      ];
}
