// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceEntity _$DeviceEntityFromJson(Map<String, dynamic> json) => DeviceEntity(
      name: json['name'] as String?,
      loginType: json['loginType'] as String?,
      source: json['source'] as String?,
      time: json['time'] as String?,
      isLocal: json['isLocal'] as bool? ?? false,
    );

Map<String, dynamic> _$DeviceEntityToJson(DeviceEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'loginType': instance.loginType,
      'source': instance.source,
      'time': instance.time,
      'isLocal': instance.isLocal,
    };
