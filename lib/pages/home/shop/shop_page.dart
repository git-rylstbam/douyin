import 'package:flutter/material.dart';

/// CreateDate: 2025/1/10 16:44
/// Author: Lee
/// Description:

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text('Shop Page'),
        ),
      );
}
