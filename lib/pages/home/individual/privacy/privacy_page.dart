import 'package:flutter/material.dart';

import '../../../../utils/storage_util.dart';
import '../../initial/model/model.dart';
import '../widgets/individual_tab_child.dart';

/// CreateDate: 2025/1/23 16:37
/// Author: Lee
/// Description:

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  late final List<ProductEntity> _privacies;

  @override
  void initState() {
    super.initState();
    if (!StorageUtil.has(StorageKeyEnum.privacy)) {
      final value = ProductEntity.read(StorageKeyEnum.product);
      value.shuffle();
      ProductEntity.save(StorageKeyEnum.privacy, value);
    }
    _privacies = ProductEntity.read(StorageKeyEnum.privacy);
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
          product: _privacies[index],
        ),
        itemCount: _privacies.length,
      );
}
