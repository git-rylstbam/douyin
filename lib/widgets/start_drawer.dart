import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../extensions/list_extensions.dart';
import '../utils/icon_util.dart';
import 'dismiss_scroll_bar.dart';

/// CreateDate: 2025/2/5 14:57
/// Author: Lee
/// Description:

class StartDrawer extends StatefulWidget {
  const StartDrawer({super.key});

  @override
  State<StartDrawer> createState() => _StartDrawerState();
}

class _StartDrawerState extends State<StartDrawer> {
  bool _isBasic = true;

  @override
  Widget build(BuildContext context) => Drawer(
        width: MediaQuery.of(context).size.width * .8,
        backgroundColor: const Color(0xFFF8F8F8),
        shape: const RoundedRectangleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: _isBasic
              ? _BasicFunctionPage(
                  onMorePressed: () => setState(() => _isBasic = false),
                )
              : _MoreFunctionPage(
                  onReturnPressed: () => setState(() => _isBasic = true),
                ),
        ),
      );
}

class _BasicFunctionPage extends StatefulWidget {
  const _BasicFunctionPage({required this.onMorePressed});

  final void Function() onMorePressed;

  @override
  State<_BasicFunctionPage> createState() => _BasicFunctionPageState();
}

class _BasicFunctionPageState extends State<_BasicFunctionPage> {
  @override
  Widget build(BuildContext context) => DismissScrollbar(
        child: ListView(
          children: [
            _buildHeaderLine(),
            _buildNotificationLine(),
            _buildCommonAppletLine(),
            _buildCommonFunctionLine(),
          ].mapWithSeparator(
            (e) => const SizedBox(height: 10.0),
          ),
        ),
      );

  Widget _buildHeaderLine() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTemperature(),
              _buildDistrict(),
            ],
          ),
          Row(
            spacing: 10.0,
            children: [
              _buildHeaderTrailing(title: '设置', icon: Icons.settings_outlined),
              _buildHeaderTrailing(
                title: '扫一扫',
                icon: CupertinoIcons.viewfinder,
              ),
            ],
          ),
        ],
      );

  Widget _buildTemperature() => const Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            '-6°',
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xFF161823),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '晴',
            style: TextStyle(
              fontSize: 12.0,
              color: Color(0xFF161823),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );

  Widget _buildDistrict() => const Row(
        children: [
          Text(
            '北京',
            style: TextStyle(
              fontSize: 10.0,
              color: Color(0xFF6F6F78),
              fontWeight: FontWeight.w100,
            ),
          ),
          Icon(
            CupertinoIcons.chevron_right,
            size: 10.0,
            color: Color(0xFFA9A9B1),
          ),
        ],
      );

  Widget _buildHeaderTrailing({
    required String title,
    required IconData icon,
  }) =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
          color: Colors.white,
        ),
        child: Row(
          spacing: 4.0,
          children: [
            Icon(icon, size: 18.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );

  Widget _buildNotificationLine() => Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
        ),
        child: Column(
          spacing: 10.0,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildNotificationHeader(),
            _buildNotificationChild(
              notification: '广告服务: 评价任务提醒，最高...',
              time: '昨天 15:41',
            ),
            _buildNotificationChild(
              notification: '广告服务: 评价任务提醒，最高可得...',
              time: '前天',
            ),
          ],
        ),
      );

  Widget _buildNotificationHeader() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '通知消息',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            spacing: 4.0,
            children: [
              const Text(
                '有新消息',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color(0xFF73747B),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 8.0,
                  minHeight: 8.0,
                  maxWidth: 8.0,
                  maxHeight: 8.0,
                ),
              ),
              const Icon(
                CupertinoIcons.chevron_right,
                size: 10.0,
                color: Color(0xFFB0B0B4),
              ),
            ],
          ),
        ],
      );

  Widget _buildNotificationChild({
    required String notification,
    required String time,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10.0,
            children: [
              const Icon(
                CupertinoIcons.bell_circle_fill,
                size: 20.0,
                color: Color(0xFFFC2958),
              ),
              Text(
                notification,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Color(0xFF161823),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            time,
            style: const TextStyle(fontSize: 12.0, color: Color(0xFF73747B)),
          ),
        ],
      );

  Widget _buildCommonAppletLine() => const _DrawerChildContainer(
        title: '常用小程序',
        trailing: Row(
          spacing: 4.0,
          children: [
            Text(
              '全部',
              style: TextStyle(
                fontSize: 12.0,
                color: Color(0xFF73747B),
              ),
            ),
            Icon(
              CupertinoIcons.chevron_right,
              size: 10.0,
              color: Color(0xFFB0B0B4),
            ),
          ],
        ),
        children: [
          _DrawerFunctionChild(title: '每天数独', path: IconUtil.icon_020),
          _DrawerFunctionChild(title: '猪了个猪', path: IconUtil.icon_021),
          _DrawerFunctionChild(title: '最牛挑战', path: IconUtil.icon_022),
          _DrawerFunctionChild(title: '时光杂货店', path: IconUtil.icon_023),
          _DrawerFunctionChild(title: '砖了个砖', path: IconUtil.icon_024),
          _DrawerFunctionChild(title: '橡皮火柴人', path: IconUtil.icon_025),
        ],
      );

  Widget _buildCommonFunctionLine() => _DrawerChildContainer(
        title: '常用功能',
        bottom: _DrawerOperationButton(
          title: '更多功能',
          icon: CupertinoIcons.tortoise,
          onPressed: widget.onMorePressed,
        ),
        children: const [
          _DrawerFunctionChild(title: '观看历史', icon: Icons.access_time),
          _DrawerFunctionChild(title: '我的钱包', icon: Icons.credit_card),
          _DrawerFunctionChild(
            title: '离线缓存',
            icon: Icons.cloud_download_outlined,
          ),
          _DrawerFunctionChild(title: '稍后再看', icon: Icons.webhook),
          _DrawerFunctionChild(title: '服务记录', icon: Icons.tips_and_updates),
          _DrawerFunctionChild(title: '直播广场', icon: Icons.sunny),
        ],
      );
}

class _MoreFunctionPage extends StatefulWidget {
  const _MoreFunctionPage({required this.onReturnPressed});

  final void Function() onReturnPressed;

  @override
  State<_MoreFunctionPage> createState() => _MoreFunctionPageState();
}

class _MoreFunctionPageState extends State<_MoreFunctionPage> {
  @override
  Widget build(BuildContext context) => DismissScrollbar(
        child: ListView(
          children: [
            _buildMyPropertyLine(),
            _buildToolServiceLine(),
            _buildCreationLine(),
            _buildEntertainmentLine(),
          ].mapWithSeparator(
            (e) => const SizedBox(height: 10.0),
          ),
        ),
      );

  Widget _buildMyPropertyLine() => const _DrawerChildContainer(
        title: '我的资产',
        children: [
          _DrawerFunctionChild(title: '我的订单', icon: Icons.directions_bike),
          _DrawerFunctionChild(title: '优惠券', icon: Icons.eco),
        ],
      );

  Widget _buildToolServiceLine() => const _DrawerChildContainer(
        title: '工具服务',
        children: [
          _DrawerFunctionChild(title: '我的二维码', icon: Icons.electric_scooter),
          _DrawerFunctionChild(title: '小程序', icon: Icons.fitbit),
          _DrawerFunctionChild(title: '未成年人模式', icon: Icons.grass),
          _DrawerFunctionChild(title: '使用管理助手', icon: Icons.handyman),
          _DrawerFunctionChild(title: '我的客服', icon: Icons.hive),
          _DrawerFunctionChild(title: '我的预约', icon: Icons.interests),
          _DrawerFunctionChild(title: '我的缓存', icon: Icons.location_searching),
        ],
      );

  Widget _buildCreationLine() => const _DrawerChildContainer(
        title: '创作与经营',
        children: [
          _DrawerFunctionChild(title: '创作者中心', icon: Icons.multiple_stop),
          _DrawerFunctionChild(title: '小店随心推', icon: Icons.nature_people),
          _DrawerFunctionChild(title: '安全中心', icon: Icons.online_prediction),
          _DrawerFunctionChild(title: '抖音小店', icon: Icons.piano),
          _DrawerFunctionChild(title: '上热门', icon: Icons.pool),
          _DrawerFunctionChild(title: '获取线索', icon: Icons.question_mark),
        ],
      );

  Widget _buildEntertainmentLine() => _DrawerChildContainer(
        title: '生活娱乐',
        bottom: _DrawerOperationButton(
          title: '返回',
          onPressed: widget.onReturnPressed,
        ),
        children: const [
          _DrawerFunctionChild(title: 'K歌', icon: Icons.restaurant),
          _DrawerFunctionChild(title: '听抖音', icon: Icons.route),
          _DrawerFunctionChild(title: '附近团购', icon: Icons.rtt),
          _DrawerFunctionChild(title: '放映厅', icon: Icons.shutter_speed),
          _DrawerFunctionChild(title: '抖音公益', icon: Icons.sledding),
          _DrawerFunctionChild(title: '活动中心', icon: Icons.sports_basketball),
          _DrawerFunctionChild(title: '免流量', icon: Icons.sports_score),
          _DrawerFunctionChild(title: '社区共建', icon: Icons.texture),
          _DrawerFunctionChild(title: '视频彩铃', icon: Icons.vaping_rooms),
        ],
      );
}

class _DrawerChildContainer extends StatelessWidget {
  const _DrawerChildContainer({
    required this.title,
    required this.children,
    this.trailing,
    this.bottom,
  });

  final String title;
  final List<Widget?> children;
  final Widget? trailing;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
        ),
        child: Column(
          spacing: 20.0,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (trailing == null)
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Color(0xFF161823),
                  fontWeight: FontWeight.bold,
                ),
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Color(0xFF161823),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing!,
                ],
              ),
            for (int i = 0; i < children.length; i += 3)
              Row(
                children: [
                  for (int j = 0; j < 3; j++)
                    Expanded(
                      child: i + j < children.length
                          ? children[i + j] ?? const SizedBox.shrink()
                          : const SizedBox.shrink(),
                    ),
                ],
              ),
            if (bottom != null) bottom!,
          ],
        ),
      );
}

class _DrawerFunctionChild extends StatelessWidget {
  const _DrawerFunctionChild({
    required this.title,
    this.icon,
    this.path,
  });

  final String title;
  final IconData? icon;
  final String? path;

  @override
  Widget build(BuildContext context) => Column(
        spacing: 10.0,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Icon(
              icon,
              size: 20.0,
              color: const Color(0xFF161823),
            ),
          if (path != null)
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: Image.asset(
                path!,
                width: 40.0,
                height: 40.0,
                fit: BoxFit.cover,
              ),
            ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12.0,
              color: Color(0xFF161823),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
}

class _DrawerOperationButton extends StatelessWidget {
  const _DrawerOperationButton({
    required this.title,
    this.icon,
    required this.onPressed,
  });

  final String title;
  final IconData? icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF87888D), width: .4),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: icon == null
                  ? Text(
                      title,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Color(0xFF161823),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Row(
                      spacing: 4.0,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          icon,
                          size: 20.0,
                          color: const Color(0xFF161823),
                        ),
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
          ),
        ),
      );
}
