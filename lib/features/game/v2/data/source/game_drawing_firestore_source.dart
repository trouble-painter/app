import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/core/utils/serializer/deep_serializer.dart';
import 'package:x_pr/core/utils/serializer/time_serializer.dart';
import 'package:x_pr/core/utils/time/network_time_ext.dart';
import 'package:x_pr/features/game/v2/data/repository/drawing/game_drawing_repository.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/drawing/game_drawing.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/drawing/game_sketch.dart';

class GameDrawingFirestoreSource {
  static const _cDrawings = 'drawings';

  static final $ = AutoDisposeProvider<GameDrawingFirestoreSource>((ref) {
    return GameDrawingFirestoreSource(
      drawings: FirebaseFirestore.instance.collection(_cDrawings),
    );
  });

  final CollectionReference<Map<String, dynamic>> drawings;
  GameDrawingFirestoreSource({required this.drawings});

  Future<Result<GameDrawing>> create(GameDrawing drawing) async {
    try {
      final doc = const DeepSerializer().toJson(drawing.toJson());
      await drawings.doc(drawing.id).set(doc);
      return Success(drawing);
    } catch (e, s) {
      Logger.e("Failed to create", e, s);
      return Failure(e);
    }
  }

  Future<Result<GameDrawing>> get(String drawingId) async {
    try {
      final snapshot = await drawings.doc(drawingId).get();
      final doc = snapshot.data();
      if (doc == null) {
        return const Failure(GameDrawingRepositoryException.notFound);
      } else {
        return Success(GameDrawing.fromJson(doc));
      }
    } catch (e, s) {
      Logger.e("Failed to get", e, s);
      return Failure(e);
    }
  }

  Future<Result<void>> updateTurn(
    String drawingId,
    int turn,
  ) async {
    try {
      final drawingRef = drawings.doc(drawingId);
      await drawingRef.update({
        "turn": turn,
        "turnStartedAt": const TimeSerializer().toJson(NetworkTime.now),
      });
      return const Success(null);
    } catch (e, s) {
      Logger.e("Failed to drawing", e, s);
      return Failure(e);
    }
  }

  Future<Result<void>> updateStep(
    String drawingId,
    int step,
  ) async {
    try {
      final drawingRef = drawings.doc(drawingId);
      await drawingRef.update({
        "turn": 0,
        "step": step,
        "turnStartedAt": const TimeSerializer().toJson(NetworkTime.now),
      });
      return const Success(null);
    } catch (e, s) {
      Logger.e("Failed to drawing", e, s);
      return Failure(e);
    }
  }

  Future<Result<void>> updateSketchList(
    String drawingId,
    List<GameSketch> sketchList,
  ) async {
    try {
      final drawingRef = drawings.doc(drawingId);
      final sketchListValue = sketchList.map((sketch) {
        return const DeepSerializer().toJson(sketch.toJson());
      }).toList();
      await drawingRef.update({
        "sketchList": sketchListValue,
      });
      return const Success(null);
    } catch (e, s) {
      Logger.e("Failed to drawing", e, s);
      return Failure(e);
    }
  }

  Future<Result<void>> reset(GameDrawing drawing) async {
    try {
      await drawings.doc(drawing.id).set(
            const DeepSerializer().toJson(drawing.toJson()),
          );
      return const Success(null);
    } catch (e, s) {
      Logger.e("Failed to reset", e, s);
      return Failure(e);
    }
  }

  Future<Result<Stream<GameDrawing>>> subscribe(String drawingId) async {
    try {
      final stream = drawings.doc(drawingId).snapshots().transform<GameDrawing>(
        StreamTransformer.fromHandlers(
          handleData: (json, sink) {
            final drawing = GameDrawing.fromJson(json.data()!);
            sink.add(drawing);
          },
        ),
      );
      return Success(stream);
    } catch (e, s) {
      Logger.e("Failed to subscribe", e, s);
      return Failure(e);
    }
  }
}
