import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/dismiss_scroll_bar.dart';
import 'experience/experience_page.dart';
import 'model/model.dart';

/// CreateDate: 2025/1/10 16:24
/// Author: Lee
/// Description:

class InitialPage extends StatefulWidget {
  const InitialPage({
    super.key,
    required this.controller,
    required this.products,
  });

  final PageController controller;
  final List<ProductEntity> products;

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage>
    with AutomaticKeepAliveClientMixin {
  final _topTabNotifier = ValueNotifier(InitialTopTabEnum.recommend);

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _topTabNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        fit: StackFit.expand,
        children: [
          _buildInitialPage(),
          Align(
            alignment: Alignment.topCenter,
            child: _buildTopNavigationLine(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => widget.products.shuffle());
          ProductEntity.save(widget.products);
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        child: const Icon(Icons.reorder),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  Widget _buildInitialPage() => ValueListenableBuilder(
        valueListenable: _topTabNotifier,
        builder: (_, value, __) => switch (value) {
          InitialTopTabEnum.recommend => ExperiencePage(
              controller: widget.controller,
              products: widget.products,
            ),
          _ => const SizedBox.shrink(),
        },
      );

  Widget _buildTopNavigationLine() => SizedBox(
        height: 40.0,
        child: Stack(
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
              child: Container(height: 40.0, color: Colors.grey),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.sort, color: Colors.white),
                ),
                Expanded(child: _buildTopNavigationbar()),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _buildTopNavigationbar() => DismissScrollbar(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: InitialTopTabEnum.values
              .map(
                _buildSingleNavigator,
              )
              .toList(),
        ),
      );

  Widget _buildSingleNavigator(InitialTopTabEnum tab) => TextButton(
        onPressed: () => _topTabNotifier.value = tab,
        style: TextButton.styleFrom(
          overlayColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
        child: Text(
          tab.toString(),
          style: const TextStyle(fontSize: 14.0, color: Colors.white),
        ),
      );
}

enum InitialTopTabEnum {
  experience,
  hotspot,
  live_streaming,
  friend,
  groupon,
  peking,
  attention,
  choiceness,
  recommend,
  collect_cards;

  @override
  String toString() => name.tr;
}
