import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wizarding_world/lib.dart';

class ElixirListView extends StatelessWidget {
  const ElixirListView({super.key});

  Color _colorByDifficulty(ElixirDifficulty difficulty) => switch (difficulty) {
        ElixirDifficulty.advanced => Colors.red.shade200,
        ElixirDifficulty.unknown => Colors.grey.shade100,
        ElixirDifficulty.moderate => Colors.orange.shade200,
        ElixirDifficulty.beginner => Colors.green.shade200,
        ElixirDifficulty.oneOfAKind => Colors.blue.shade300,
        ElixirDifficulty.ordinaryWizardingLevel => Colors.purple.shade200,
      };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExternalElixirBloc, ExternalElixirState>(
      builder: (_, state) {
        if (state is ExternalElixirLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ExternalElixirExceptionState) {
          return const Center(
            child: Icon(Icons.warning),
          );
        }

        if (state is ExternalElixirDoneState) {
          final Map<String, List<ElixirEntity>> grouped = {};

          for (final elixir in state.elixirs!) {
            final key = elixir.name![0].toUpperCase();

            if (!grouped.containsKey(key)) {
              grouped[key] = [];
            }

            grouped[key]!.add(elixir);
          }

          final sortedGroup = grouped.keys.toList()..sort();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.grey[200],
                child: const Column(
                  children: [
                    Text(
                      'Filters',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                    Divider(),
                    Text('Not implemented'),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView.builder(
                    itemCount: sortedGroup.length,
                    itemBuilder: (context, index) {
                      final key = sortedGroup[index];
                      final currentGroup = grouped[key]!;

                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              key,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22.0,
                              ),
                            ),
                            trailing: Badge(
                              label: Text('${currentGroup.length}'),
                            ),
                          ),
                          const Divider(),
                          ListView.builder(
                            itemCount: currentGroup.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  context.router.replace(
                                    ElixirDetailRoute(
                                      elixir:
                                          currentGroup[index] as ElixirModel,
                                    ),
                                  );
                                },
                                child: Card(
                                  color: _colorByDifficulty(
                                    currentGroup[index].difficulty!,
                                  ),
                                  margin: const EdgeInsets.all(4.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(4.0),
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Text(
                                      currentGroup[index].name!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
