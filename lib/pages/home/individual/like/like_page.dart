import 'package:flutter/material.dart';

import '../../../../utils/storage_util.dart';
import '../../initial/model/model.dart';
import '../widgets/individual_tab_child.dart';

/// CreateDate: 2025/1/23 16:43
/// Author: Lee
/// Description:

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  late final List<ProductEntity> _likes;

  @override
  void initState() {
    super.initState();
    if (!StorageUtil.has(StorageKeyEnum.like)) {
      final value = ProductEntity.read(StorageKeyEnum.product);
      value.shuffle();
      ProductEntity.save(StorageKeyEnum.like, value);
    }
    _likes = ProductEntity.read(StorageKeyEnum.like);
  }

  @override
  Widget build(BuildContext context) => SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
          mainAxisExtent: 240.0,
        ),
        itemBuilder: (_, index) => IndividualTabChild(
          product: _likes[index],
        ),
        itemCount: _likes.length,
      );
}
