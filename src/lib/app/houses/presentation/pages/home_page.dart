import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wizarding_world/lib.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExternalHousesBloc>(
      create: (context) => loc()..add(const GetHousesEvent()),
      child: Scaffold(
        appBar: const HousesAppBar(),
        bottomNavigationBar: SnakeNavigationBar.color(
          padding: const EdgeInsets.all(4.0),
          onTap: (index) {},
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'tickets',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.podcasts),
              label: 'microphone',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'search',
            ),
          ],
        ),
        body: SafeArea(
          child: ResponsiveBuilder(
            builder: (context, info) {
              if (info.isMobile) {
                return const HousesGridView();
              }

              return const Center(
                child: Text('No implementation'),
              );
            },
          ),
        ),
      ),
    );
  }
}
