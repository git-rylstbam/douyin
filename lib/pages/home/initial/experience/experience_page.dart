import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../../routes.dart';
import '../../../../utils/icon_util.dart';
import '../../../../widgets/dismiss_scroll_bar.dart';
import '../../../../widgets/no_border_text_field.dart';
import 'model/model.dart';

/// CreateDate: 2025/2/6 10:05
/// Author: Lee
/// Description:

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 40.0),
        padding: const EdgeInsets.only(left: 4.0, right: 4.0, bottom: 4.0),
        color: const Color(0xFFF1F1F2),
        child: DismissScrollbar(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              _buildSearchLine(),
              StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                children: experiences
                    .map(
                      (e) => _ExperienceChild(experience: e),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      );

  Widget _buildSearchLine() => ColoredBox(
        color: Colors.white,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: const Color(0xFF131520)),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            margin: const EdgeInsets.all(10.0),
            child: Row(
              spacing: 10.0,
              children: [
                const Icon(Icons.search, size: 20.0, color: Color(0xFF72737A)),
                Expanded(
                  child: NoBorderTextField(
                    controller: _searchController,
                    hint: '郭德纲经典相声推荐',
                    labelColor: const Color(0xFF131520),
                    hintColor: const Color(0xFF72737A),
                  ),
                ),
                Container(
                  width: .5,
                  height: 20.0,
                  color: const Color(0xFFE3E3E4),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      '搜索',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF131520),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _ExperienceChild extends StatefulWidget {
  const _ExperienceChild({required this.experience});

  final ExperienceEntity experience;

  @override
  State<_ExperienceChild> createState() => _ExperienceChildState();
}

class _ExperienceChildState extends State<_ExperienceChild> {
  late final ExperienceEntity child = widget.experience;

  @override
  Widget build(BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => Get.toNamed(Routes.recommend_detail, arguments: child),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  child: Image.asset(
                    child.path ?? IconUtil.icon_001,
                    width: double.infinity,
                    height: child.height,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10.0,
                    children: [
                      Text(
                        child.title ?? '--',
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFF131520),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 4.0,
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  child.avatar ?? IconUtil.icon_001,
                                  width: 20.0,
                                  height: 20.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                child.username ?? '--',
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xFF72737A),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 4.0,
                            children: [
                              const Icon(
                                CupertinoIcons.suit_heart,
                                size: 20.0,
                                color: Color(0xFF909095),
                              ),
                              Text(
                                child.likeCount.toString(),
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xFF505159),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
