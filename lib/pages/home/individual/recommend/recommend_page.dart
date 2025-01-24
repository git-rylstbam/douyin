import 'package:flutter/material.dart';

import '../../../../utils/storage_util.dart';
import '../../initial/model/model.dart';
import '../widgets/individual_tab_child.dart';

/// CreateDate: 2025/1/23 16:46
/// Author: Lee
/// Description:

class RecommendPage extends StatefulWidget {
  const RecommendPage({super.key});

  @override
  State<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  late final List<ProductEntity> _recommends;

  @override
  void initState() {
    super.initState();
    if (!StorageUtil.has(StorageKeyEnum.recommend)) {
      final value = ProductEntity.read(StorageKeyEnum.product);
      value.shuffle();
      ProductEntity.save(StorageKeyEnum.recommend, value);
    }
    _recommends = ProductEntity.read(StorageKeyEnum.recommend);
  }

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [_buildRecommendTip(), _buildRecommendList()],
      );

  Widget _buildRecommendTip() => const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            spacing: 10.0,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '你的推荐仅互相关注的人可见',
                style: TextStyle(fontSize: 12.0, color: Color(0xFF74767C)),
              ),
              Text(
                '设置',
                style: TextStyle(fontSize: 12.0, color: Color(0xFF0E4C8C)),
              ),
            ],
          ),
        ),
      );

  Widget _buildRecommendList() => SliverFillRemaining(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            mainAxisExtent: 240.0,
          ),
          itemBuilder: (_, index) => IndividualTabChild(
            product: _recommends[index],
          ),
          itemCount: _recommends.length,
        ),
      );
}
