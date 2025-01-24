import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/icon_util.dart';
import '../../initial/model/model.dart';

/// CreateDate: 2025/1/24 11:37
/// Author: Lee
/// Description:

class IndividualTabChild extends StatelessWidget {
  const IndividualTabChild({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: [
          FadeInImage(
            image: AssetImage(product.path ?? IconUtil.icon_001),
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
                  product.likeCount.toString(),
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
