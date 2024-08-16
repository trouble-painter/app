import 'package:flutter/material.dart';
import 'package:x_pr/core/utils/serializer/color_serializer.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_user.dart';

class XGameUser {
  final int id;
  final String nickname;
  final Color color;
  final bool isConnect;
  final bool isOwner;

  XGameUser({
    required this.id,
    required this.nickname,
    required this.color,
    required this.isConnect,
    required this.isOwner,
  });

  factory XGameUser.fromJson(Map<String, dynamic> json) {
    return XGameUser(
      id: json['id'] ?? json['userId'],
      nickname: json['nickname'],
      color:
          const ColorSerializer().fromJson(json['colorCode'] ?? json['color']),
      isConnect: json['isConnect'],
      isOwner: json['isOwner'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nickname': nickname,
        'color': const ColorSerializer().toJson(color),
        'isConnect': isConnect,
        'isOwner': isOwner,
      };

  GameUser toEntity() => GameUser(
        id: id,
        nickname: nickname,
        color: color,
        isConnect: isConnect,
      );
}
