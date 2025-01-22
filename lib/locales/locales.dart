import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// CreateDate: 2025/1/6 9:51
/// Author: Lee
/// Description:

class Locales extends Translations {
  static const cn = Locale('zh', 'CN');
  static const en = Locale('en', 'US');

  static const supported = [cn, en];

  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': _buildCNTranslations(),
        'en_US': _buildUSTranslations(),
      };

  Map<String, String> _buildCNTranslations() => {
        'initial': '首页',
        'shop': '商城',
        'publish': '发布',
        'message': '消息',
        'individual': '我',
        'change_font': '切换字体',
        'experience': '经验',
        'hotspot': '热点',
        'live_streaming': '直播',
        'friend': '朋友',
        'groupon': '团购',
        'peking': '北京',
        'attention': '关注',
        'choiceness': '精选',
        'recommend': '推荐',
        'collect_cards': '集卡',
        'collect': '收藏',
        'like': '点赞',
        'comment': '评论',
        'share': '分享',
        'add_friend': '添加朋友',
        'new_guest': '新访客',
        'douyin_id': '抖音号',
        'praised': '获赞',

      };

  Map<String, String> _buildUSTranslations() => {
        'initial': 'Initial',
        'shop': 'Shop',
        'publish': 'Publish',
        'message': 'Message',
        'individual': 'Individual',
        'change_font': 'Change Font',
        'experience': 'Experience',
        'hotspot': 'Hotspot',
        'live_streaming': 'Live Streaming',
        'friend': 'Friend',
        'groupon': 'Groupon',
        'peking': 'Peking',
        'attention': 'Attention',
        'choiceness': 'Choiceness',
        'recommend': 'Recommend',
        'collect_cards': 'Collect Cards',
        'collect': 'Collect',
        'like': 'Like',
        'comment': 'Comment',
        'share': 'Share',
        'add_friend': 'Add Friend',
        'new_guest': 'New Guest',
        'douyin_id': 'Douyin ID',
      };
}
