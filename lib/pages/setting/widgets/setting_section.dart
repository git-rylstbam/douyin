import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../extensions/list_extensions.dart';
import '../../../widgets/just_tap.dart';

/// CreateDate: 2025/2/6 17:21
/// Author: Lee
/// Description:

const kSettingSectionChildRightStyle = TextStyle(
  fontSize: 14.0,
  color: Color(0xFF8A8B90),
);

const kSettingSectionChildBottomStyle = TextStyle(
  fontSize: 12.0,
  color: Color(0xFF8A8B90),
);

class SettingSection extends StatelessWidget {
  const SettingSection({super.key, this.title, required this.children});

  final String? title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
              child: Text(
                title!,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Color(0xFF828388),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          DecoratedBox(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: children.mapWithSeparator(
                (e) => const Divider(
                  height: .4,
                  thickness: .4,
                  color: Color(0xFFE3E3E4),
                  indent: 40.0,
                ),
              ),
            ),
          ),
        ],
      );
}

class SettingSectionChild extends StatelessWidget {
  const SettingSectionChild({
    super.key,
    this.icon,
    this.iconColor,
    required this.title,
    this.right,
    this.bottom,
    this.trailing,
    this.onPressed,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.fontWeight = FontWeight.bold,
  });

  final IconData? icon;
  final Color? iconColor;
  final String? title;
  final Widget? right;
  final Widget? bottom;
  final Widget? trailing;
  final void Function()? onPressed;
  final CrossAxisAlignment crossAxisAlignment;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) => onPressed == null
      ? _buildSection()
      : JustTap(
          onPressed: onPressed!,
          child: _buildSection(),
        );

  /// 这里如果用 Padding 或者 Container(不指定颜色)，则 Container 里的空白处无法响应点击事件；
  /// 如果用 Container(指定颜色，即使是 transparent)，则空白处可以响应点击事件。
  /// 原因: Flutter 事件处理机制中的 HitTestBehavior 以及 Widget 的背景绘制行为导致的。
  /// Flutter 需要一个“实心”或者“非空”的组件来捕捉手势。如果一个 Widget 没有绘制任何内容，它就会被
  /// 认为是“不可点击的”，触摸事件会穿透它，传递到它下面的 Widget。
  /// 当 Container 具有 color(即使是 Colors.transparent)，Flutter 依然认为它是有绘制内容的，所以它能响
  /// 应点击事件。
  /// `Container 确实在 UI 中存在（即使透明）。
  /// `由于 color 被赋值，Flutter 认为它是“有东西的”，所以它能够接收手势事件。
  /// 当 Container 没有指定 color 时，它会被视为“无内容”，Flutter 在渲染时会优化掉这个 Container，使其
  /// 变成无形的包装器，类似于 Column、Row，不会拦截事件。
  /// `Container 变成了一个“空壳”，不会拦截事件，点击事件会穿透它直接传递给下面的组件。
  /// `Padding 只是调整布局的组件，不会绘制任何东西，因此点击事件直接穿透到子组件或其父组件。
  /// 解决方案:
  /// 如果你希望在整个区域(包括空白部分)都能被点击，可以使用:
  /// 1. 使用 Container(color: Colors.transparent)
  /// 2. 使用 InkWell 并设置 behavior: HitTestBehavior.translucent
  /// 3. 使用 GestureDetector 并设置 behavior: HitTestBehavior.translucent
  Widget _buildSection() => Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(20.0),
        child: Row(
          spacing: 10.0,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10.0,
              crossAxisAlignment: crossAxisAlignment,
              children: [
                if (icon != null)
                  if (iconColor != null)
                    _icon
                  else
                    Icon(icon, size: 20.0, color: const Color(0xFF161823)),
                if (title != null)
                  if (bottom == null)
                    _title
                  else
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4.0,
                      children: [_title, bottom!],
                    ),
              ],
            ),
            if (right == null)
              _trailing
            else
              Row(spacing: 10.0, children: [right!, _trailing]),
          ],
        ),
      );

  Widget get _title => Text(
        title!,
        style: TextStyle(
          fontSize: 14.0,
          color: const Color(0xFF161823),
          fontWeight: fontWeight,
        ),
      );

  Widget get _trailing =>
      trailing ??
      const Icon(
        CupertinoIcons.chevron_right,
        size: 14.0,
        color: Color(0xFF73747B),
      );

  Widget get _icon => Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: iconColor),
        padding: const EdgeInsets.all(4.0),
        child: Icon(icon, size: 20.0, color: Colors.white),
      );
}
