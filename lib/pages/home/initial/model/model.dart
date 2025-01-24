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

  /// 在 flutter web 项目中使用 get_storage 插件时，可能会遇到第二次读取 List 类型数据时返回的数
  /// 据类型为 JSArray 的问题。这是因为 get_storage 在 web 上使用了 window.localStorage，而
  /// localStorage 只能存储字符串。
  /// 当你尝试直接保存和读取 List 类型的数据时，数据会呗转换成 JSON 字符串。而在 web 环境下，
  /// 读取出来的数据会是 JSArray 类型，这是 Dart 和 JavaScript 之间的桥接类型。
  /// 要解决这个问题，可以在保存数据之前将 List 转换为 JSON 字符串，在读取数据时再将字符串转
  /// 换回 List。
  /// 注意: 上述只适用于基本类型。
  /// 若是自定义类型，则参考:
  /// 在 flutter web 项目中使用 get_storage 插件时，可能会遇到第二次读取 List<ProductEntity> 返回
  /// 的数据类型为 JSArray 的问题。这是因为 web 环境下的 get_storage 使用了 JavaScript 内置的存
  /// 储方案，而不是直接序列化 Dart 对象。
  /// 要解决这个问题，可以在存储和读取数据时手动进行序列化和反序列化。
  /// toJson() 方法用于将 ProductEntity 对象转换为 JSON 格式，而 fromJson 构造函数用于从 JSON 字
  /// 符串反序列化为 ProductEntity 对象。使用 jsonEncode 和 jsonDecode 函数来处理 JSON 序列化和
  /// 反序列化。这样，可以正确地在 web 环境下使用 get_straoge 插件来存储和读取自定义对象列表
  /// 。
  static Future<void> save(StorageKeyEnum key, List<ProductEntity> value) =>
      StorageUtil.write(
        key,
        kIsWeb ? jsonEncode(value.map((e) => e.toJson()).toList()) : value,
      );

  static List<ProductEntity> read(StorageKeyEnum key) {
    final value = StorageUtil.read(key);
    return kIsWeb
        ? (jsonDecode(value) as List)
            .map((e) => ProductEntity.fromJson(e))
            .toList()
        : value;
  }

  @override
  String toString() => jsonEncode(this);
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

@JsonSerializable()
class FriendEntity {
  const FriendEntity({this.name, this.avatar, this.time, this.message});

  factory FriendEntity.fromJson(Map<String, dynamic> json) =>
      _$FriendEntityFromJson(json);

  final String? name;
  final String? avatar;
  final String? time;
  final String? message;

  Map<String, dynamic> toJson() => _$FriendEntityToJson(this);

  @override
  String toString() => jsonEncode(this);
}

const List<FriendEntity> friends = [
  FriendEntity(
    name: '刘亦菲',
    avatar: IconUtil.icon_001,
    time: '2024/01/22',
    message: '我要嫁给过儿为妻',
  ),
  FriendEntity(
    name: '赵丽颖',
    avatar: IconUtil.icon_002,
    time: '2024/02/10',
    message: '世上安得双全法，不负如来不负卿',
  ),
  FriendEntity(
    name: '白鹿',
    avatar: IconUtil.icon_003,
    time: '2024/03/09',
    message: '啊~~~~~~~~~~~~~~~~~~~~~~~~',
  ),
  FriendEntity(
    name: '赵露思',
    avatar: IconUtil.icon_004,
    time: '2024/04/14',
    message: '不知道演过啥',
  ),
  FriendEntity(
    name: '刘浩存',
    avatar: IconUtil.icon_005,
    time: '2024/05/09',
    message: '我希望你能活着看到黎明的到来',
  ),
  FriendEntity(
    name: '杨幂',
    avatar: IconUtil.icon_006,
    time: '2024/06/27',
    message: '我才是那个豪门',
  ),
  FriendEntity(
    name: '刘诗诗',
    avatar: IconUtil.icon_007,
    time: '2024/07/12',
    message: '没有那把剑，我照样可以歼灭敌军',
  ),
  FriendEntity(
    name: '唐嫣',
    avatar: IconUtil.icon_008,
    time: '2024/08/08',
    message: '我们这里是酒吧',
  ),
  FriendEntity(
    name: '李一桐',
    avatar: IconUtil.icon_009,
    time: '2024/09/20',
    message: '我总觉得他写的故事是真的',
  ),
  FriendEntity(
    name: '李沁',
    avatar: IconUtil.icon_010,
    time: '2024/10/01',
    message: '你认不认识五竹？',
  ),
  FriendEntity(
    name: '黎姿',
    avatar: IconUtil.icon_011,
    time: '2024/11/04',
    message: '无忌师兄，我是周芷若',
  ),
  FriendEntity(
    name: '邱意浓',
    avatar: IconUtil.icon_012,
    time: '2024/12/05',
    message: '看你开那辆破车，能不能追上我',
  ),
  FriendEntity(
    name: '袁洁莹',
    avatar: IconUtil.icon_013,
    time: '2025/01/22',
    message: '我命由我不由天！',
  ),
  FriendEntity(
    name: '张曼玉',
    avatar: IconUtil.icon_014,
    time: '2025/02/10',
    message: '老娘是龙门客栈老板娘金镶玉',
  ),
  FriendEntity(
    name: '朱茵',
    avatar: IconUtil.icon_015,
    time: '2025/03/09',
    message: '那这串手链你是在哪里买的？',
  ),
  FriendEntity(
    name: '张国立',
    avatar: IconUtil.icon_016,
    time: '2025/04/14',
    message: '和珅是大清国第一大贪官！',
  ),
  FriendEntity(
    name: '金士杰',
    avatar: IconUtil.icon_017,
    time: '2025/05/09',
    message: '今年分红一千四百万两零六百零五钱！',
  ),
  FriendEntity(
    name: '黎耀祥',
    avatar: IconUtil.icon_018,
    time: '2025/06/27',
    message: '未来三年之内我要连拿三届金像奖影帝！',
  ),
  FriendEntity(
    name: '张达明',
    avatar: IconUtil.icon_019,
    time: '2025/07/12',
    message: '那你练了没有啊？',
  ),
  FriendEntity(
    name: '周星驰',
    avatar: IconUtil.icon_020,
    time: '2025/08/08',
    message: '谁叫你剪这么漂亮的？哪个叫你剪这么漂亮的？！',
  ),
  FriendEntity(
    name: '周润发',
    avatar: IconUtil.icon_021,
    time: '2025/09/20',
    message: '我只是要别人知道，我失去的我一定要拿回来！',
  ),
  FriendEntity(
    name: '梁朝伟',
    avatar: IconUtil.icon_022,
    time: '2025/10/01',
    message: '什么意思，你上来晒太阳的啊！？',
  ),
  FriendEntity(
    name: '郭富城',
    avatar: IconUtil.icon_023,
    time: '2025/11/04',
    message: '丘吉尔说过: 任何战争都是不必要的',
  ),
  FriendEntity(
    name: '李连杰',
    avatar: IconUtil.icon_024,
    time: '2025/12/05',
    message: '记住，战场上只能有一个头儿！',
  ),
  FriendEntity(name: '李兰迪', avatar: IconUtil.icon_025, time: '2024/01/22'),
  FriendEntity(
    name: '关晓彤',
    avatar: IconUtil.icon_026,
    time: '2024/01/22',
    message: '落地请开手机！',
  ),
  FriendEntity(
    name: '张卫健',
    avatar: IconUtil.icon_027,
    time: '2024/01/22',
    message: '凉风有信，秋月无边！',
  ),
  FriendEntity(
    name: '陈小春',
    avatar: IconUtil.icon_028,
    time: '2024/01/22',
    message: '你好，我叫山鸡，鸡巴的鸡',
  ),
];
