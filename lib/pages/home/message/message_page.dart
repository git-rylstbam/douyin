import 'package:flutter/material.dart';

/// CreateDate: 2025/1/10 16:45
/// Author: Lee
/// Description:

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Text('Message Page')),
      );
}
