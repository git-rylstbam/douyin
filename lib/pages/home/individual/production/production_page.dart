import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/icon_util.dart';
import '../../initial/model/model.dart';

/// CreateDate: 2025/1/22 13:51
/// Author: Lee
/// Description:

class ProductionPage extends StatefulWidget {
  const ProductionPage({super.key});

  @override
  State<ProductionPage> createState() => _ProductionPageState();
}

class _ProductionPageState extends State<ProductionPage> {
  late final List<ProductEntity> _productions;

  @override
  void initState() {
    super.initState();
    _productions = ProductEntity.read();
  }

  @override
  Widget build(BuildContext context) => SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
          mainAxisExtent: 240.0,
        ),
        itemBuilder: (_, index) => _buildProduction(_productions[index]),
        itemCount: _productions.length,
      );

  Widget _buildProduction(ProductEntity production) => Stack(
        fit: StackFit.expand,
        children: [
          FadeInImage(
            image: AssetImage(production.path ?? IconUtil.icon_001),
            placeholder: const AssetImage(IconUtil.icon_placeholder),
            height: 240.0,
            fit: BoxFit.cover,
            placeholderFit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 200),
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            child: Row(
              spacing: 10.0,
              children: [
                const Icon(
                  CupertinoIcons.hammer,
                  size: 12.0,
                  color: Colors.white,
                ),
                Text(
                  production.likeCount.toString(),
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
