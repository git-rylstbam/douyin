import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/icon_util.dart';
import '../enums.dart';
import '../model/model.dart';

/// CreateDate: 2025/1/17 14:38
/// Author: Lee
/// Description:

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({
    super.key,
    required this.controller,
    required this.products,
  });

  final PageController controller;
  final List<ProductEntity> products;

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PageView.builder(
      key: const PageStorageKey(InitialKeys.product_position),
      controller: widget.controller,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (_, index) => _InitialPageChild(
        product: widget.products[index],
        onSave: () => ProductEntity.save(widget.products),
      ),
      itemCount: widget.products.length,
    );
  }
}

class _InitialPageChild extends StatefulWidget {
  const _InitialPageChild({required this.product, required this.onSave});

  final ProductEntity product;
  final void Function() onSave;

  @override
  State<_InitialPageChild> createState() => _InitialPageChildState();
}

class _InitialPageChildState extends State<_InitialPageChild>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  late final _likeCountNotifier = ValueNotifier<int>(widget.product.likeCount);
  late final _isLikedNotifier = ValueNotifier<bool>(widget.product.isLiked);
  late final _commentCountNotifier =
      ValueNotifier<int>(widget.product.commentCount);
  late final _collectCountNotifier =
      ValueNotifier<int>(widget.product.collectCount);
  late final _isCollectNotifier =
      ValueNotifier<bool>(widget.product.isCollected);
  late final _shareCountNotifier =
      ValueNotifier<int>(widget.product.shareCount);

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: .0, end: 2 * pi).animate(_controller);
  }

  @override
  void didUpdateWidget(_InitialPageChild oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.product == oldWidget.product) return;
    _likeCountNotifier.value = widget.product.likeCount;
    _isLikedNotifier.value = widget.product.isLiked;
    _commentCountNotifier.value = widget.product.commentCount;
    _collectCountNotifier.value = widget.product.collectCount;
    _isCollectNotifier.value = widget.product.isCollected;
    _shareCountNotifier.value = widget.product.shareCount;
  }

  @override
  void dispose() {
    _likeCountNotifier.dispose();
    _isLikedNotifier.dispose();
    _commentCountNotifier.dispose();
    _collectCountNotifier.dispose();
    _isCollectNotifier.dispose();
    _shareCountNotifier.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        if (widget.product.path != null)
          Image.asset(widget.product.path!, fit: BoxFit.fill),
        Align(
          alignment: Alignment.bottomRight,
          child: Stack(
            children: [
              ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
                child: Container(width: 40.0, color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  spacing: 10.0,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _UserAvatar(product: widget.product),
                    _buildLikeButton(),
                    _buildCommentButton(),
                    _buildCollectButton(),
                    _buildShareButton(),
                    _buildSourceButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLikeButton() => ListenableBuilder(
        listenable: Listenable.merge([_likeCountNotifier, _isLikedNotifier]),
        builder: (_, __) => _OperateButton(
          icon: CupertinoIcons.heart_fill,
          title: _likeCountNotifier.value == 0
              ? 'like'.tr
              : _likeCountNotifier.value.toString(),
          color:
              _isLikedNotifier.value ? const Color(0xFFFC2958) : Colors.white,
          onPressed: () {
            if (_isLikedNotifier.value) {
              _isLikedNotifier.value = false;
              _likeCountNotifier.value--;
            } else {
              _isLikedNotifier.value = true;
              _likeCountNotifier.value++;
            }
            widget.product.isLiked = _isLikedNotifier.value;
            widget.product.likeCount = _likeCountNotifier.value;
            widget.onSave();
          },
        ),
      );

  Widget _buildCommentButton() => ValueListenableBuilder(
        valueListenable: _commentCountNotifier,
        builder: (_, value, __) => _OperateButton(
          icon: CupertinoIcons.chat_bubble,
          title: value == 0 ? 'comment'.tr : value.toString(),
          color: Colors.white,
          onPressed: () {},
        ),
      );

  Widget _buildCollectButton() => ListenableBuilder(
        listenable:
            Listenable.merge([_collectCountNotifier, _isCollectNotifier]),
        builder: (_, __) => _OperateButton(
          icon: CupertinoIcons.star_fill,
          title: _collectCountNotifier.value == 0
              ? 'collect'.tr
              : _collectCountNotifier.value.toString(),
          color:
              _isCollectNotifier.value ? const Color(0xFFFC2958) : Colors.white,
          onPressed: () {
            if (_isCollectNotifier.value) {
              _isCollectNotifier.value = false;
              _collectCountNotifier.value--;
            } else {
              _isCollectNotifier.value = true;
              _collectCountNotifier.value++;
            }
            widget.product.isCollected = _isCollectNotifier.value;
            widget.product.collectCount = _collectCountNotifier.value;
            widget.onSave();
          },
        ),
      );

  Widget _buildShareButton() => ValueListenableBuilder(
        valueListenable: _shareCountNotifier,
        builder: (_, value, __) => _OperateButton(
          icon: CupertinoIcons.arrowshape_turn_up_right_fill,
          title: value == 0 ? 'share'.tr : value.toString(),
          color: Colors.white,
          onPressed: () {},
        ),
      );

  Widget _buildSourceButton() => IconButton(
        onPressed: () {},
        icon: RotationTransition(
          turns: _animation,
          child: ClipOval(
            child: Image.asset(
              widget.product.path ?? IconUtil.icon_001,
              width: 40.0,
              height: 40.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
}

class _OperateButton extends StatelessWidget {
  const _OperateButton({
    required this.icon,
    required this.title,
    required this.color,
    required this.onPressed,
  });

  final IconData icon;
  final String title;
  final Color color;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onPressed,
        child: Column(
          spacing: 4.0,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 28.0),
            Text(title, style: TextStyle(fontSize: 12.0, color: color)),
          ],
        ),
      );
}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar({required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                width: 40.0,
                height: 40.0,
              ),
              IconButton(
                onPressed: () {},
                icon: ClipOval(
                  child: Image.asset(
                    product.path ?? IconUtil.icon_001,
                    width: 35.0,
                    height: 35.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: .0,
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 20.0,
                height: 20.0,
                decoration: const BoxDecoration(
                  color: Color(0xFFFC2958),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 14.0),
              ),
            ),
          ),
        ],
      );
}
