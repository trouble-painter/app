import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/core/theme/res/palette.dart';
import 'package:x_pr/core/utils/time/network_time_ext.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/domain/entities/drawing/sketch.dart';
import 'package:x_pr/features/game/domain/entities/game_state/game_state.dart';
import 'package:x_pr/features/game/domain/entities/game_step.dart';
import 'package:x_pr/features/game/domain/entities/game_user.dart';

class DebugUiUsecase implements BaseUsecase<GameStep, GameState> {
  static final $ = AutoDisposeProvider<DebugUiUsecase>((ref) {
    return DebugUiUsecase(
      getConfig: () => ref.read(ConfigService.$),
    );
  });

  DebugUiUsecase({
    required Config Function() getConfig,
  }) : _getConfig = getConfig;

  final Config Function() _getConfig;
  Config get _config => _getConfig();
  bool get _isKo => _config.language.isKorean;
  String get _category => _isKo ? "장소" : "Transportation";
  String get _keyword => _isKo ? "도시" : "Motocycle";
  final int _myTurn = 0;
  final String _dummyRoomId = "ABCDFE";
  late final List<List<GameUser>> _voteResult = List.generate(
    dummyUserList.length,
    (i) => switch (i) {
      0 =>
        dummyUserList.where((user) => user != dummyUserList[_myTurn]).toList(),
      _ => [],
    },
  );

  static const bool _isMafia = true;
  static const bool _isQuickStartGame = true;

  static final List<Sketch> _dummySketchList = jsonDecode(
    '[{"userId":1,"strokeList":[{"x":[53.0,52.0,53.0,53.0,54.0,55.0,57.0,61.0,75.0,94.0,107.0,111.0,112.0,115.0,120.0,127.0,130.0,130.0,129.0,128.0,128.0],"y":[343.0,332.0,302.0,245.0,229.0,223.0,220.0,219.0,215.0,207.0,203.0,202.0,202.0,208.0,222.0,241.0,263.0,289.0,315.0,330.0,336.0],"t":[7892.0,51.0,47.0,46.0,52.0,48.0,52.0,48.0,48.0,53.0,48.0,49.0,52.0,49.0,50.0,49.0,48.0,49.0,48.0,51.0,71.0]}],"canvasSize":{"w":335.0,"h":425.0},"color":"ffffd536"},{"userId":2,"strokeList":[{"x":[210.0,210.0,213.0,212.0,210.0,199.0,192.0,189.0,189.0,190.0,190.0,193.0,233.0,286.0,305.0,307.0,303.0,303.0,308.0,315.0,317.0,320.0,320.0,321.0,321.0,322.0,323.0,324.0,324.0,325.0,329.0,331.0,331.0],"y":[493.0,430.0,360.0,339.0,333.0,297.0,244.0,212.0,145.0,134.0,128.0,128.0,126.0,120.0,118.0,118.0,157.0,224.0,306.0,363.0,382.0,397.0,399.0,405.0,414.0,430.0,443.0,446.0,447.0,455.0,472.0,485.0,486.0],"t":[3464.0,57.0,34.0,48.0,32.0,62.0,49.0,32.0,38.0,32.0,44.0,59.0,48.0,51.0,35.0,73.0,63.0,32.0,52.0,51.0,42.0,33.0,41.0,38.0,35.0,37.0,42.0,46.0,51.0,49.0,37.0,49.0,88.0]}],"canvasSize":{"w":390.0,"h":617.0},"color":"ffff5d47"},{"userId":205,"strokeList":[{"x":[78.0,81.0,78.0,76.0,76.0,119.0,124.0,146.0,149.0,152.0,154.0,156.0,158.0,158.0,159.0,159.0,160.0],"y":[213.0,207.0,193.0,187.0,182.0,182.0,183.0,183.0,187.0,192.0,205.0,217.0,239.0,265.0,271.0,312.0,315.0],"t":[9765.0,34.0,48.0,34.0,48.0,33.0,32.0,34.0,48.0,33.0,49.0,33.0,32.0,47.0,33.0,35.0,32.0]}],"canvasSize":{"w":335.0,"h":425.0},"color":"ffffd536"},{"userId":3,"strokeList":[{"x":[257.0,254.0,249.0,247.0,247.0,254.0,264.0,271.0,276.0,278.0,281.0,281.0,283.0,285.0,286.0,287.0,287.0,281.0,264.0,255.0,254.0],"y":[487.0,475.0,448.0,433.0,432.0,433.0,433.0,432.0,431.0,430.0,430.0,431.0,441.0,462.0,473.0,474.0,478.0,478.0,481.0,482.0,483.0],"t":[6172.0,54.0,44.0,49.0,139.0,49.0,35.0,45.0,37.0,32.0,40.0,32.0,49.0,45.0,38.0,46.0,218.0,52.0,48.0,46.0,52.0]}],"canvasSize":{"w":390.0,"h":617.0},"color":"ffff5d47"}]',
  ).map<Sketch>((json) {
    return Sketch.fromJson(json);
  }).toList();

  static final List<GameUser> dummyUserList = [
    GameUser(
      id: 1,
      nickname: '우주캡숑귀요미',
      color: Palette.drawingRed,
      isConnect: true,
    ),
    GameUser(
      id: 2,
      nickname: '팽도리',
      color: Palette.drawingOrange,
      isConnect: true,
    ),
    GameUser(
      id: 3,
      nickname: '피콜로',
      color: Palette.drawingYellow,
      isConnect: true,
    ),
    GameUser(
      id: 4,
      nickname: '카카로트',
      color: Palette.drawingLightGreen,
      isConnect: true,
    ),
    GameUser(
      id: 5,
      nickname: '고양이',
      color: Palette.drawingGreen,
      isConnect: true,
    ),
    GameUser(
      id: 6,
      nickname: '뇸뇸이1',
      color: Palette.drawingLightBlue,
      isConnect: true,
    ),
    GameUser(
      id: 7,
      nickname: '뇸뇸이2',
      color: Palette.drawingBlue,
      isConnect: true,
    ),
    GameUser(
      id: 8,
      nickname: '뇸뇸이3',
      color: Palette.drawingPurple,
      isConnect: true,
    ),
    GameUser(
      id: 9,
      nickname: '뇸뇸이4',
      color: Palette.drawingPink,
      isConnect: true,
    ),
    GameUser(
      id: 10,
      nickname: '뇸뇸이5',
      color: Palette.drawingGray,
      isConnect: true,
    ),
  ];

  @override
  GameState call(GameStep step) {
    return switch (step) {
      GameStep.quickStartWaiting => GameQuickStartWaitingState(),
      GameStep.waiting => GameWaitingState(
          userList: dummyUserList,
          roomId: _dummyRoomId,
          myId: 1,
          hostIndex: 0,
          minPlayer: 3,
          maxPlayer: 10,
        ),
      GameStep.ready => GameReadyState(
          roomId: _dummyRoomId,
          showMyRoleMs: 7000,
          startedAt: NetworkTime.now,
          isMafia: _isMafia,
          category: _category,
          keyword: _keyword,
        ),
      GameStep.drawing => GameDrawingState(
          userList: dummyUserList,
          maxStroke: 1,
          strokesLeft: 1,
          initAnimMs: 3000,
          roundAnimMs: 1650,
          maxRound: 1,
          currentRound: 0,
          currentTurn: 0,
          currentTurnStartedAt:
              NetworkTime.now.subtract(const Duration(seconds: 0)),
          category: _category,
          keyword: _keyword,
          currentSketch: Sketch.empty(),
          sketchList: [],
          isMafia: _isMafia,
          myTurn: _myTurn,
          stage: GameDrawingStage.round,
          turnMaxMs: 15000,
        ),
      GameStep.voting => GameVotingState(
          startedAt: NetworkTime.now,
          sketchList: [],
          voteResult: _voteResult,
          category: _category,
          keyword: _keyword,
          myTurn: _myTurn,
          myVoteIndex: -1,
          maxVotingMs: 10000,
          isMafia: false,
          userList: dummyUserList,
        ),
      GameStep.guess => GameGuessState(
          startedAt: NetworkTime.now,
          mafiaAnswer: "",
          sketchList: _dummySketchList,
          mafiaIndex: 0,
          category: _category,
          keyword: _keyword,
          isMafia: _isMafia,
          maxGuessMs: 30000,
          userList: dummyUserList,
        ),
      GameStep.result => GameResultState(
          mafiaAnswer: _keyword,
          sketchList: [],
          mafiaIndex: 0,
          isMafiaWin: _isMafia,
          isQuickStartGame: _isQuickStartGame,
          category: _category,
          keyword: _keyword,
          userList: dummyUserList,
          showResultMs: 15000,
          resultStartedAt: NetworkTime.now,
        ),
    };
  }
}
