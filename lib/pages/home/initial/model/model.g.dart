// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductEntity _$ProductEntityFromJson(Map<String, dynamic> json) =>
    ProductEntity(
      path: json['path'] as String?,
      likeCount: (json['likeCount'] as num?)?.toInt() ?? 0,
      collectCount: (json['collectCount'] as num?)?.toInt() ?? 0,
      shareCount: (json['shareCount'] as num?)?.toInt() ?? 0,
      isLiked: json['isLiked'] as bool? ?? false,
      isCollected: json['isCollected'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductEntityToJson(ProductEntity instance) =>
    <String, dynamic>{
      'path': instance.path,
      'likeCount': instance.likeCount,
      'collectCount': instance.collectCount,
      'shareCount': instance.shareCount,
      'isLiked': instance.isLiked,
      'isCollected': instance.isCollected,
    };
