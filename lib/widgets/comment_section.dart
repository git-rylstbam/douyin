import 'package:flutter/cupertino.dart';

import '../pages/home/initial/experience/model/model.dart';
import '../utils/icon_util.dart';

/// CreateDate: 2025/2/6 15:41
/// Author: Lee
/// Description:

class CommentSection extends StatefulWidget {
  const CommentSection({super.key, required this.comment});

  final CommentEntity comment;

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  late final CommentEntity comment = widget.comment;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 10.0,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.0,
              children: [
                _buildUserAvatar(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4.0,
                  children: [
                    _buildUsername(),
                    _buildCommentLine(),
                    _buildTimeAndArea(),
                  ],
                ),
              ],
            ),
            const Row(
              spacing: 20.0,
              children: [
                Icon(
                  CupertinoIcons.heart,
                  size: 20.0,
                  color: Color(0xFF73747B),
                ),
                Icon(
                  CupertinoIcons.heart_slash,
                  size: 20.0,
                  color: Color(0xFF73747B),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _buildUserAvatar() => ClipOval(
        child: Image.asset(
          comment.avatar ?? IconUtil.icon_001,
          width: 30.0,
          height: 30.0,
          fit: BoxFit.cover,
        ),
      );

  Widget _buildUsername() => Text(
        comment.username ?? '--',
        style: const TextStyle(fontSize: 12.0, color: Color(0xFFAFB0B4)),
      );

  Widget _buildCommentLine() => Text(
        comment.comment ?? '--',
        style: const TextStyle(fontSize: 14.0, color: Color(0xFF161823)),
      );

  Widget _buildTimeAndArea() => Row(
        spacing: 2.0,
        children: [
          Text(
            comment.time ?? '--',
            style: const TextStyle(fontSize: 12.0, color: Color(0xFFAFB0B4)),
          ),
          const Text(
            '·',
            style: TextStyle(fontSize: 12.0, color: Color(0xFFAFB0B4)),
          ),
          Text(
            comment.area ?? '--',
            style: const TextStyle(fontSize: 12.0, color: Color(0xFFAFB0B4)),
          ),
        ],
      );
}
