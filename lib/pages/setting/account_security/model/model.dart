import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

/// CreateDate: 2025/2/21 10:46
/// Author: Lee
/// Description:

part 'model.g.dart';

@JsonSerializable()
class DeviceEntity {
  const DeviceEntity({
    this.name,
    this.loginType,
    this.source,
    this.time,
    this.isLocal = false,
  });

  factory DeviceEntity.fromJson(Map<String, dynamic> json) =>
      _$DeviceEntityFromJson(json);

  final String? name;
  final String? loginType;
  final String? source;
  final String? time;
  final bool isLocal;

  Map<String, dynamic> toJson() => _$DeviceEntityToJson(this);

  @override
  String toString() => jsonEncode(this);
}

const devices = [
  DeviceEntity(
    name: 'iPhone 15 Pro Max',
    loginType: '验证码登录',
    source: '抖音',
    time: '2025.02.10 08:23:32',
    isLocal: true,
  ),
  DeviceEntity(
    name: 'awemePcClient',
    loginType: '一键登录',
    source: '抖音Web',
    time: '2025.02.08 09:35:15',
  ),
  DeviceEntity(
    name: 'iPhone 15 Pro Max',
    loginType: '一键登录',
    source: '汽水音乐',
    time: '2025.02.02 00:08:31',
  ),
  DeviceEntity(
    name: 'iPhone 15 Pro Max',
    loginType: '一键登录',
    source: '抖音精选',
    time: '2024.05.29 00:03:26',
  ),
  DeviceEntity(
    name: '网页登录',
    loginType: '扫码登录',
    source: '抖音Web',
    time: '2024.10.24 22:40:24',
  ),
  DeviceEntity(
    name: 'Redmi Note 11T Pro +',
    loginType: '登录方式未知',
    source: '抖音',
    time: '2023.11.04 23:05:56',
  ),
  DeviceEntity(
    name: 'iPhone 8 Plus',
    loginType: '登录方式未知',
    source: '抖音',
    time: '2022.07.02 22:29:06',
  ),
  DeviceEntity(
    name: '网页登录',
    loginType: '登录方式未知',
    source: '抖音创作服务平台',
    time: '2021.03.28 17:25:25',
  ),
  DeviceEntity(
    name: '网页登录',
    loginType: '登录方式未知',
    source: '抖音创作服务平台',
    time: '2021.03.23 10:49:17',
  ),
];
