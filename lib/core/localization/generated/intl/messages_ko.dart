// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ko';

  static String m0(n) => "라이선스 ${n}개";

  static String m1(spy, spyKeyword) =>
      "스파이 \"${spy}\"님이 입력한 \"${spyKeyword}\"는 키워드가 아닙니다 🚨";

  static String m2(spy) => "${spy}님이 키워드를 입력하고 있어요..";

  static String m3(spy) => "스파이 \"${spy}\"님이 지목되었습니다. 스파이가 키워드를 입력하고 있어요.";

  static String m4(category) =>
      "당신이 스파이로 지목되었습니다.\n[${category}] 카테고리의 키워드를 맞혀 보세요!";

  static String m5(n) => "${n}초";

  static String m6(msg0) => "${msg0} 후 사라져요";

  static String m7(n) => "${n}초 후에 대기방으로 이동합니다";

  static String m8(code, link) =>
      "Trouble Painter 초대\n코드 : [${code}]\n링크 : ${link}";

  static String m9(nickname) => "${nickname}님, 환영해요\n악동미술가를 찾아 미술관을 지켜내세요!";

  static String m10(roomId) => "스케치 스파이\n👉 초대 코드 : ${roomId}";

  static String m11(n) => "최대 ${n}자까지 쓸 수 있어요";

  static String m12(nickname) => "${nickname}님이 그리는 중...";

  static String m13(n) => "${n}초";

  static String m14(name) => "${name}로 문의 부탁드려요";

  static String m15(spy) => "스파이 \"${spy}\"님이 키워드를 맞혔어요! 🕵🏻";

  static String m16(spy) => "시민들이 스파이 \"${spy}\"님을 찾지 못했습니다 🥹";

  static String m17(citizen) => "아쉽게도 \"${citizen}\"님은 시민입니다 🥹";

  static String m18(n) => "${n}초 뒤 시작합니다";

  static String m19(n) => "당신의 순서 : ${n}번째";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "animal": MessageLookupByLibrary.simpleMessage("동물"),
        "appLicenseBgm": MessageLookupByLibrary.simpleMessage("BGM 라이선스"),
        "appLicenseOpenSource":
            MessageLookupByLibrary.simpleMessage("오픈소스 라이선스"),
        "appLicenseTotal": m0,
        "appName": MessageLookupByLibrary.simpleMessage("Trouble Painter"),
        "brush": MessageLookupByLibrary.simpleMessage("브러시"),
        "cancel": MessageLookupByLibrary.simpleMessage("취소"),
        "cannotVoteSelf":
            MessageLookupByLibrary.simpleMessage("본인에게 투표할 수 없어요."),
        "category": MessageLookupByLibrary.simpleMessage("카테고리"),
        "checkNetwork":
            MessageLookupByLibrary.simpleMessage("네트워크 연결 상태를 확인해 주세요"),
        "citizen": MessageLookupByLibrary.simpleMessage("착한미술가"),
        "citizenWinAction": m1,
        "citizenWinResult": MessageLookupByLibrary.simpleMessage("시민 승리! 🎉"),
        "citizens": MessageLookupByLibrary.simpleMessage("착한미술가들"),
        "complete": MessageLookupByLibrary.simpleMessage("완료"),
        "components": MessageLookupByLibrary.simpleMessage("컴포넌트"),
        "confirm": MessageLookupByLibrary.simpleMessage("확인"),
        "copied": MessageLookupByLibrary.simpleMessage("복사 완료"),
        "createRoom": MessageLookupByLibrary.simpleMessage("방 만들기"),
        "dev": MessageLookupByLibrary.simpleMessage("개발자 메뉴"),
        "devGameDevMode": MessageLookupByLibrary.simpleMessage("게임 개발자 모드"),
        "devLocalData": MessageLookupByLibrary.simpleMessage("로컬 데이터"),
        "devLog": MessageLookupByLibrary.simpleMessage("로그"),
        "devUiTestMode": MessageLookupByLibrary.simpleMessage("UI 테스트 모드"),
        "drawingSecLimit": MessageLookupByLibrary.simpleMessage("시간 제한"),
        "drawingStrokeLimit": MessageLookupByLibrary.simpleMessage("획 수 제한"),
        "editNickname": MessageLookupByLibrary.simpleMessage("닉네임 변경"),
        "editNicknameDesc":
            MessageLookupByLibrary.simpleMessage("최대 7자까지 쓸 수 있어요"),
        "editNicknameHint": MessageLookupByLibrary.simpleMessage("닉네임 입력"),
        "editNicknameTitle":
            MessageLookupByLibrary.simpleMessage("변경할 닉네임을 입력해 주세요"),
        "empty": MessageLookupByLibrary.simpleMessage("비어있음"),
        "eraser": MessageLookupByLibrary.simpleMessage("지우개"),
        "gameAnsweringCitizenInputHint": m2,
        "gameAnsweringCitizenTitle": m3,
        "gameAnsweringDesc":
            MessageLookupByLibrary.simpleMessage("키워드를 맞히면 스파이가 승리합니다."),
        "gameAnsweringSpyInputHint":
            MessageLookupByLibrary.simpleMessage("키워드를 입력해 주세요."),
        "gameAnsweringSpyTitle": m4,
        "gameDesc1": MessageLookupByLibrary.simpleMessage(
            "1️⃣ 시민들에게 키워드를 알려줍니다.\n2️⃣ 한 획을 그리면 다음 차례로 넘어갑니다.\n3️⃣ 전체 두 번씩 그린 뒤 스파이를 지목합니다.\n4️⃣ 스파이가 지목된 경우 스파이가 생각한 키워드를 제출합니다."),
        "gameDesc2": MessageLookupByLibrary.simpleMessage(
            "🧑‍🎨 시민 승리\n스파이가 키워드를 맞히지 못한 경우\n\n🕵🏻 스파이 승리\n스파이로 지목을 당하지 않은 경우,\n또는 키워드를 맞힌 경우"),
        "gameDrawingInitMsg0": m5,
        "gameDrawingInitMsg1": m6,
        "gameDrawingMyTurn": MessageLookupByLibrary.simpleMessage("내 차례"),
        "gameDrawingNotConnected": MessageLookupByLibrary.simpleMessage("외출중"),
        "gameDrawingOtherTurn": MessageLookupByLibrary.simpleMessage("그리는 중"),
        "gameDrawingTurnOverlayTitle":
            MessageLookupByLibrary.simpleMessage("당신의 그리기 순서는?"),
        "gameGuessAiHint": MessageLookupByLibrary.simpleMessage("AI 힌트"),
        "gameGuessAnswer": MessageLookupByLibrary.simpleMessage(""),
        "gameGuessAnswer2": MessageLookupByLibrary.simpleMessage("일까?"),
        "gameGuessCitizenCaption":
            MessageLookupByLibrary.simpleMessage("악동미술가가 키워드를 맞추면 악동미술가의 승리에요"),
        "gameGuessCitizenDescription":
            MessageLookupByLibrary.simpleMessage("하지만, 아직 방심은 일러요!"),
        "gameGuessCitizenTitle2":
            MessageLookupByLibrary.simpleMessage("를 찾았어요"),
        "gameGuessHint":
            MessageLookupByLibrary.simpleMessage("들켰다! 키워드를 맞추세요!"),
        "gameGuessThinking": MessageLookupByLibrary.simpleMessage("생각중.."),
        "gameName": MessageLookupByLibrary.simpleMessage("스파이를 찾아라"),
        "gamePagePopDesc":
            MessageLookupByLibrary.simpleMessage("지금 나가면 초대코드가 있어야 들어올 수 있어요"),
        "gamePagePopTitle": MessageLookupByLibrary.simpleMessage("나가시겠어요?"),
        "gamePageReconnecting":
            MessageLookupByLibrary.simpleMessage("재접속 중입니다."),
        "gameReadyRole1": MessageLookupByLibrary.simpleMessage("당신은"),
        "gameReadyRole2": MessageLookupByLibrary.simpleMessage("입니다"),
        "gameReadyRoleCitizenDescription": MessageLookupByLibrary.simpleMessage(
            "악동미술가에게 키워드를 들키지 않도록, 내 순서에 맞춰 그림으로 표현하세요!"),
        "gameReadyRoleMafiaDescription": MessageLookupByLibrary.simpleMessage(
            "착한미술가들이 어떤 키워드를 그리는지 추측하세요. 정체를 들키면 안돼요"),
        "gameResultCitizensWin": MessageLookupByLibrary.simpleMessage("의 승리에요"),
        "gameResultMafiaCorrectDesc": MessageLookupByLibrary.simpleMessage(
            "정답을 맞추고 다른 장난을 치러\n이미 미술관을 떠났어요"),
        "gameResultMafiaNotFoundDesc": MessageLookupByLibrary.simpleMessage(
            "악동미술가가 꽁꽁 숨었어요. 악동미술가는 다음 장난을\n치러 이미 미술관을 떠났어요"),
        "gameResultMafiaWins": MessageLookupByLibrary.simpleMessage("의 승리에요"),
        "gameResultMafiaWrongDesc":
            MessageLookupByLibrary.simpleMessage(" 키워드를 입력하여\n착한미술가들의 승리네요"),
        "gameResultRetry": MessageLookupByLibrary.simpleMessage("다시하기"),
        "gameResultTimerDesc": m7,
        "gameStart": MessageLookupByLibrary.simpleMessage("시작하기"),
        "gameVotingTitle":
            MessageLookupByLibrary.simpleMessage("악동미술가를 지목해 주세요"),
        "gameWaitingCanStartTip":
            MessageLookupByLibrary.simpleMessage("많이 모일수록 재미도 2배!"),
        "gameWaitingCannotStartTip":
            MessageLookupByLibrary.simpleMessage("게임이 시작되려면 3명 이상 모여야 해요!"),
        "gameWaitingInvite": MessageLookupByLibrary.simpleMessage("초대하기"),
        "gameWaitingInviteMessage": m8,
        "gameWaitingStart": MessageLookupByLibrary.simpleMessage("시작하기"),
        "gameWaitingTitleReady":
            MessageLookupByLibrary.simpleMessage("야호!\n이제 시작할 수 있어요"),
        "gameWaitingTitleWaiting":
            MessageLookupByLibrary.simpleMessage("함께할 미술가들이\n모이고 있어요!"),
        "gameWaitingYouAreHost":
            MessageLookupByLibrary.simpleMessage("방장이 되었어요!"),
        "home": MessageLookupByLibrary.simpleMessage("홈"),
        "homeCreateRoom": MessageLookupByLibrary.simpleMessage("방 만들기"),
        "homeJoinRoom": MessageLookupByLibrary.simpleMessage("참여코드 입력하기"),
        "homeMaxRoom":
            MessageLookupByLibrary.simpleMessage("앗! 인원이 꽉 차서 입장 불가능해요."),
        "homeNoRoom": MessageLookupByLibrary.simpleMessage("존재하지 않는 참여 코드에요."),
        "homeOnboarding1Title": m9,
        "homeOnboarding2Desc": MessageLookupByLibrary.simpleMessage(
            "착한미술가는 키워드를, 악동미술가는 카테고리가 주어져요."),
        "homeOnboarding2Title":
            MessageLookupByLibrary.simpleMessage("1. 역할 배정"),
        "homeOnboarding3Desc": MessageLookupByLibrary.simpleMessage(
            "착한미술가는 키워드를, 악동미술가는 정체를 숨기며 한 획씩 그림을 그려요."),
        "homeOnboarding3Title":
            MessageLookupByLibrary.simpleMessage("2. 그림 그리기"),
        "homeOnboarding4Desc":
            MessageLookupByLibrary.simpleMessage("제한 시간 내에 악동미술가가 누구인지 투표해요."),
        "homeOnboarding4Title": MessageLookupByLibrary.simpleMessage("3. 투표"),
        "homeOnboarding5Desc1": MessageLookupByLibrary.simpleMessage(
            "악동미술가가 키워드를 맞추거나, 지목되지 않으면 악동 미술가의 승리!"),
        "homeOnboarding5Desc2": MessageLookupByLibrary.simpleMessage(
            "악동미술가가 키워드를 맞추지 못하면 착한 미술가의 승리!"),
        "homeOnboarding5Title1":
            MessageLookupByLibrary.simpleMessage("4. 결과 - "),
        "homeOnboarding5Title2": MessageLookupByLibrary.simpleMessage(" 승리"),
        "homeOnboardingRole": MessageLookupByLibrary.simpleMessage("게임 규칙"),
        "homeRejoinRoom": MessageLookupByLibrary.simpleMessage("다시 접속하기"),
        "inviteCodeRequired":
            MessageLookupByLibrary.simpleMessage("초대 코드를 입력해 주세요"),
        "inviteMessage": m10,
        "join": MessageLookupByLibrary.simpleMessage("참여하기"),
        "joinCheckRoomId":
            MessageLookupByLibrary.simpleMessage("참여코드를 확인해 주세요"),
        "joinPaste": MessageLookupByLibrary.simpleMessage("참여코드 붙여넣기"),
        "joinRoom": MessageLookupByLibrary.simpleMessage("방 입장"),
        "joinTitle": MessageLookupByLibrary.simpleMessage("참여코드를 입력하세요"),
        "keyword": MessageLookupByLibrary.simpleMessage("키워드"),
        "keywordRequired":
            MessageLookupByLibrary.simpleMessage("키워드를 입력해 주세요."),
        "languageBottomSheetChanged":
            MessageLookupByLibrary.simpleMessage("변경되었습니다"),
        "leave": MessageLookupByLibrary.simpleMessage("나가기"),
        "left": MessageLookupByLibrary.simpleMessage("나가기"),
        "localDataPageTitle": MessageLookupByLibrary.simpleMessage("로컬 데이터"),
        "loginFailure": MessageLookupByLibrary.simpleMessage("다시 시도해 주세요 🥹"),
        "loginPage": MessageLookupByLibrary.simpleMessage("로그인 페이지"),
        "loginPageTitle":
            MessageLookupByLibrary.simpleMessage("간편 회원가입 후 동료들에게 공유해 보세요!"),
        "loginSuccess": MessageLookupByLibrary.simpleMessage("반가워요 👋"),
        "loginWithAnonymous": MessageLookupByLibrary.simpleMessage("익명 로그인"),
        "loginWithApple": MessageLookupByLibrary.simpleMessage("애플 로그인"),
        "loginWithGoogle": MessageLookupByLibrary.simpleMessage("구글 로그인"),
        "logout": MessageLookupByLibrary.simpleMessage("로그아웃"),
        "logoutDialogTitle": MessageLookupByLibrary.simpleMessage("로그아웃 할까요?"),
        "logoutFailure": MessageLookupByLibrary.simpleMessage("다시 시도해 주세요 🥹"),
        "logoutSuccess": MessageLookupByLibrary.simpleMessage("잘가요 👋"),
        "mafia": MessageLookupByLibrary.simpleMessage("악동미술가"),
        "maintenanceDialogDesc": MessageLookupByLibrary.simpleMessage(
            "We are currently performing maintenance to provide better service. If the work is completed earlier than expected, the service will resume immediately."),
        "me": MessageLookupByLibrary.simpleMessage("나"),
        "myTurn": MessageLookupByLibrary.simpleMessage("내가 그릴 차례입니다."),
        "next": MessageLookupByLibrary.simpleMessage("다음"),
        "nicknameAgreement1": MessageLookupByLibrary.simpleMessage("닉네임 입력 시 "),
        "nicknameAgreement2":
            MessageLookupByLibrary.simpleMessage("에 동의한 것으로 간주합니다."),
        "nicknameHint": MessageLookupByLibrary.simpleMessage("닉네임 입력"),
        "nicknameMax": m11,
        "nicknameRequired":
            MessageLookupByLibrary.simpleMessage("닉네임을 입력해 주세요"),
        "nicknameTitle":
            MessageLookupByLibrary.simpleMessage("반가워요\n닉네임을 입력해 주세요"),
        "notMyTurn": MessageLookupByLibrary.simpleMessage("내 차례가 아니에요"),
        "noticeDialogShowUrl": MessageLookupByLibrary.simpleMessage("자세히 보기"),
        "object": MessageLookupByLibrary.simpleMessage("사물"),
        "ongoingGame": MessageLookupByLibrary.simpleMessage("진행중인 게임이 있어요"),
        "order": MessageLookupByLibrary.simpleMessage("진행 순서"),
        "otherPlayerTurn": m12,
        "playAgain": MessageLookupByLibrary.simpleMessage("다시하기"),
        "playRequirements": MessageLookupByLibrary.simpleMessage(
            "게임을 시작하려면 최소 3명 이상 플레이어가 필요합니다."),
        "players": MessageLookupByLibrary.simpleMessage("참가자 목록"),
        "pleaseCompleteTheSketch":
            MessageLookupByLibrary.simpleMessage("스케치를 완성해 주세요"),
        "resetConfigConfirmDialogTitle":
            MessageLookupByLibrary.simpleMessage("설정을 초기화할까요?"),
        "resetConfigSuccess": MessageLookupByLibrary.simpleMessage("설정 초기화 완료"),
        "roomIsFull": MessageLookupByLibrary.simpleMessage("방이 가득 찼어요"),
        "roomNotFound": MessageLookupByLibrary.simpleMessage("방을 찾을 수 없어요"),
        "sec": m13,
        "settingContactUs": MessageLookupByLibrary.simpleMessage("문의하기"),
        "settingContactUsDoNotDelete":
            MessageLookupByLibrary.simpleMessage("답변을 위해 필요하니 지우지 말아주세요."),
        "settingContactUsPleaseMailTo": m14,
        "settingDark": MessageLookupByLibrary.simpleMessage("다크"),
        "settingLanguage": MessageLookupByLibrary.simpleMessage("언어"),
        "settingLicense": MessageLookupByLibrary.simpleMessage("라이선스"),
        "settingLight": MessageLookupByLibrary.simpleMessage("라이트"),
        "settingTheme": MessageLookupByLibrary.simpleMessage("테마"),
        "settingVersion": MessageLookupByLibrary.simpleMessage("버전 정보"),
        "sketchConfirmDialogTitle":
            MessageLookupByLibrary.simpleMessage("스케치를 완성했나요?"),
        "sketchLoadingMessage":
            MessageLookupByLibrary.simpleMessage("그림을 생성하고 있어요.."),
        "spyWinByAnsweringAction": m15,
        "spyWinByAnsweringResult":
            MessageLookupByLibrary.simpleMessage("스파이 승리! 🎉"),
        "spyWinByMultiCitizenVoted": m16,
        "spyWinBySingleCitizenVoted": m17,
        "spyWinByVotingResult":
            MessageLookupByLibrary.simpleMessage("스파이 승리! 🎉"),
        "startAfter": m18,
        "submit": MessageLookupByLibrary.simpleMessage("제출"),
        "termsOfService": MessageLookupByLibrary.simpleMessage("서비스 이용약관"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("다시 시도해 주세요"),
        "turnLimit": MessageLookupByLibrary.simpleMessage("전체 턴 수"),
        "updateDialogGoToUpdate":
            MessageLookupByLibrary.simpleMessage("업데이트하러 가기"),
        "voteForSpy": MessageLookupByLibrary.simpleMessage("스파이를 지목해 보세요!"),
        "votingSecLimit": MessageLookupByLibrary.simpleMessage("투표 시간"),
        "youAreNotSpy": MessageLookupByLibrary.simpleMessage(
            "당신은 시민입니다.\n스파이에게 키워드를 들키지 않고 시민임을 증명하세요."),
        "youAreSpy": MessageLookupByLibrary.simpleMessage(
            "당신은 스파이입니다.\n다른 플레이어의 그림을 보고 키워드를 맞히세요."),
        "yourOrderIs": m19
      };
}
