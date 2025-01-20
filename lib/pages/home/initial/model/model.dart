import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../utils/icon_util.dart';
import '../../../../utils/storage_util.dart';

part 'model.g.dart';

/// CreateDate: 2025/1/16 17:26
/// Author: Lee
/// Description:

@JsonSerializable()
class ProductEntity {
  ProductEntity({
    this.path,
    this.likeCount = 0,
    this.commentCount = 0,
    this.collectCount = 0,
    this.shareCount = 0,
    this.isLiked = false,
    this.isCollected = false,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductEntityFromJson(json);

  final String? path;
  int likeCount;
  int commentCount;
  int collectCount;
  int shareCount;
  bool isLiked;
  bool isCollected;

  Map<String, dynamic> toJson() => _$ProductEntityToJson(this);

  @override
  String toString() => jsonEncode(this);

  /// 在 flutter web 项目中使用 get_storage 插件时，可能会遇到第二次读取 List 类型数据时返回的数
  /// 据类型为 JSArray 的问题。这是因为 get_storage 在 web 上使用了 window.localStorage，而
  /// localStorage 只能存储字符串。
  /// 当你尝试直接保存和读取 List 类型的数据时，数据会呗转换成 JSON 字符串。而在 web 环境下，
  /// 读取出来的数据会是 JSArray 类型，这是 Dart 和 JavaScript 之间的桥接类型。
  /// 要解决这个问题，可以在保存数据之前将 List 转换为 JSON 字符串，在读取数据时再将字符串转
  /// 换回 List。
  /// 注: 上述只适用于基本类型。
  /// 若是自定义类型，则参考:
  /// 在 flutter web 项目中使用 get_storage 插件时，可能会遇到第二次读取 List<ProductEntity> 返回
  /// 的数据类型为 JSArray 的问题。这是因为 web 环境下的 get_storage 使用了 JavaScript 内置的存
  /// 储方案，而不是直接序列化 Dart 对象。
  /// 要解决这个问题，可以在存储和读取数据时手动进行序列化和反序列化。
  /// toJson() 方法用于将 ProductEntity 对象转换为 JSON 格式，而 fromJson 构造函数用于从 JSON 字
  /// 符串反序列化为 ProductEntity 对象。使用 jsonEncode 和 jsonDecode 函数来处理 JSON 序列化和
  /// 反序列化。这样，可以正确地在 web 环境下使用 get_straoge 插件来存储和读取自定义对象列表
  /// 。
  static Future<void> save(List<ProductEntity> value) => StorageUtil.write(
        StorageKeyEnum.initial,
        kIsWeb ? jsonEncode(value.map((e) => e.toJson()).toList()) : value,
      );

  static List<ProductEntity> read() {
    final value = StorageUtil.read(StorageKeyEnum.initial);
    return kIsWeb
        ? (jsonDecode(value) as List)
            .map((e) => ProductEntity.fromJson(e))
            .toList()
        : value;
  }
}

final List<ProductEntity> products = [
  ProductEntity(path: IconUtil.icon_001),
  ProductEntity(path: IconUtil.icon_002),
  ProductEntity(path: IconUtil.icon_003),
  ProductEntity(path: IconUtil.icon_004),
  ProductEntity(path: IconUtil.icon_005),
  ProductEntity(path: IconUtil.icon_006),
  ProductEntity(path: IconUtil.icon_007),
  ProductEntity(path: IconUtil.icon_008),
  ProductEntity(path: IconUtil.icon_009),
  ProductEntity(path: IconUtil.icon_010),
  ProductEntity(path: IconUtil.icon_011),
  ProductEntity(path: IconUtil.icon_012),
  ProductEntity(path: IconUtil.icon_013),
  ProductEntity(path: IconUtil.icon_014),
  ProductEntity(path: IconUtil.icon_015),
  ProductEntity(path: IconUtil.icon_016),
  ProductEntity(path: IconUtil.icon_017),
  ProductEntity(path: IconUtil.icon_018),
  ProductEntity(path: IconUtil.icon_019),
  ProductEntity(path: IconUtil.icon_020),
  ProductEntity(path: IconUtil.icon_021),
  ProductEntity(path: IconUtil.icon_022),
  ProductEntity(path: IconUtil.icon_023),
  ProductEntity(path: IconUtil.icon_024),
  ProductEntity(path: IconUtil.icon_025),
  ProductEntity(path: IconUtil.icon_026),
  ProductEntity(path: IconUtil.icon_027),
  ProductEntity(path: IconUtil.icon_028),
  ProductEntity(path: IconUtil.icon_029),
  ProductEntity(path: IconUtil.icon_030),
  ProductEntity(path: IconUtil.icon_031),
  ProductEntity(path: IconUtil.icon_032),
  ProductEntity(path: IconUtil.icon_033),
  ProductEntity(path: IconUtil.icon_034),
  ProductEntity(path: IconUtil.icon_035),
  ProductEntity(path: IconUtil.icon_036),
  ProductEntity(path: IconUtil.icon_037),
  ProductEntity(path: IconUtil.icon_038),
  ProductEntity(path: IconUtil.icon_039),
  ProductEntity(path: IconUtil.icon_040),
  ProductEntity(path: IconUtil.icon_041),
  ProductEntity(path: IconUtil.icon_042),
  ProductEntity(path: IconUtil.icon_043),
  ProductEntity(path: IconUtil.icon_044),
  ProductEntity(path: IconUtil.icon_045),
  ProductEntity(path: IconUtil.icon_046),
  ProductEntity(path: IconUtil.icon_047),
  ProductEntity(path: IconUtil.icon_048),
];
