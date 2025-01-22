import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../extensions/list_extensions.dart';
import '../../../routes.dart';
import '../../../utils/icon_util.dart';
import '../../../widgets/dismiss_scroll_bar.dart';

/// CreateDate: 2025/1/10 16:45
/// Author: Lee
/// Description:

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key});

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage>
    with SingleTickerProviderStateMixin {
  final _scaleNotifier = ValueNotifier<double>(1.0);
  final _titleOpacityNotifier = ValueNotifier<double>(1.0);
  final _operateOpacityNotifier = ValueNotifier<double>(1.0);

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _scaleNotifier.dispose();
    _titleOpacityNotifier.dispose();
    _operateOpacityNotifier.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildIndividualAppbar(),
        extendBodyBehindAppBar: true,
        body: _buildIndividualList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.change_font),
          shape: const CircleBorder(),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          child: const Icon(CupertinoIcons.textformat),
        ),
      );

  Widget _buildIndividualList() => NotificationListener<ScrollNotification>(
        onNotification: (value) {
          if (value.metrics.axisDirection == AxisDirection.down) {
            final offset = value.metrics.pixels;
            _scaleNotifier.value = (1.0 - offset / 200).clamp(1.0, 3.0);
            _operateOpacityNotifier.value = offset > 100.0 ? .0 : 1.0;
          }
          return true;
        },
        child: Stack(
          children: [
            DismissScrollbar(
              child: NestedScrollView(
                physics: const BouncingScrollPhysics(),
                headerSliverBuilder: (_, __) => [
                  _buildIndividualTopbar(),
                  _buildCenterLine(),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _StickyTabbarDelegate(
                      TabBar(
                        controller: _tabController,
                        indicatorColor: Colors.black,
                        labelColor: Colors.black,
                        indicatorWeight: 1,
                        dividerColor: Colors.transparent,
                        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                        unselectedLabelColor: const Color(0xFF72737A),
                        tabs: const [
                          Tab(text: '作品'),
                          Tab(text: '日常'),
                          Tab(text: '私密'),
                          Tab(text: '推荐'),
                          Tab(text: '收藏'),
                          Tab(text: '喜欢'),
                        ],
                      ),
                    ),
                  ),
                ],
                body: TabBarView(
                  controller: _tabController,
                  children: const [
                    Text('作品'),
                    Text('日常'),
                    Text('私密'),
                    Text('推荐'),
                    Text('收藏'),
                    Text('喜欢'),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildIndividualTopbar() => SliverAppBar(
        expandedHeight: 200.0,
        stretch: true,
        backgroundColor: Colors.transparent,
        flexibleSpace: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            _buildIndividualTopBackground(),
            _buildIndividualInfoLine(),
          ],
        ),
      );

  Widget _buildCenterLine() => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            spacing: 20.0,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCenterLine01(),
              _buildCenterLine02(),
              _buildCenterLine03(),
            ],
          ),
        ),
      );

  Widget _buildCenterLine01() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            spacing: 20.0,
            children: [
              _QuantityButton(count: 32, title: '获赞'),
              _QuantityButton(count: 9, title: '互关'),
              _QuantityButton(count: 183, title: '关注'),
              _QuantityButton(count: 26, title: '粉丝'),
            ],
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFFF3F3F3),
              foregroundColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
            ),
            child: const Text(
              '编辑主页',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );

  Widget _buildCenterLine02() => Column(
        spacing: 4.0,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '人生如雪，墨点为缀。花开落蕊，雪化成灰。',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            spacing: 4.0,
            children: [
              Container(
                color: const Color(0xFFF3F3F3),
                padding: const EdgeInsets.all(4.0),
                child: const Text(
                  '清华大学',
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Color(0xFF4C4E56),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  color: const Color(0xFFF3F3F3),
                  padding: const EdgeInsets.all(4.0),
                  child: const Row(
                    spacing: 4.0,
                    children: [
                      Icon(
                        Icons.add,
                        color: Color(0xFF4C4E56),
                        size: 10.0,
                      ),
                      Text(
                        '添加所在地、性别等标签',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Color(0xFF4C4E56),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      );

  Widget _buildCenterLine03() => Row(
        children: [
          _FunctionButton(
            icon: CupertinoIcons.cart,
            title: '抖音商城',
            onPressed: () {},
          ),
          _FunctionButton(
            icon: Icons.access_time,
            title: '观看历史',
            onPressed: () {},
          ),
          _FunctionButton(
            icon: CupertinoIcons.lightbulb,
            title: '创作灵感',
            onPressed: () {},
          ),
          _FunctionButton(
            icon: CupertinoIcons.book,
            title: '我的读书',
            onPressed: () {},
          ),
          _FunctionButton(
            icon: CupertinoIcons.square_grid_2x2,
            title: '全部功能',
            onPressed: () {},
          ),
        ],
      );

  Widget _buildIndividualTopBackground() => FlexibleSpaceBar(
        background: ValueListenableBuilder(
          valueListenable: _scaleNotifier,
          builder: (_, value, __) => Transform.scale(
            scale: value,
            child: Image.asset(
              IconUtil.icon_019,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  Widget _buildIndividualInfoLine() => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: 20.0,
            ),
            child: Row(
              spacing: 10.0,
              children: [
                _buildIndividualAvatar(),
                Column(
                  spacing: 10.0,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 10.0,
                      children: [
                        const Text(
                          '林落凝',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        _buildAccountButton(),
                      ],
                    ),
                    Row(
                      spacing: 10.0,
                      children: [
                        Text(
                          '${'douyin_id'.tr}: HGS.rylstbam.lln',
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Color(0xFF978A8E),
                          ),
                        ),
                        const Icon(
                          Icons.qr_code,
                          size: 12.0,
                          color: Color(0xFF978A8E),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 10.0,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              color: Colors.white,
            ),
          ),
        ],
      );

  Widget _buildAccountButton() => InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(50),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(2.0),
          child: const Icon(
            Icons.arrow_drop_down,
            size: 12.0,
            color: Colors.white,
          ),
        ),
      );

  AppBar _buildIndividualAppbar() => AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: _buildAddFriendButton(),
        actions: [
          _buildNewGuestButton(),
          _OperateButton(icon: Icons.search, onPressed: () {}),
          _OperateButton(icon: Icons.reorder, onPressed: () {}),
          const SizedBox.shrink(),
        ].mapWithSeparator((e) => const SizedBox(width: 10.0)),
      );

  Widget _buildAddFriendButton() => ValueListenableBuilder(
        valueListenable: _operateOpacityNotifier,
        builder: (_, value, __) => AnimatedOpacity(
          opacity: value,
          duration: const Duration(milliseconds: 500),
          child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.person_add_alt_outlined,
              color: Colors.white,
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.black.withAlpha(50),
              foregroundColor: Colors.white,
            ),
            label: Text('add_friend'.tr),
          ),
        ),
      );

  Widget _buildNewGuestButton() => ValueListenableBuilder(
        valueListenable: _operateOpacityNotifier,
        builder: (_, value, __) => AnimatedOpacity(
          opacity: value,
          duration: const Duration(milliseconds: 500),
          child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.people_outline,
              color: Colors.white,
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.black.withAlpha(50),
              foregroundColor: Colors.white,
            ),
            label: Text('${'new_guest'.tr} 99+'),
          ),
        ),
      );

  Widget _buildIndividualAvatar() => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        width: 100.0,
        height: 100.0,
        padding: const EdgeInsets.all(2.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(100.0)),
          child: Image.asset(IconUtil.icon_005, fit: BoxFit.cover),
        ),
      );
}

class _OperateButton extends StatelessWidget {
  const _OperateButton({required this.icon, required this.onPressed});

  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(50),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon, color: Colors.white, size: 18.0),
        ),
      );
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({required this.count, required this.title});

  final int count;
  final String title;

  @override
  Widget build(BuildContext context) => Column(
        spacing: 4.0,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            count.toString(),
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12.0,
              color: Color(0xFF72737A),
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      );
}

class _FunctionButton extends StatelessWidget {
  const _FunctionButton({
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  final IconData icon;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => Expanded(
        child: InkWell(
          onTap: onPressed,
          child: Column(
            spacing: 10.0,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 20.0, color: Colors.black),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      );
}

class _StickyTabbarDelegate extends SliverPersistentHeaderDelegate {
  _StickyTabbarDelegate(this.tabbar);

  final TabBar tabbar;

  @override
  Widget build(context, shrinkOffset, overlapsContent) => tabbar;

  @override
  double get maxExtent => tabbar.preferredSize.height;

  @override
  double get minExtent => tabbar.preferredSize.height;

  @override
  bool shouldRebuild(_StickyTabbarDelegate oldDelegate) => true;
}
