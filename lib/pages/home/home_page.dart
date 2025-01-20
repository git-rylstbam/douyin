import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/storage_util.dart';
import 'individual/individual_page.dart';
import 'initial/initial_page.dart';
import 'initial/model/model.dart';
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

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  HomeTabEnum? _selectTab = HomeTabEnum.initial;

  final _controller = PageController();

  List<ProductEntity> _products = [];

  bool get _hasInitialKey => StorageUtil.has(StorageKeyEnum.initial);

  @override
  void initState() {
    super.initState();
    if (!_hasInitialKey) {
      products.shuffle();
      ProductEntity.save(products);
    }
    _products = ProductEntity.read();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: switch (_selectTab) {
              HomeTabEnum.initial => InitialPage(
                  controller: _controller,
                  products: _products,
                ),
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
  }

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
          onDoubleTap: _selectTab == HomeTabEnum.initial
              ? () => _controller.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  )
              : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: switch (tab) {
              HomeTabEnum.initial => Row(
                  spacing: 4.0,
                  children: [
                    Text(
                      tab.name.tr,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: _selectTab == HomeTabEnum.initial
                            ? Colors.white
                            : const Color(0xFF66676F),
                      ),
                    ),
                    if (_selectTab == HomeTabEnum.initial)
                      Icon(
                        Icons.multiple_stop,
                        size: 10.0,
                        color: _selectTab == HomeTabEnum.initial
                            ? Colors.white
                            : const Color(0xFF66676F),
                      ),
                  ],
                ),
              HomeTabEnum.publish => Icon(
                  Icons.add_circle_outline,
                  size: 20.0,
                  color: _selectTab == HomeTabEnum.initial
                      ? Colors.white
                      : const Color(0xFF66676F),
                ),
              _ => Text(
                  tab.name.tr,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: _selectTab == HomeTabEnum.initial
                        ? Colors.white
                        : const Color(0xFF66676F),
                  ),
                ),
            },
          ),
        ),
      );
}

enum HomeTabEnum { initial, shop, publish, message, individual }
