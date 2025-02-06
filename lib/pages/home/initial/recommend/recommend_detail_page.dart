import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/icon_util.dart';
import '../../../../widgets/comment_section.dart';
import '../../../../widgets/dismiss_scroll_bar.dart';
import '../../../../widgets/just_tap.dart';
import '../experience/model/model.dart';

/// CreateDate: 2025/2/6 13:37
/// Author: Lee
/// Description:

const _kBottomLineHeight = 64.0;

class RecommendDetailPage extends StatefulWidget {
  const RecommendDetailPage({super.key});

  @override
  State<RecommendDetailPage> createState() => _RecommendDetailPageState();
}

class _RecommendDetailPageState extends State<RecommendDetailPage> {
  late final ExperienceEntity child;

  final _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (Get.arguments == null) {
      child = const ExperienceEntity();
      return;
    }
    child = Get.arguments!;
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(),
        body: Stack(
          fit: StackFit.expand,
          children: [
            DismissScrollbar(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Image.asset(
                    child.path ?? IconUtil.icon_001,
                    width: double.infinity,
                    height: 668.0,
                    fit: BoxFit.fitWidth,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      child.title ?? '',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Color(0xFF2D2F39),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      child.time ?? '--',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Color(0xFFB0B0B4),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    child:
                        Container(height: .4, color: const Color(0xFFE3E4E5)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      child.comments == null
                          ? '共 0 条评论'
                          : '共 ${child.comments!.length} 条评论',
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF4F5159),
                      ),
                    ),
                  ),
                  _buildFCommentLine(),
                  if (child.comments == null || child.comments!.isEmpty)
                    _buildNoCommentLine(),
                  if (child.comments != null && child.comments!.isNotEmpty)
                    ...child.comments!.map((e) => CommentSection(comment: e)),
                  if (child.comments != null && child.comments!.isNotEmpty)
                    _buildNoMoreLine(),
                  const SizedBox(height: _kBottomLineHeight),
                ],
              ),
            ),
            _buildBottomCommentLine(),
          ],
        ),
      );

  AppBar _buildAppBar() => AppBar(
        leading: JustTap(
          onPressed: Get.back,
          child: const Icon(CupertinoIcons.chevron_left),
        ),
        automaticallyImplyLeading: false,
        leadingWidth: 40.0,
        titleSpacing: .0,
        title: _buildTitle(),
        actions: [
          _buildAttentionButton(),
          const SizedBox(width: 10.0),
          _buildSearchButton(),
          const SizedBox(width: 10.0),
        ],
      );

  Widget _buildTitle() => Row(
        spacing: 10.0,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: Image.asset(
              child.avatar ?? IconUtil.icon_001,
              width: 30.0,
              height: 30.0,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            child.username ?? '--',
            style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xFF161823),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );

  Widget _buildAttentionButton() => JustTap(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            color: Color(0xFFFC2958),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: const Text(
            '关注',
            style: TextStyle(fontSize: 12.0, color: Colors.white),
          ),
        ),
        onPressed: () {},
      );

  Widget _buildSearchButton() => JustTap(
        child: const Icon(CupertinoIcons.search, size: 20.0),
        onPressed: () {},
      );

  Widget _buildFCommentLine() => Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          top: 40.0,
          right: 10.0,
          bottom: 20.0,
        ),
        child: Row(
          spacing: 10.0,
          children: [
            _buildUserAvatar(),
            _buildFCommentTrailing(),
          ],
        ),
      );

  Widget _buildUserAvatar() => ClipOval(
        child: Image.asset(
          child.avatar ?? IconUtil.icon_001,
          width: 30.0,
          height: 30.0,
          fit: BoxFit.cover,
        ),
      );

  Widget _buildFCommentTrailing() => Expanded(
        child: JustTap(
          onPressed: () {},
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100.0)),
              color: Color(0xFFF3F3F4),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '平等表达，友善交流',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xFFA8A8AC),
                  ),
                ),
                Row(
                  spacing: 20.0,
                  children: [
                    JustTap(
                      onPressed: () {},
                      child: const Icon(
                        CupertinoIcons.gift,
                        size: 20.0,
                        color: Color(0xFFA7A8AC),
                      ),
                    ),
                    JustTap(
                      onPressed: () {},
                      child: const Icon(
                        CupertinoIcons.at,
                        size: 20.0,
                        color: Color(0xFFA2A3A4),
                      ),
                    ),
                    JustTap(
                      onPressed: () {},
                      child: const Icon(
                        CupertinoIcons.smiley,
                        size: 20.0,
                        color: Color(0xFFA7A8AC),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildNoMoreLine() => const Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            '暂时没有更多了...',
            style: TextStyle(
              fontSize: 12.0,
              color: Color(0xFF73747B),
            ),
          ),
        ),
      );

  Widget _buildNoCommentLine() => const Padding(
        padding: EdgeInsets.only(
          left: 10.0,
          top: 20.0,
          right: 10.0,
          bottom: 40.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 4.0,
          children: [
            Icon(
              CupertinoIcons.chat_bubble,
              size: 20.0,
              color: Color(0xFFAAABAB),
            ),
            Text(
              '暂无评论，快去留下第一条评论吧~',
              style: TextStyle(fontSize: 12.0, color: Color(0xFFAFB0B3)),
            ),
          ],
        ),
      );

  Widget _buildBottomCommentLine() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: _kBottomLineHeight,
          color: Colors.white,
          child: Column(
            children: [
              Container(height: .4, color: const Color(0xFFE3E3E4)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  spacing: 20.0,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100.0),
                          ),
                          color: Color(0xFFF3F3F3),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: const Text(
                          '说点什么...',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Color(0xFF6D6E76),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildBottomLineChild(
                              child.likeCount == null
                                  ? '喜欢'
                                  : '${child.likeCount}',
                              CupertinoIcons.heart,
                            ),
                          ),
                          Expanded(
                            child: _buildBottomLineChild(
                              '评论',
                              CupertinoIcons.chat_bubble_text,
                            ),
                          ),
                          Expanded(
                            child: _buildBottomLineChild(
                              '收藏',
                              CupertinoIcons.star,
                            ),
                          ),
                          Expanded(
                            child: _buildBottomLineChild(
                              '分享',
                              CupertinoIcons.paperplane,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildBottomLineChild(String title, IconData icon) => Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 4.0,
        children: [
          Icon(icon, size: 20.0, color: const Color(0xFF131520)),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12.0,
              color: Color(0xFF131520),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
}
