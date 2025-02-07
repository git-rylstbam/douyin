import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../extensions/list_extensions.dart';
import '../../../widgets/dismiss_scroll_bar.dart';
import '../widgets/setting_section.dart';
import '../widgets/setting_switch.dart';
import '../widgets/setting_topbar.dart';

/// CreateDate: 2025/2/7 16:16
/// Author: Lee
/// Description:

class NotificationSettingPage extends StatefulWidget {
  const NotificationSettingPage({super.key});

  @override
  State<NotificationSettingPage> createState() =>
      _NotificationSettingPageState();
}

class _NotificationSettingPageState extends State<NotificationSettingPage> {
  final _guestNotifier = ValueNotifier<bool>(true);
  final _onlineNotifier = ValueNotifier<bool>(true);
  final _recommendNotifier = ValueNotifier<bool>(true);
  final _hotspotNotifier = ValueNotifier<bool>(true);
  final _commodityNotifier = ValueNotifier<bool>(true);
  final _recommend01Notifier = ValueNotifier<bool>(true);
  final _recommend02Notifier = ValueNotifier<bool>(true);
  final _recommend03Notifier = ValueNotifier<bool>(true);
  final _recommend04Notifier = ValueNotifier<bool>(true);
  final _eventNotifier = ValueNotifier<bool>(true);
  final _workNotifier = ValueNotifier<bool>(true);
  final _loginedAccountNotifier = ValueNotifier<bool>(true);
  final _financialNotifier = ValueNotifier<bool>(true);
  final _accountSecurityNotifier = ValueNotifier<bool>(true);
  final _otherNotifier = ValueNotifier<bool>(true);
  final _topBannerNotifier = ValueNotifier<bool>(true);
  final _friendDotNotifier = ValueNotifier<bool>(true);
  final _attentionDotNotifier = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _guestNotifier.dispose();
    _onlineNotifier.dispose();
    _recommendNotifier.dispose();
    _hotspotNotifier.dispose();
    _commodityNotifier.dispose();
    _recommend01Notifier.dispose();
    _recommend02Notifier.dispose();
    _recommend03Notifier.dispose();
    _recommend04Notifier.dispose();
    _eventNotifier.dispose();
    _workNotifier.dispose();
    _loginedAccountNotifier.dispose();
    _financialNotifier.dispose();
    _accountSecurityNotifier.dispose();
    _otherNotifier.dispose();
    _topBannerNotifier.dispose();
    _friendDotNotifier.dispose();
    _attentionDotNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFF3F3F4),
        appBar: SettingTopBar(title: '通知设置'),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DismissScrollbar(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                _buildNotificationHeader(),
                _buildInteractiveNotificationSection(),
                _buildMessageNotificationSection(),
                _buildHotspotSection(),
                _buildCommoditySection(),
                _buildCommentUpdateSection(),
                _buildRecommendContentSection(),
                _buildEventMessageSection(),
                _buildOtherMessageSection(),
                _buildInApplicationSection(),
                _buildRealtimeEventSection(),
              ].mapWithSeparator(
                (e) => const SizedBox(height: 20.0),
              ),
            ),
          ),
        ),
      );

  Widget _buildNotificationHeader() => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.0,
        children: [
          const Text(
            '快捷设置 · 接收谁的通知',
            style: TextStyle(
              fontSize: 14.0,
              color: Color(0xFF161823),
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            spacing: 5.0,
            children: [
              _buildHeaderChild(CupertinoIcons.person_2_fill, '全部'),
              _buildHeaderChild(CupertinoIcons.person_badge_plus_fill, '来自关注'),
              _buildHeaderChild(
                CupertinoIcons.person_crop_circle_fill_badge_checkmark,
                '来自互关',
              ),
              _buildHeaderChild(CupertinoIcons.bell_slash_fill, '不接收'),
            ],
          ),
        ],
      );

  Widget _buildHeaderChild(IconData icon, String title) => Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 10.0,
            children: [
              Icon(icon, size: 30.0, color: const Color(0xFF505159)),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Color(0xFF161823),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildInteractiveNotificationSection() => SettingSection(
        title: '互动通知',
        children: [
          const SettingSectionChild(
            icon: CupertinoIcons.heart,
            title: '点赞',
            right: Text('全部', style: kSettingSectionChildRightStyle),
          ),
          const SettingSectionChild(
            icon: CupertinoIcons.star,
            title: '收藏',
            right: Text('全部', style: kSettingSectionChildRightStyle),
          ),
          const SettingSectionChild(
            icon: CupertinoIcons.chat_bubble_text,
            title: '评论',
            right: Text('全部', style: kSettingSectionChildRightStyle),
          ),
          const SettingSectionChild(
            icon: CupertinoIcons.at,
            title: '提及',
            right: Text('全部', style: kSettingSectionChildRightStyle),
          ),
          const SettingSectionChild(
            icon: CupertinoIcons.person_badge_plus,
            title: '关注',
            right: Text('全部', style: kSettingSectionChildRightStyle),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.waveform,
            title: '主页访客',
            trailing: ValueListenableBuilder(
              valueListenable: _guestNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _guestNotifier.value = value,
              ),
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.alarm,
            title: '上线通知',
            trailing: ValueListenableBuilder(
              valueListenable: _onlineNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _onlineNotifier.value = value,
              ),
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.drop,
            title: '推荐',
            trailing: ValueListenableBuilder(
              valueListenable: _recommendNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _recommendNotifier.value = value,
              ),
            ),
          ),
        ],
      );

  Widget _buildMessageNotificationSection() => const SettingSection(
        title: '消息通知',
        children: [
          SettingSectionChild(icon: CupertinoIcons.mail, title: '私信通知'),
        ],
      );

  Widget _buildHotspotSection() => SettingSection(
        title: '热点通知',
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.dot_radiowaves_left_right,
            title: '热点',
            trailing: ValueListenableBuilder(
              valueListenable: _hotspotNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _hotspotNotifier.value = value,
              ),
            ),
          ),
        ],
      );

  Widget _buildCommoditySection() => SettingSection(
        title: '商品与团购',
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.book,
            title: '物流与订单通知',
            trailing: ValueListenableBuilder(
              valueListenable: _commodityNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _commodityNotifier.value = value,
              ),
            ),
          ),
        ],
      );

  Widget _buildCommentUpdateSection() => const SettingSection(
        title: '内容更新提醒',
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.hammer,
            title: '作品更新通知',
            right: Text('全部', style: kSettingSectionChildRightStyle),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.hammer_fill,
            title: '直播开播通知',
            right: Text('全部', style: kSettingSectionChildRightStyle),
          ),
        ],
      );

  Widget _buildRecommendContentSection() => SettingSection(
        title: '推荐内容',
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.info_circle,
            title: '推荐我可能感兴趣的内容',
            trailing: ValueListenableBuilder(
              valueListenable: _recommend01Notifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _recommend01Notifier.value = value,
              ),
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.leaf_arrow_circlepath,
            title: '推荐可能感兴趣的商品与优惠',
            trailing: ValueListenableBuilder(
              valueListenable: _recommend02Notifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _recommend02Notifier.value = value,
              ),
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.location_north,
            title: '推荐可能感兴趣的团购与优惠',
            trailing: ValueListenableBuilder(
              valueListenable: _recommend03Notifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _recommend03Notifier.value = value,
              ),
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.lock_rotation,
            title: '推荐可能感兴趣的人',
            trailing: ValueListenableBuilder(
              valueListenable: _recommend04Notifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _recommend04Notifier.value = value,
              ),
            ),
          ),
        ],
      );

  Widget _buildEventMessageSection() => SettingSection(
        title: '活动消息',
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.lightbulb,
            title: '活动通知',
            trailing: ValueListenableBuilder(
              valueListenable: _eventNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _eventNotifier.value = value,
              ),
            ),
          ),
        ],
      );

  Widget _buildOtherMessageSection() => SettingSection(
        title: '其他消息',
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.lasso,
            title: '拍作品通知',
            trailing: ValueListenableBuilder(
              valueListenable: _workNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _workNotifier.value = value,
              ),
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.link_circle,
            title: '已登录的其他账号通知',
            trailing: ValueListenableBuilder(
              valueListenable: _loginedAccountNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _loginedAccountNotifier.value = value,
              ),
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.list_bullet_indent,
            title: '财务通知',
            trailing: ValueListenableBuilder(
              valueListenable: _financialNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _financialNotifier.value = value,
              ),
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.map_pin_ellipse,
            title: '账号安全通知',
            trailing: ValueListenableBuilder(
              valueListenable: _accountSecurityNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _accountSecurityNotifier.value = value,
              ),
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.money_yen_circle,
            title: '其他通知',
            trailing: ValueListenableBuilder(
              valueListenable: _otherNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _otherNotifier.value = value,
              ),
            ),
          ),
        ],
      );

  Widget _buildInApplicationSection() => SettingSection(
        title: '抖音应用内提醒',
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.pencil_slash,
            title: '顶部横幅通知',
            trailing: ValueListenableBuilder(
              valueListenable: _topBannerNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _topBannerNotifier.value = value,
              ),
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.percent,
            title: '朋友页红点',
            trailing: ValueListenableBuilder(
              valueListenable: _friendDotNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _friendDotNotifier.value = value,
              ),
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.pencil_outline,
            title: '关注页红点',
            trailing: ValueListenableBuilder(
              valueListenable: _attentionDotNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _attentionDotNotifier.value = value,
              ),
            ),
          ),
        ],
      );

  Widget _buildRealtimeEventSection() => const SettingSection(
        title: '实时活动通知',
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.paw,
            title: '实时活动通知',
            right: Text('全部', style: kSettingSectionChildRightStyle),
          ),
        ],
      );
}
