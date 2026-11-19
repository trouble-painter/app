// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameRoom _$GameRoomFromJson(Map<String, dynamic> json) => _GameRoom(
      roomId: json['roomId'] as String,
      users: (json['users'] as List<dynamic>)
          .map((e) => GameUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameRoomToJson(_GameRoom instance) => <String, dynamic>{
      'roomId': instance.roomId,
      'users': instance.users,
    };
