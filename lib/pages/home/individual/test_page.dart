import 'package:flutter/material.dart';

import '../../../utils/icon_util.dart';

/// CreateDate: 2025/1/22 16:59
/// Author: Lee
/// Description:

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Choice _selectedChoice = choices[0];

  void _select(Choice choice) => setState(() => _selectedChoice = choice);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: choices.length,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: _headerSliverBuilder,
            body: TabBarView(
              children: choices
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ChoiceCard(choice: e),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      );

  List<Widget> _headerSliverBuilder(
    BuildContext context,
    bool innerBoxIsScrolled,
  ) =>
      [
        SliverAppBar(
          leading: Icon(_selectedChoice.icon),
          title: Text(_selectedChoice.title),
          actions: [
            IconButton(
              onPressed: () => _select(choices[0]),
              icon: Icon(choices[0].icon),
            ),
            IconButton(
              onPressed: () => _select(choices[1]),
              icon: Icon(choices[1].icon),
            ),
            PopupMenuButton(
              itemBuilder: (_) => choices
                  .skip(2)
                  .map(
                    (e) => PopupMenuItem(value: e, child: Text(e.title)),
                  )
                  .toList(),
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: Image.asset(IconUtil.icon_009, fit: BoxFit.cover),
          ),
          bottom: TabBar(
            padding: const EdgeInsets.only(top: 60.0),
            tabs: choices
                .map((e) => Tab(text: e.title, icon: Icon(e.icon)))
                .toList(),
          ),
          elevation: 1.0,
          backgroundColor: Colors.red,
          iconTheme: ThemeData().primaryIconTheme,
          centerTitle: true,
          titleSpacing: NavigationToolbar.kMiddleSpacing,
          expandedHeight: 200.0,
          floating: true,
          pinned: true,
          snap: true,
        ),
      ];
}

class Choice {
  const Choice({required this.title, required this.icon});

  final String title;
  final IconData icon;
}

const choices = [
  Choice(title: 'Car', icon: Icons.directions_car),
  Choice(title: 'Bicycle', icon: Icons.directions_bike),
  Choice(title: 'Boat', icon: Icons.directions_boat),
  Choice(title: 'Bus', icon: Icons.directions_bus),
  Choice(title: 'Train', icon: Icons.directions_railway),
  Choice(title: 'Walk', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({super.key, required this.choice});

  final Choice choice;

  @override
  Widget build(BuildContext context) => Card(
        color: Colors.white,
        child: Center(
          child: ListView.builder(
            itemBuilder: (_, index) => ListTile(
              leading: Icon(choice.icon),
              title: Text('This is a ${choice.title}'),
            ),
            itemCount: 30,
          ),
        ),
      );
}
