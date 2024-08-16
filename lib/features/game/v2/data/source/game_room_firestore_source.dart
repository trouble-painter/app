import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/core/utils/serializer/deep_serializer.dart';
import 'package:x_pr/features/game/v2/domain/entities/common/game_player.dart';
import 'package:x_pr/features/game/v2/domain/entities/room/game_room.dart';

class GameRoomFirestoreSource {
  static const _cRooms = 'rooms';

  static final $ = AutoDisposeProvider<GameRoomFirestoreSource>((ref) {
    return GameRoomFirestoreSource(
      rooms: FirebaseFirestore.instance.collection(_cRooms),
    );
  });

  final CollectionReference<Map<String, dynamic>> rooms;
  GameRoomFirestoreSource({required this.rooms});

  Future<Result<GameRoom>> create(GameRoom room) async {
    try {
      final doc = const DeepSerializer().toJson(room.toJson());
      await rooms.doc(room.id).set(doc);
      return Success(room);
    } catch (e, s) {
      Logger.e("Failed to create", e, s);
      return Failure(e);
    }
  }

  Future<Result<GameRoom>> join(GameRoom room, GamePlayer player) async {
    try {
      for (final roomPlayer in room.players) {
        if (roomPlayer.id == player.id) {
          /// Already joined
          return Success(room);
        }
      }

      final roomRef = rooms.doc(room.id);
      await roomRef.update({
        'players': FieldValue.arrayUnion([player.toJson()]),
      });
      final json = (await roomRef.get()).data()!;
      return Success(GameRoom.fromJson(json));
    } catch (e, s) {
      Logger.e("Failed to join", e, s);
      return Failure(e);
    }
  }

  Future<Result<GameRoom?>> get(String roomId) async {
    try {
      final res = await rooms.doc(roomId).get();
      final json = res.data();
      if (json == null) {
        return const Success(null);
      } else {
        return Success(GameRoom.fromJson(json));
      }
    } catch (e, s) {
      Logger.e("Failed to get", e, s);
      return Failure(e);
    }
  }

  Future<Result<GameRoom?>> getLatest() async {
    try {
      final snapshot = await rooms
          .orderBy(
            'createdAt',
            descending: true,
          )
          .limit(1)
          .get();
      final doc = snapshot.docs.firstOrNull?.data();
      if (doc == null) {
        return const Success(null);
      } else {
        return Success(GameRoom.fromJson(doc));
      }
    } catch (e, s) {
      Logger.e("Failed to getLatest", e, s);
      return Failure(e);
    }
  }

  Future<Result<Stream<GameRoom>>> subscribe(String roomId) async {
    try {
      final stream = rooms.doc(roomId).snapshots().transform<GameRoom>(
        StreamTransformer.fromHandlers(
          handleData: (json, sink) {
            final room = GameRoom.fromJson(json.data()!);
            sink.add(room);
          },
        ),
      );
      return Success(stream);
    } catch (e, s) {
      Logger.e("Failed to subscribe", e, s);
      return Failure(e);
    }
  }

  Future<Result<void>> left(
    String roomId,
    GamePlayer player,
  ) async {
    try {
      await rooms.doc(roomId).update({
        'players': FieldValue.arrayRemove([player.toJson()]),
      });
      return const Success(null);
    } catch (e, s) {
      Logger.e("Failed to left", e, s);
      return Failure(e);
    }
  }

  Future<Result<void>> update(
    String roomId,
    Map<String, dynamic> data,
  ) async {
    try {
      await rooms.doc(roomId).update(data);
      return const Success(null);
    } catch (e, s) {
      Logger.e("Failed to update", e, s);
      return Failure(e);
    }
  }

  Future<Result<void>> deleteField(String roomId, String field) async {
    try {
      await rooms.doc(roomId).update({
        field: FieldValue.delete(),
      });
      return const Success(null);
    } catch (e, s) {
      Logger.e("Failed to deleteField", e, s);
      return Failure(e);
    }
  }
}
