import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'individual/individual_page.dart';
import 'initial/initial_page.dart';
import 'message/message_page.dart';
import 'publish/publish_page.dart';
import 'shop/shop_page.dart';

/// CreateDate: 2025/1/10 15:11
/// Author: Lee
/// Description:

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeTabEnum? _selectTab = HomeTabEnum.initial;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: switch (_selectTab) {
                HomeTabEnum.initial => const InitialPage(),
                HomeTabEnum.shop => const ShopPage(),
                HomeTabEnum.publish => const PublishPage(),
                HomeTabEnum.message => const MessagePage(),
                _ => const IndividualPage(),
              },
            ),
            _buildHomeNavigator(),
          ],
        ),
      );

  Widget _buildHomeNavigator() => ColoredBox(
        color: _selectTab == HomeTabEnum.initial ? Colors.teal : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: HomeTabEnum.values
              .map(
                (e) => _buildSingleNavigator(e),
              )
              .toList(),
        ),
      );

  Widget _buildSingleNavigator(HomeTabEnum tab) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => setState(() => _selectTab = tab),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              tab.name.tr,
              style: TextStyle(
                fontSize: 14.0,
                color: _selectTab == HomeTabEnum.initial
                    ? Colors.white
                    : const Color(0xFF66676F),
              ),
            ),
          ),
        ),
      );
}

enum HomeTabEnum { initial, shop, publish, message, individual }
