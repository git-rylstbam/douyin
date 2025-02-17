import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/icon_util.dart';
import '../../../widgets/dismiss_scroll_bar.dart';
import '../../../widgets/just_tap.dart';
import '../widgets/setting_topbar.dart';

/// CreateDate: 2025/2/10 10:06
/// Author: Lee
/// Description:

class AboutDouyinPage extends StatefulWidget {
  const AboutDouyinPage({super.key});

  @override
  State<AboutDouyinPage> createState() => _AboutDouyinPageState();
}

class _AboutDouyinPageState extends State<AboutDouyinPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: SettingTopBar(),
        body: DismissScrollbar(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              _buildAboutHeaderLine(),
              const SizedBox(height: 20.0),
              const _AboutChildLine(title: '访问抖音官网', desc: 'www.douyin.com'),
              _AboutChildLine(
                title: '抖音官方邮箱',
                desc: 'feedback@douyin.com',
                trailing: _buildCopyButton(title: 'feedback@douyin.com'),
              ),
              _AboutChildLine(
                title: '算法推荐专项举报',
                desc: 'sfjubao@bytedance.com',
                trailing: _buildCopyButton(title: 'sfjubao@bytedance.com'),
              ),
              _AboutChildLine(
                title: '网络内容从业人员违法违规行为举报',
                desc: 'feedback@douyin.com',
                trailing: _buildCopyButton(title: 'feedback@douyin.com'),
              ),
              const _AboutChildLine(title: '抖音官方客服热线', desc: '95152'),
              const _AboutChildLine(title: '抖音安全与举报专线', desc: '400-140-2108'),
            ],
          ),
        ),
      );

  Widget _buildAboutHeaderLine() => Column(
        spacing: 10.0,
        children: [
          const SizedBox(height: 10.0),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(14.0)),
            child: Image.asset(
              IconUtil.icon_024,
              width: 70.0,
              height: 70.0,
              fit: BoxFit.cover,
            ),
          ),
          const Text(
            '抖音',
            style: TextStyle(
              fontSize: 14.0,
              color: Color(0xFF161823),
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'version 32.8.0',
            style: TextStyle(fontSize: 12.0, color: Color(0xFF73747B)),
          ),
          const Text(
            '京ICP备 16016397号-49A',
            style: TextStyle(fontSize: 12.0, color: Color(0xFF73747B)),
          ),
        ],
      );

  Widget _buildCopyButton({required String title}) => JustTap(
        onPressed: () {},
        child: const Text(
          '点击复制',
          style: TextStyle(fontSize: 14.0, color: Color(0xFF8A8B90)),
        ),
      );
}

class _AboutChildLine extends StatelessWidget {
  const _AboutChildLine({
    required this.title,
    required this.desc,
    this.trailing = const Icon(
      CupertinoIcons.chevron_right,
      size: 14.0,
      color: Color(0xFF73747B),
    ),
  });

  final String title;
  final String desc;
  final Widget trailing;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.0,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF161823),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Color(0xFF8A8B90),
                  ),
                ),
              ],
            ),
            trailing,
          ],
        ),
      );
}
