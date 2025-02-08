import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../setting/widgets/setting_topbar.dart';

/// CreateDate: 2025/2/8 17:10
/// Author: Lee
/// Description:

class CommonWebPage extends StatefulWidget {
  const CommonWebPage({super.key, required this.title});

  final String title;

  @override
  State<CommonWebPage> createState() => _CommonWebPageState();
}

class _CommonWebPageState extends State<CommonWebPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..loadRequest(Uri.parse('https://flutter.dev'));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: SettingTopBar(title: widget.title),
        body: WebViewWidget(controller: _controller),
      );
}
