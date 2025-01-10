import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'locales/locales.dart';
import 'routes.dart';

void main() => runApp(const _MyApp());

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'High Copy WeChat Project',
        debugShowCheckedModeBanner: false,
        translations: Locales(),
        locale: const Locale('zh', 'CN'),
        fallbackLocale: const Locale('zh', 'CN'),
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
