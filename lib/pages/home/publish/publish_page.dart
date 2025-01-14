import 'package:flutter/material.dart';

/// CreateDate: 2025/1/10 16:45
/// Author: Lee
/// Description:

class PublishPage extends StatefulWidget {
  const PublishPage({super.key});

  @override
  State<PublishPage> createState() => _PublishPageState();
}

class _PublishPageState extends State<PublishPage> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Text('Publish Page')),
      );
}
