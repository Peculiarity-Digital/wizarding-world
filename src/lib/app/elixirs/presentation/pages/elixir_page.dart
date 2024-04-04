import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wizarding_world/lib.dart';

@RoutePage()
class ElixirPage extends StatelessWidget {
  const ElixirPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExternalElixirBloc>(
      create: (context) => loc()..add(const GetElixirEvent()),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Elixirs',
        ),
        bottomNavigationBar: const AppBottomNav(),
        body: SafeArea(
          child: ResponsiveBuilder(
            builder: (context, info) {
              if (info.isMobile) {
                return const ElixirListView();
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
