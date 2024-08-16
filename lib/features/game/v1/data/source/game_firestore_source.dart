import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/core/utils/serializer/deep_serializer.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_player.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_step.dart';
import 'package:x_pr/features/game/v1/domain/entities/playing/game_drawing.dart';
import 'package:x_pr/features/game/v1/domain/usecase/waiting/game_join_usecase.dart';

class GameFirestoreSource {
  static const _cRoom = 'rooms';
  static const _cDrawing = 'drawing';

  static final $ = AutoDisposeProvider<GameFirestoreSource>((ref) {
    return GameFirestoreSource(
      rooms: FirebaseFirestore.instance.collection(_cRoom),
    );
  });

  final CollectionReference<Map<String, dynamic>> rooms;
  GameFirestoreSource({required this.rooms});

  Future<Result<GameRoom>> createRoom(
    GameRoom room,
  ) async {
    try {
      final doc = const DeepSerializer().toJson(room.toJson());
      await rooms.doc(room.id).set(doc);
      return Success(room);
    } catch (e, s) {
      Logger.e("Failed to create", e, s);
      return Failure(e);
    }
  }

  Future<Result<GameRoom>> joinRoom({
    required GameRoom room,
    required GamePlayer player,
  }) async {
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

  Future<Result<void>> removePlayer(
    GameRoom room,
    GamePlayer targetPlayer,
  ) async {
    try {
      final roomRef = rooms.doc(room.id);
      await roomRef.update({
        'players': FieldValue.arrayRemove([targetPlayer.toJson()]),
      });
      return const Success(null);
    } catch (e, s) {
      Logger.e("Failed to removePlayer", e, s);
      return Failure(e);
    }
  }

  Future<Result<GameRoom>> getRoom(String roomId) async {
    try {
      final res = await rooms.doc(roomId).get();
      final json = res.data();
      if (json == null) {
        return const Failure(GameJoinUsecaseException.notFound);
      } else {
        return Success(GameRoom.fromJson(json));
      }
    } catch (e, s) {
      Logger.e("Failed to get", e, s);
      return Failure(e);
    }
  }

  Future<Result<Stream<GameRoom>>> subscribeRoom(String roomId) async {
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

  Future<Result<void>> leftRoom({
    required String roomId,
    required GamePlayer player,
  }) async {
    try {
      await rooms.doc(roomId).update({
        'players': FieldValue.arrayRemove([player.toJson()]),
      });
      return const Success(null);
    } catch (e, s) {
      Logger.e("Failed to exit", e, s);
      return Failure(e);
    }
  }

  Future<Result<GameRoom>> start(GameRoom room) async {
    try {
      WriteBatch batch = FirebaseFirestore.instance.batch();

      /// Start room
      final roomRef = rooms.doc(room.id);
      final roomDoc = const DeepSerializer().toJson(room.toJson());
      batch.set(roomRef, roomDoc);

      /// Create drawing collection
      for (int i = 0; i < room.players.length; i++) {
        final player = room.players[i];
        final drawing = GameDrawing(
          strokeList: [],
          canvasSize: const Size(0, 0),
          player: player.id,
          color: player.color,
        );
        final drawingDoc = const DeepSerializer().toJson(drawing.toJson());
        final drawingDocRef = roomRef.collection(_cDrawing).doc("$i");
        batch.set(
          drawingDocRef,
          drawingDoc,
        );
      }

      await batch.commit();
      return Success(room);
    } catch (e, s) {
      Logger.e("Failed to start", e, s);
      return Failure(e);
    }
  }

  Future<Result<void>> play(GameRoom room) async {
    try {
      await rooms.doc(room.id).update({
        "step": GameRoomState.playing.name,
      });
      return const Success(null);
    } catch (e, s) {
      Logger.e("Failed to play", e, s);
      return Failure(e);
    }
  }

  Future<Result<void>> drawing(
    GameRoom room,
    GameDrawing drawing,
  ) async {
    try {
      if (room.state != GameRoomState.playing) {
        return const Failure(
          "Room step should be GameStep.playing.",
        );
      }
      final order = room.currentDrawingOrder;
      final drawingRef = rooms.doc(room.id).collection(_cDrawing);
      final drawingDoc = const DeepSerializer().toJson(drawing.toJson());
      // Logger.d(
      //   "drawing : ${room.id}/drawing/$order : ${drawing.strokeList.length}",
      // );
      await drawingRef.doc("$order").set(drawingDoc);
      return const Success(null);
    } catch (e, s) {
      Logger.e("Failed to drawing", e, s);
      return Failure(e);
    }
  }

  Future<Result<Stream<List<GameDrawing>>>> subscribeDrawing(
    GameRoom room,
  ) async {
    try {
      if (room.state != GameRoomState.playing) {
        return const Failure(
          "Room step should be GameStep.playing.",
        );
      }
      final drawingRef = rooms.doc(room.id).collection(_cDrawing);
      final drawingStream = drawingRef.snapshots().transform<List<GameDrawing>>(
        StreamTransformer.fromHandlers(
          handleData: (snapshot, sink) {
            final drawingList = snapshot.docChanges
                .map((docChange) => GameDrawing.fromJson(docChange.doc.data()!))
                .toList();
            sink.add(drawingList);
          },
        ),
      );
      return Success(drawingStream);
    } catch (e, s) {
      Logger.e("Failed to subscribe drawing", e, s);
      return Failure(e);
    }
  }

  Future<Result<void>> endTurn(GameRoom room) async {
    try {
      if (room.state != GameRoomState.playing) {
        return const Failure(
          "Room step should be GameStep.playing.",
        );
      }
      final roomRef = rooms.doc(room.id);
      final isLastTurn = room.currentDrawingOrder + 1 >= room.players.length;
      final nextRoom = isLastTurn
          ? room.copyWith(state: GameRoomState.voting)
          : room.copyWith(currentDrawingOrder: room.currentDrawingOrder + 1);
      final roomDoc = const DeepSerializer().toJson(nextRoom.toJson());
      await roomRef.update(roomDoc);
      return const Success(null);
    } catch (e, s) {
      Logger.e("Failed to endTurn", e, s);
      return Failure(e);
    }
  }

  Future<Result<void>> resetTurn(GameRoom room) async {
    try {
      if (room.state != GameRoomState.playing) {
        return const Failure(
          "Room step should be GameStep.playing.",
        );
      }
      await rooms.doc(room.id).update({
        "currentDrawingOrder": 0,
      });
      return const Success(null);
    } catch (e, s) {
      Logger.e("Failed to resetTurn", e, s);
      return Failure(e);
    }
  }

  Future<Result<void>> changeStep(GameRoom room, GameRoomState step) async {
    try {
      await rooms.doc(room.id).update({
        "step": step.name,
      });
      return const Success(null);
    } catch (e, s) {
      Logger.e("Failed to changeStep", e, s);
      return Failure(e);
    }
  }

  Future<Result<GameRoom?>> getLatestRoom() async {
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
      Logger.e("Failed to getRoomList", e, s);
      return Failure(e);
    }
  }
}
