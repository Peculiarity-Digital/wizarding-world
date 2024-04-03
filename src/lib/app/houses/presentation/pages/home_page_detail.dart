import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wizarding_world/lib.dart';

@RoutePage()
class HomePageDetail extends StatelessWidget {
  const HomePageDetail({required this.house, super.key});

  final HouseModel house;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HousesAppBar(
        title: house.name!,
      ),
      bottomNavigationBar: const AppBottomNav(),
      body: SafeArea(
        child: ResponsiveBuilder(
          builder: (context, info) {
            if (info.isMobile) {
              return ListView(
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: _colorByName(name: house.name!),
                        stops: const [0.1, 0.8],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white70,
                              minRadius: 60.0,
                              child: CircleAvatar(
                                radius: 50.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          house.name!,
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${house.heads![0].firstName!} ${house.heads![0].lastName!}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.zero,
                            child: ListTile(
                              title: Text(
                                house.animal!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: const Text(
                                'Animal',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.zero,
                            child: ListTile(
                              title: Text(
                                house.element!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: const Text(
                                'Element',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text(
                            'Founder',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            house.founder!,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text(
                            'House Ghost',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            house.ghost!,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text(
                            'Common Room',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            house.commonRoom!,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text(
                            'House Heads',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            house.heads!
                                .map((e) => '${e.firstName} ${e.lastName}')
                                .join(', '),
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text(
                            'House Traits',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Wrap(
                            spacing: 6.0,
                            runSpacing: 6.0,
                            children: house.traits!
                                .map(
                                  (e) => Chip(
                                    label: Text(e.name!),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                ],
              );
            }

            return const Center(
              child: Text('No implementation'),
            );
          },
        ),
      ),
    );
  }

  List<Color> _colorByName({required String name}) {
    switch (name) {
      case 'Gryffindor':
        {
          return const [
            Color(0xFFAE0001),
            Color(0xFFEEBA30),
          ];
        }
      case 'Ravenclaw':
        {
          return const [
            Color(0xFF223164),
            Color(0xFF946B2D),
          ];
        }
      case 'Hufflepuff':
        {
          return const [
            Color(0xFFFFD25F),
            Color(0xFF000000),
          ];
        }
      case 'Slytherin':
        {
          return const [
            Color(0xFF2A623D),
            Color(0xFF5D5D5D),
          ];
        }
    }

    return [];
  }
}
