import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'locales/locales.dart';
import 'routes.dart';
import 'theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>()!;

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final _controller = ThemeController();

  void changeFont(String font) => setState(() => _controller.font = font);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'Study douyin project',
        debugShowCheckedModeBanner: false,
        translations: Locales(),
        locale: const Locale('zh', 'CN'),
        fallbackLocale: const Locale('zh', 'CN'),
        theme: _controller.light,
        scrollBehavior: _MyScrollBehavior(),
        initialRoute: Routes.home,
        getPages: Routes.routes,
      );
}

class _MyScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices =>
      {PointerDeviceKind.touch, PointerDeviceKind.mouse};
}
