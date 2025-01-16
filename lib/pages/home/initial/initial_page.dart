import 'package:flutter/material.dart';

import 'model/model.dart';

/// CreateDate: 2025/1/10 16:24
/// Author: Lee
/// Description:

class InitialPage extends StatefulWidget {
  const InitialPage({super.key, required this.controller});

  final PageController controller;

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.teal,
        body: Stack(
          fit: StackFit.expand,
          children: [
            PageView.builder(
              controller: widget.controller,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) => _InitialPageChild(
                product: products[index],
              ),
              itemCount: products.length,
            ),
          ],
        ),
      );
}

class _InitialPageChild extends StatefulWidget {
  const _InitialPageChild({required this.product});

  final ProductEntity product;

  @override
  State<_InitialPageChild> createState() => _InitialPageChildState();
}

class _InitialPageChildState extends State<_InitialPageChild>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        if (widget.product.path != null)
          Image.asset(widget.product.path!, fit: BoxFit.fill),
      ],
    );
  }
}
