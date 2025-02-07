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
    required this.icon,
    required this.title,
    this.right,
    this.bottom,
    this.trailing,
    this.onPressed,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final IconData? icon;
  final String? title;
  final Widget? right;
  final Widget? bottom;
  final Widget? trailing;
  final void Function()? onPressed;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) => onPressed == null
      ? _buildSection()
      : JustTap(
          onPressed: onPressed!,
          child: _buildSection(),
        );

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
        style: const TextStyle(
          fontSize: 14.0,
          color: Color(0xFF161823),
          fontWeight: FontWeight.bold,
        ),
      );

  Widget get _trailing =>
      trailing ??
      const Icon(
        CupertinoIcons.chevron_right,
        size: 14.0,
        color: Color(0xFF73747B),
      );
}
