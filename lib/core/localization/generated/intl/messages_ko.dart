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

  static String m1(n) => "${n}초";

  static String m2(msg0) => "${msg0} 후 사라져요";

  static String m3(n) => "${n}초 후에 대기방으로 이동합니다";

  static String m4(code, link) =>
      "Trouble Painter 초대\n코드 : [${code}]\n링크 : ${link}";

  static String m5(nickname) => "${nickname}님, 환영해요\n악동미술가를 찾아 미술관을 지켜내세요!";

  static String m6(n) => "최대 ${n}자까지 쓸 수 있어요";

  static String m7(n) => "${n}초";

  static String m8(name) => "${name}로 문의 부탁드려요";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appLicenseOpenSource":
            MessageLookupByLibrary.simpleMessage("오픈소스 라이선스"),
        "appLicenseTotal": m0,
        "appName": MessageLookupByLibrary.simpleMessage("Trouble Painter"),
        "cancel": MessageLookupByLibrary.simpleMessage("취소"),
        "category": MessageLookupByLibrary.simpleMessage("카테고리"),
        "citizen": MessageLookupByLibrary.simpleMessage("착한미술가"),
        "citizens": MessageLookupByLibrary.simpleMessage("착한미술가들"),
        "close": MessageLookupByLibrary.simpleMessage("닫기"),
        "complete": MessageLookupByLibrary.simpleMessage("완료"),
        "components": MessageLookupByLibrary.simpleMessage("컴포넌트"),
        "confirm": MessageLookupByLibrary.simpleMessage("확인"),
        "copied": MessageLookupByLibrary.simpleMessage("복사 완료"),
        "dev": MessageLookupByLibrary.simpleMessage("개발자 메뉴"),
        "devLocalData": MessageLookupByLibrary.simpleMessage("로컬 데이터"),
        "devLog": MessageLookupByLibrary.simpleMessage("로그"),
        "devUiTestMode": MessageLookupByLibrary.simpleMessage("UI 테스트 모드"),
        "devUiTestModeMark":
            MessageLookupByLibrary.simpleMessage("UI 테스트 모드 표시"),
        "editNicknameDesc":
            MessageLookupByLibrary.simpleMessage("최대 7자까지 쓸 수 있어요"),
        "editNicknameHint": MessageLookupByLibrary.simpleMessage("닉네임 입력"),
        "editNicknameTitle":
            MessageLookupByLibrary.simpleMessage("변경할 닉네임을 입력해 주세요"),
        "empty": MessageLookupByLibrary.simpleMessage("비어있음"),
        "exceptionAlreadyPlayingRoom":
            MessageLookupByLibrary.simpleMessage("게임이 진행중인 방에는 참여할 수 없어요"),
        "exceptionCheckNetwork":
            MessageLookupByLibrary.simpleMessage("네트워크 연결 상태를 확인해 주세요"),
        "exceptionNotMyTurn":
            MessageLookupByLibrary.simpleMessage("내 차례가 아니에요"),
        "exceptionOngoingGame":
            MessageLookupByLibrary.simpleMessage("진행중인 게임이 있어요"),
        "gameDrawingInitMsg0": m1,
        "gameDrawingInitMsg1": m2,
        "gameDrawingMyTurn": MessageLookupByLibrary.simpleMessage("내 차례"),
        "gameDrawingNoStrokesLeft":
            MessageLookupByLibrary.simpleMessage("모든 획을 사용했어요."),
        "gameDrawingNotConnected": MessageLookupByLibrary.simpleMessage("외출중"),
        "gameDrawingOtherTurn": MessageLookupByLibrary.simpleMessage("그리는 중"),
        "gameDrawingSingleStrokeGuide":
            MessageLookupByLibrary.simpleMessage("한 획만 그릴 수 있어요"),
        "gameDrawingTurnOverlayTitle":
            MessageLookupByLibrary.simpleMessage("당신의 그리기 순서는?"),
        "gameGuessAiHint": MessageLookupByLibrary.simpleMessage("AI 힌트"),
        "gameGuessAnswer": MessageLookupByLibrary.simpleMessage(""),
        "gameGuessAnswer2": MessageLookupByLibrary.simpleMessage("일까?"),
        "gameGuessCitizenCaption":
            MessageLookupByLibrary.simpleMessage("악동미술가가 키워드를 맞추면 악동미술가의 승리에요"),
        "gameGuessCitizenDescription":
            MessageLookupByLibrary.simpleMessage("악동미술가 키워드 입력중!"),
        "gameGuessCitizenTitle2":
            MessageLookupByLibrary.simpleMessage("를 찾았어요"),
        "gameGuessHint":
            MessageLookupByLibrary.simpleMessage("들켰다! 키워드를 맞추세요!"),
        "gameGuessThinking": MessageLookupByLibrary.simpleMessage("무슨 키워드일까?"),
        "gameInviteBottomSheetDesc": MessageLookupByLibrary.simpleMessage(
            "친구에게 QR 코드를 보여주거나 참여코드를 공유해 보세요"),
        "gameInviteBottomSheetInvitationCode":
            MessageLookupByLibrary.simpleMessage("참여코드"),
        "gameInviteBottomSheetShareLink":
            MessageLookupByLibrary.simpleMessage("참여코드 공유하기"),
        "gameInviteBottomSheetTitle":
            MessageLookupByLibrary.simpleMessage("QR 코드로 입장하기"),
        "gamePagePopTitle": MessageLookupByLibrary.simpleMessage("정말로 나가시겠어요?"),
        "gamePageReconnecting":
            MessageLookupByLibrary.simpleMessage("재접속 중입니다."),
        "gameQuickStartWaitingPageDesc":
            MessageLookupByLibrary.simpleMessage("모집중..."),
        "gameQuickStartWaitingPageTitle":
            MessageLookupByLibrary.simpleMessage("함께할 미술가들을 모으고 있어요."),
        "gameReadyRole1": MessageLookupByLibrary.simpleMessage("당신은"),
        "gameReadyRole2": MessageLookupByLibrary.simpleMessage("입니다"),
        "gameReadyRoleCitizenDescription":
            MessageLookupByLibrary.simpleMessage("키워드를 악동미술가에게 들키지 않게 그리세요!"),
        "gameReadyRoleMafiaDescription": MessageLookupByLibrary.simpleMessage(
            "착한미술가들에게 정체를 들키지 않게 키워드를 추측하여 그리세요!"),
        "gameResultCitizensWin": MessageLookupByLibrary.simpleMessage("의 승리에요"),
        "gameResultMafiaCorrectDesc": MessageLookupByLibrary.simpleMessage(
            "정답을 맞추고 다른 장난을 치러\n이미 미술관을 떠났어요"),
        "gameResultMafiaNotFoundDesc": MessageLookupByLibrary.simpleMessage(
            "악동미술가가 꽁꽁 숨었어요. 악동미술가는 다음 장난을\n치러 이미 미술관을 떠났어요"),
        "gameResultMafiaWins": MessageLookupByLibrary.simpleMessage("의 승리에요"),
        "gameResultMafiaWrongDesc":
            MessageLookupByLibrary.simpleMessage(" 키워드를 입력하여\n착한미술가들의 승리네요"),
        "gameResultRetry": MessageLookupByLibrary.simpleMessage("다시하기"),
        "gameResultTimerDesc": m3,
        "gameResultV2CitizenWin1": MessageLookupByLibrary.simpleMessage("\n\n"),
        "gameResultV2CitizenWin2":
            MessageLookupByLibrary.simpleMessage("\n라고 써서 틀렸어요."),
        "gameResultV2MafiaWin1":
            MessageLookupByLibrary.simpleMessage("악동미술가는\n"),
        "gameResultV2MafiaWin2": MessageLookupByLibrary.simpleMessage("\n입니다."),
        "gameResultV2TimerDesc":
            MessageLookupByLibrary.simpleMessage("후에 대기방으로 이동합니다"),
        "gameResultWin": MessageLookupByLibrary.simpleMessage(" 승리"),
        "gameVotingGuide":
            MessageLookupByLibrary.simpleMessage("악동미술가에게 투표하세요"),
        "gameVotingTitle":
            MessageLookupByLibrary.simpleMessage("악동미술가를 지목해 주세요"),
        "gameWaitingCanStartTip":
            MessageLookupByLibrary.simpleMessage("많이 모일수록 재미도 2배!"),
        "gameWaitingCannotStartTip":
            MessageLookupByLibrary.simpleMessage("게임을 시작하려면 3명 이상 모여야 해요!"),
        "gameWaitingInvite": MessageLookupByLibrary.simpleMessage("초대하기"),
        "gameWaitingInviteMessage": m4,
        "gameWaitingStart": MessageLookupByLibrary.simpleMessage("시작하기"),
        "gameWaitingTitleReady":
            MessageLookupByLibrary.simpleMessage("야호!\n이제 시작할 수 있어요"),
        "gameWaitingTitleWaiting":
            MessageLookupByLibrary.simpleMessage("함께할 미술가들이\n모이고 있어요!"),
        "gameWaitingYouAreHost":
            MessageLookupByLibrary.simpleMessage("방장이 되었어요!"),
        "goToNotificationSettingDialogConfirm":
            MessageLookupByLibrary.simpleMessage("설정으로 이동"),
        "goToNotificationSettingDialogDesc":
            MessageLookupByLibrary.simpleMessage("기기 설정에서 알림 권한을 활성화 해주세요"),
        "goToNotificationSettingDialogTitle":
            MessageLookupByLibrary.simpleMessage("알림 권한이 필요해요"),
        "home": MessageLookupByLibrary.simpleMessage("홈"),
        "homeCreateRoom": MessageLookupByLibrary.simpleMessage("방 만들기"),
        "homeDiscordBubble": MessageLookupByLibrary.simpleMessage("친구 구하기"),
        "homeJoinRoom": MessageLookupByLibrary.simpleMessage("방 입장"),
        "homeJoinRoomWithInvitationCode":
            MessageLookupByLibrary.simpleMessage("참여코드로 입장하기"),
        "homeMaxRoom":
            MessageLookupByLibrary.simpleMessage("앗! 인원이 꽉 차서 입장 불가능해요."),
        "homeNoRoom": MessageLookupByLibrary.simpleMessage("존재하지 않는 참여 코드에요."),
        "homeOnboarding1Title": m5,
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
        "homeRandomQuickStart": MessageLookupByLibrary.simpleMessage("빠른 시작"),
        "homeRejoinRoom": MessageLookupByLibrary.simpleMessage("다시 참여하기"),
        "homeTutorialBubble": MessageLookupByLibrary.simpleMessage("튜토리얼 보러가기"),
        "join": MessageLookupByLibrary.simpleMessage("참여하기"),
        "joinBottomSheetEnterCode":
            MessageLookupByLibrary.simpleMessage("참여코드 입력하기"),
        "joinBottomSheetQrScan":
            MessageLookupByLibrary.simpleMessage("QR 코드 스캔하기"),
        "joinCheckRoomId":
            MessageLookupByLibrary.simpleMessage("참여코드를 확인해 주세요"),
        "joinPaste": MessageLookupByLibrary.simpleMessage("참여코드 붙여넣기"),
        "joinQrPageFailure": MessageLookupByLibrary.simpleMessage("인식 실패"),
        "joinQrPageGoToSetting":
            MessageLookupByLibrary.simpleMessage("설정으로 이동"),
        "joinQrPagePermissionRequired":
            MessageLookupByLibrary.simpleMessage("설정에서 카메라 권한을 활성화 해주세요."),
        "joinTitle": MessageLookupByLibrary.simpleMessage("참여코드를 입력하세요"),
        "keyword": MessageLookupByLibrary.simpleMessage("키워드"),
        "languageBottomSheetChanged":
            MessageLookupByLibrary.simpleMessage("변경되었어요"),
        "leave": MessageLookupByLibrary.simpleMessage("나가기"),
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
            "더 나은 서비스를 제공하기 위해 서비스 점검을 진행하고 있습니다. 작업이 예상보다 일찍 완료되는 경우 서비스를 즉시 재개할 예정입니다"),
        "me": MessageLookupByLibrary.simpleMessage("나"),
        "nicknameAgreement1": MessageLookupByLibrary.simpleMessage("닉네임 입력 시 "),
        "nicknameAgreement2":
            MessageLookupByLibrary.simpleMessage("에 동의한 것으로 간주합니다."),
        "nicknameHint": MessageLookupByLibrary.simpleMessage("닉네임 입력"),
        "nicknameMax": m6,
        "nicknameRequired":
            MessageLookupByLibrary.simpleMessage("닉네임을 입력해 주세요"),
        "nicknameTitle":
            MessageLookupByLibrary.simpleMessage("반가워요\n닉네임을 입력해 주세요"),
        "noticeDialogShowUrl": MessageLookupByLibrary.simpleMessage("자세히 보기"),
        "onboarding1Desc": MessageLookupByLibrary.simpleMessage(
            "착한미술가는 키워드를, 악동미술가는 카테고리가 주어져요."),
        "onboarding1Title": MessageLookupByLibrary.simpleMessage("역할 배정"),
        "onboarding2Desc": MessageLookupByLibrary.simpleMessage(
            "착한미술가는 키워드를, 악동미술가는 정체를 숨기며 한 획씩 그림을 그려요."),
        "onboarding2Title": MessageLookupByLibrary.simpleMessage("그림 그리기"),
        "onboarding3Desc":
            MessageLookupByLibrary.simpleMessage("제한 시간 내에 악동미술가가 누구인지 투표해요."),
        "onboarding3Title": MessageLookupByLibrary.simpleMessage("투표"),
        "onboarding4Desc1": MessageLookupByLibrary.simpleMessage(
            "악동미술가가 키워드를 맞추거나, 지목되지 않으면 악동 미술가의 승리!"),
        "onboarding4Desc2": MessageLookupByLibrary.simpleMessage(
            "악동미술가가 키워드를 맞추지 못하면 착한 미술가의 승리!"),
        "onboarding4Title1": MessageLookupByLibrary.simpleMessage("결과 - "),
        "onboarding4Title2": MessageLookupByLibrary.simpleMessage(" 승리"),
        "onboardingTitle": MessageLookupByLibrary.simpleMessage("게임방법"),
        "quickStartNotiPermissionConfirm":
            MessageLookupByLibrary.simpleMessage("알림 받기"),
        "quickStartNotiPermissionContent": MessageLookupByLibrary.simpleMessage(
            "빠른 시작을 기다리는 유저가 있을 때 알림을 받으실래요?"),
        "quickStartNotiPermissionFailure":
            MessageLookupByLibrary.simpleMessage("설정 → 빠른 시작 알림에서 다시 시도해 주세요"),
        "quickStartNotiPermissionTitle":
            MessageLookupByLibrary.simpleMessage("빠른 시작 알림 수신"),
        "quickStartNotiPermissionUnauthorized":
            MessageLookupByLibrary.simpleMessage("알림을 받으려면 권한이 필요해요."),
        "resetConfigConfirmDialogTitle":
            MessageLookupByLibrary.simpleMessage("설정을 초기화할까요?"),
        "resetConfigSuccess": MessageLookupByLibrary.simpleMessage("설정 초기화 완료"),
        "sec": m7,
        "setting": MessageLookupByLibrary.simpleMessage("설정"),
        "settingAbout": MessageLookupByLibrary.simpleMessage("서비스 정보"),
        "settingCommunity": MessageLookupByLibrary.simpleMessage("커뮤니티"),
        "settingContact": MessageLookupByLibrary.simpleMessage("문의"),
        "settingContactUs": MessageLookupByLibrary.simpleMessage("문의하기"),
        "settingContactUsDoNotDelete":
            MessageLookupByLibrary.simpleMessage("답변을 위해 필요하니 지우지 말아주세요."),
        "settingContactUsPleaseMailTo": m8,
        "settingDark": MessageLookupByLibrary.simpleMessage("다크"),
        "settingDevelopment": MessageLookupByLibrary.simpleMessage("개발"),
        "settingDiscord": MessageLookupByLibrary.simpleMessage("디스코드"),
        "settingGameConfigure": MessageLookupByLibrary.simpleMessage("게임 설정"),
        "settingInstagram": MessageLookupByLibrary.simpleMessage("인스타그램"),
        "settingLanguage": MessageLookupByLibrary.simpleMessage("언어"),
        "settingLicense": MessageLookupByLibrary.simpleMessage("라이선스"),
        "settingLight": MessageLookupByLibrary.simpleMessage("라이트"),
        "settingNotice": MessageLookupByLibrary.simpleMessage("공지사항"),
        "settingQuickStartNotification":
            MessageLookupByLibrary.simpleMessage("빠른 게임 알림"),
        "settingQuickStartNotificationDisabled":
            MessageLookupByLibrary.simpleMessage("알림 비활성화"),
        "settingQuickStartNotificationEnalbed":
            MessageLookupByLibrary.simpleMessage(
                "빠른 게임을 기다리는 유저가 있을 때 알림을 보내줄게요!"),
        "settingSuggestKeywords":
            MessageLookupByLibrary.simpleMessage("키워드 제안하기"),
        "settingTheme": MessageLookupByLibrary.simpleMessage("테마"),
        "settingVersion": MessageLookupByLibrary.simpleMessage("버전 정보"),
        "termsOfService": MessageLookupByLibrary.simpleMessage("서비스 이용약관"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("다시 시도해 주세요"),
        "updateDialogGoToUpdate":
            MessageLookupByLibrary.simpleMessage("업데이트하러 가기")
      };
}
