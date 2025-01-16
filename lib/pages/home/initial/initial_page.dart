import 'package:flutter/material.dart';

/// CreateDate: 2025/1/10 16:24
/// Author: Lee
/// Description:

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.teal,
        body: PageView.builder(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) => _InitialPageChild(index: index),
          itemCount: 100,
        ),
      );
}

class _InitialPageChild extends StatefulWidget {
  const _InitialPageChild({required this.index});

  final int index;

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
    return Center(
      child: Text(
        '${widget.index}',
        style: const TextStyle(fontSize: 200.0, color: Colors.white),
      ),
    );
  }
}
