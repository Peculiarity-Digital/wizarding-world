import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wizarding_world/lib.dart';

@RoutePage()
class ElixirDetailPage extends StatefulWidget {
  const ElixirDetailPage({required this.elixir, super.key});

  final ElixirModel elixir;

  @override
  State<ElixirDetailPage> createState() => _ElixirDetailPageState();
}

class _ElixirDetailPageState extends State<ElixirDetailPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Elixir Detail',
      ),
      bottomNavigationBar: const AppBottomNav(),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        children: [
          // Image Placeholder
          Container(
            height: 280,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://dummyimage.com/640x360/fff/aaa'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.5),
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              height: 280,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          // Quick Look Overview
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 30,
              left: 16,
              right: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.sports_gymnastics,
                      size: 12.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Text(
                        widget.elixir.difficulty!.name.toTitleCase(),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.alarm,
                      size: 12.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Text(
                        widget.elixir.time.toString() == 'null'
                            ? '--:--'
                            : widget.elixir.time!,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 12,
                    top: 16,
                  ),
                  child: Text(
                    widget.elixir.name!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  widget.elixir.effect!,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 150 / 100,
                  ),
                ),
              ],
            ),
          ),
          // TabBar
          Container(
            height: 60.0,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.zero,
            child: TabBar(
              controller: _tabController,
              onTap: (index) {
                setState(() {
                  _tabController.index = index;
                });
              },
              tabs: const [
                Tab(
                  text: 'Ingredients',
                ),
                Tab(text: 'Inventors'),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 260.0,
            ),
            child: IndexedStack(
              index: _tabController.index,
              children: [
                // Ingredients
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: widget.elixir.ingredients!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 24,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 9,
                              child: Text(
                                widget.elixir.ingredients![index].name!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  height: 150 / 100,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                // Inventors
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: widget.elixir.inventors!.length,
                  itemBuilder: (context, index) {
                    if (widget.elixir.inventors!.isEmpty) {
                      return const Center(
                        child: Text('No Inventors'),
                      );
                    } else {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 24,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 24,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 9,
                                child: Text(
                                  '${widget.elixir.inventors![index].firstName!} ${widget.elixir.inventors![index].lastName!}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    height: 150 / 100,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
