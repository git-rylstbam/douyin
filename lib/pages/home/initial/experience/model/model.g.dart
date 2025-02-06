// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperienceEntity _$ExperienceEntityFromJson(Map<String, dynamic> json) =>
    ExperienceEntity(
      id: (json['id'] as num?)?.toInt(),
      path: json['path'] as String?,
      title: json['title'] as String?,
      avatar: json['avatar'] as String?,
      username: json['username'] as String?,
      likeCount: (json['likeCount'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toDouble(),
      time: json['time'] as String?,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => CommentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExperienceEntityToJson(ExperienceEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
      'title': instance.title,
      'avatar': instance.avatar,
      'username': instance.username,
      'likeCount': instance.likeCount,
      'height': instance.height,
      'time': instance.time,
      'comments': instance.comments,
    };

CommentEntity _$CommentEntityFromJson(Map<String, dynamic> json) =>
    CommentEntity(
      avatar: json['avatar'] as String?,
      username: json['username'] as String?,
      comment: json['comment'] as String?,
      time: json['time'] as String?,
      area: json['area'] as String?,
      likeCount: (json['likeCount'] as num?)?.toInt(),
      unlikeCount: (json['unlikeCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CommentEntityToJson(CommentEntity instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'username': instance.username,
      'comment': instance.comment,
      'time': instance.time,
      'area': instance.area,
      'likeCount': instance.likeCount,
      'unlikeCount': instance.unlikeCount,
    };
