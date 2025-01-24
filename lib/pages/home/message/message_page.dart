import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../extensions/list_extensions.dart';
import '../../../utils/icon_util.dart';
import '../../../widgets/dismiss_scroll_bar.dart';
import '../initial/model/model.dart';
import 'enum.dart';

/// CreateDate: 2025/1/10 16:45
/// Author: Lee
/// Description:

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.sort, size: 24.0, color: Colors.black),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'message'.tr,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.search, size: 24.0, color: Colors.black),
          Icon(CupertinoIcons.plus_circle, size: 24.0, color: Colors.black),
          SizedBox.shrink(),
        ].mapWithSeparator(
          (e) => const SizedBox(width: 10.0),
        ),
      ),
      body: DismissScrollbar(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            _buildMessageTip(),
            _buildFriendList(),
            _buildMessageList(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageTip() => SliverToBoxAdapter(
        child: Container(
          color: const Color(0xFFF8F8F8),
          padding: const EdgeInsets.all(10.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 10.0,
                children: [
                  Icon(
                    CupertinoIcons.exclamationmark_circle_fill,
                    size: 12.0,
                    color: Color(0xFF707178),
                  ),
                  Text(
                    '当前无法接收朋友的消息通知',
                    style: TextStyle(fontSize: 12.0, color: Colors.black),
                  ),
                  Text(
                    '去设置',
                    style: TextStyle(fontSize: 12.0, color: Color(0xFF0B4A8B)),
                  ),
                ],
              ),
              Icon(CupertinoIcons.xmark, size: 12.0, color: Color(0xFF707178)),
            ],
          ),
        ),
      );

  Widget _buildFriendList() => SliverPadding(
        padding: const EdgeInsets.all(10.0),
        sliver: SliverToBoxAdapter(
          child: SizedBox(
            height: 67.0,
            child: DismissScrollbar(
              child: ListView(
                key: const PageStorageKey(MessageKeys.friend),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: friends
                    .map((e) => _buildFriendChild(e))
                    .toList()
                    .mapWithSeparator(
                      (e) => const SizedBox(width: 10.0),
                    ),
              ),
            ),
          ),
        ),
      );

  Widget _buildFriendChild(FriendEntity friend) => Column(
        spacing: 10.0,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: FadeInImage(
              image: AssetImage(friend.avatar ?? IconUtil.icon_001),
              placeholder: const AssetImage(IconUtil.icon_placeholder),
              width: 40.0,
              height: 40.0,
              fit: BoxFit.cover,
              placeholderFit: BoxFit.cover,
            ),
          ),
          Text(
            friend.name ?? '--',
            style: const TextStyle(fontSize: 12.0, color: Colors.black),
          ),
        ],
      );

  Widget _buildMessageList() => SliverPadding(
        padding: const EdgeInsets.all(10.0),
        sliver: SliverList(
          key: const PageStorageKey(MessageKeys.message),
          delegate: SliverChildBuilderDelegate(
            (_, index) => _buildMessageChild(friends[index]),
            childCount: friends.length,
          ),
        ),
      );

  Widget _buildMessageChild(FriendEntity friend) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10.0,
            children: [
              ClipOval(
                child: FadeInImage(
                  image: AssetImage(friend.avatar ?? IconUtil.icon_001),
                  placeholder: const AssetImage(IconUtil.icon_placeholder),
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.cover,
                  placeholderFit: BoxFit.cover,
                ),
              ),
              Column(
                spacing: 10.0,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    friend.name ?? '--',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    friend.message ?? '--',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Color(0xFF73747B),
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            friend.time ?? '--',
            style: const TextStyle(
              fontSize: 12.0,
              color: Color(0xFFAFB0B4),
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      );
}
