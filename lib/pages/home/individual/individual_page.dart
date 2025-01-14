import 'package:flutter/material.dart';

/// CreateDate: 2025/1/10 16:45
/// Author: Lee
/// Description:

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key});

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Text('Individual Page')),
      );
}
