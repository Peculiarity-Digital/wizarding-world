import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wizarding_world/lib.dart';

class HousesGridView extends StatelessWidget {
  const HousesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExternalHousesBloc, ExternalHouseState>(
      builder: (_, state) {
        if (state is ExternalHouseLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ExternalHouseExceptionState) {
          return const Center(
            child: Icon(Icons.warning),
          );
        }

        if (state is ExternalHouseDoneState) {
          return Center(
            child: Container(
              padding: EdgeInsets.zero,
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: state.houses!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, count) {
                  return GestureDetector(
                    onTap: () {
                      context.router.push(
                        HomeRouteDetail(
                          house: state.houses![count] as HouseModel,
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(),
                          const SizedBox(height: 15),
                          Text(
                            state.houses![count].name!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
