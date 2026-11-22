// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Trouble Painter`
  String get appName {
    return Intl.message('Trouble Painter', name: 'appName', desc: '', args: []);
  }

  /// `복사 완료`
  String get copied {
    return Intl.message('복사 완료', name: 'copied', desc: '', args: []);
  }

  /// `나`
  String get me {
    return Intl.message('나', name: 'me', desc: '', args: []);
  }

  /// `비어있음`
  String get empty {
    return Intl.message('비어있음', name: 'empty', desc: '', args: []);
  }

  /// `카테고리`
  String get category {
    return Intl.message('카테고리', name: 'category', desc: '', args: []);
  }

  /// `키워드`
  String get keyword {
    return Intl.message('키워드', name: 'keyword', desc: '', args: []);
  }

  /// `나가기`
  String get leave {
    return Intl.message('나가기', name: 'leave', desc: '', args: []);
  }

  /// `착한미술가`
  String get citizen {
    return Intl.message('착한미술가', name: 'citizen', desc: '', args: []);
  }

  /// `악동미술가`
  String get mafia {
    return Intl.message('악동미술가', name: 'mafia', desc: '', args: []);
  }

  /// `완료`
  String get complete {
    return Intl.message('완료', name: 'complete', desc: '', args: []);
  }

  /// `서비스 이용약관`
  String get termsOfService {
    return Intl.message('서비스 이용약관', name: 'termsOfService', desc: '', args: []);
  }

  /// `다시 시도해 주세요`
  String get tryAgain {
    return Intl.message('다시 시도해 주세요', name: 'tryAgain', desc: '', args: []);
  }

  /// `닫기`
  String get close {
    return Intl.message('닫기', name: 'close', desc: '', args: []);
  }

  /// `네트워크 연결 상태를 확인해 주세요`
  String get exceptionCheckNetwork {
    return Intl.message(
      '네트워크 연결 상태를 확인해 주세요',
      name: 'exceptionCheckNetwork',
      desc: '',
      args: [],
    );
  }

  /// `내 차례가 아니에요`
  String get exceptionNotMyTurn {
    return Intl.message(
      '내 차례가 아니에요',
      name: 'exceptionNotMyTurn',
      desc: '',
      args: [],
    );
  }

  /// `진행 중인 게임이 끝나야 다른 방에 들어갈 수 있어요. 다시 참여하기로 돌아갈 수 있어요`
  String get exceptionOngoingGame {
    return Intl.message(
      '진행 중인 게임이 끝나야 다른 방에 들어갈 수 있어요. 다시 참여하기로 돌아갈 수 있어요',
      name: 'exceptionOngoingGame',
      desc: '',
      args: [],
    );
  }

  /// `게임이 진행중인 방에는 참여할 수 없어요`
  String get exceptionAlreadyPlayingRoom {
    return Intl.message(
      '게임이 진행중인 방에는 참여할 수 없어요',
      name: 'exceptionAlreadyPlayingRoom',
      desc: '',
      args: [],
    );
  }

  /// `참여 중인 방이 없어요`
  String get exceptionNotInRoom {
    return Intl.message(
      '참여 중인 방이 없어요',
      name: 'exceptionNotInRoom',
      desc: '',
      args: [],
    );
  }

  /// `방장만 할 수 있어요`
  String get exceptionNotHost {
    return Intl.message(
      '방장만 할 수 있어요',
      name: 'exceptionNotHost',
      desc: '',
      args: [],
    );
  }

  /// `인원이 부족해서 시작할 수 없어요`
  String get exceptionNotEnoughPlayers {
    return Intl.message(
      '인원이 부족해서 시작할 수 없어요',
      name: 'exceptionNotEnoughPlayers',
      desc: '',
      args: [],
    );
  }

  /// `아직 준비하지 않은 사람이 있어요`
  String get exceptionNotAllReady {
    return Intl.message(
      '아직 준비하지 않은 사람이 있어요',
      name: 'exceptionNotAllReady',
      desc: '',
      args: [],
    );
  }

  /// `지금은 할 수 없어요`
  String get exceptionInvalidPhase {
    return Intl.message(
      '지금은 할 수 없어요',
      name: 'exceptionInvalidPhase',
      desc: '',
      args: [],
    );
  }

  /// `다른 기기에서 접속해서 연결이 끊겼어요`
  String get exceptionReplaced {
    return Intl.message(
      '다른 기기에서 접속해서 연결이 끊겼어요',
      name: 'exceptionReplaced',
      desc: '',
      args: [],
    );
  }

  /// `요청이 너무 많아서 연결이 끊겼어요. 잠시 후 다시 시도해 주세요`
  String get exceptionRateLimited {
    return Intl.message(
      '요청이 너무 많아서 연결이 끊겼어요. 잠시 후 다시 시도해 주세요',
      name: 'exceptionRateLimited',
      desc: '',
      args: [],
    );
  }

  /// `반가워요\n닉네임을 입력해 주세요`
  String get nicknameTitle {
    return Intl.message(
      '반가워요\n닉네임을 입력해 주세요',
      name: 'nicknameTitle',
      desc: '',
      args: [],
    );
  }

  /// `최대 {n}자까지 쓸 수 있어요`
  String nicknameMax(Object n) {
    return Intl.message(
      '최대 $n자까지 쓸 수 있어요',
      name: 'nicknameMax',
      desc: '',
      args: [n],
    );
  }

  /// `닉네임을 입력해 주세요`
  String get nicknameRequired {
    return Intl.message(
      '닉네임을 입력해 주세요',
      name: 'nicknameRequired',
      desc: '',
      args: [],
    );
  }

  /// `닉네임 입력`
  String get nicknameHint {
    return Intl.message('닉네임 입력', name: 'nicknameHint', desc: '', args: []);
  }

  /// `닉네임 입력 시 `
  String get nicknameAgreement1 {
    return Intl.message(
      '닉네임 입력 시 ',
      name: 'nicknameAgreement1',
      desc: '',
      args: [],
    );
  }

  /// `에 동의한 것으로 간주합니다.`
  String get nicknameAgreement2 {
    return Intl.message(
      '에 동의한 것으로 간주합니다.',
      name: 'nicknameAgreement2',
      desc: '',
      args: [],
    );
  }

  /// `업데이트하러 가기`
  String get updateDialogGoToUpdate {
    return Intl.message(
      '업데이트하러 가기',
      name: 'updateDialogGoToUpdate',
      desc: '',
      args: [],
    );
  }

  /// `자세히 보기`
  String get noticeDialogShowUrl {
    return Intl.message(
      '자세히 보기',
      name: 'noticeDialogShowUrl',
      desc: '',
      args: [],
    );
  }

  /// `더 나은 서비스를 제공하기 위해 서비스 점검을 진행하고 있습니다. 작업이 예상보다 일찍 완료되는 경우 서비스를 즉시 재개할 예정입니다`
  String get maintenanceDialogDesc {
    return Intl.message(
      '더 나은 서비스를 제공하기 위해 서비스 점검을 진행하고 있습니다. 작업이 예상보다 일찍 완료되는 경우 서비스를 즉시 재개할 예정입니다',
      name: 'maintenanceDialogDesc',
      desc: '',
      args: [],
    );
  }

  /// `홈`
  String get home {
    return Intl.message('홈', name: 'home', desc: '', args: []);
  }

  /// `방 만들기`
  String get homeCreateRoom {
    return Intl.message('방 만들기', name: 'homeCreateRoom', desc: '', args: []);
  }

  /// `방 입장`
  String get homeJoinRoom {
    return Intl.message('방 입장', name: 'homeJoinRoom', desc: '', args: []);
  }

  /// `참여코드로 입장하기`
  String get homeJoinRoomWithInvitationCode {
    return Intl.message(
      '참여코드로 입장하기',
      name: 'homeJoinRoomWithInvitationCode',
      desc: '',
      args: [],
    );
  }

  /// `게임 방법`
  String get homeTutorial {
    return Intl.message('게임 방법', name: 'homeTutorial', desc: '', args: []);
  }

  /// `빠른 시작`
  String get homeRandomQuickStart {
    return Intl.message(
      '빠른 시작',
      name: 'homeRandomQuickStart',
      desc: '',
      args: [],
    );
  }

  /// `다시 참여하기`
  String get homeRejoinRoom {
    return Intl.message('다시 참여하기', name: 'homeRejoinRoom', desc: '', args: []);
  }

  /// `존재하지 않는 참여 코드에요.`
  String get homeNoRoom {
    return Intl.message(
      '존재하지 않는 참여 코드에요.',
      name: 'homeNoRoom',
      desc: '',
      args: [],
    );
  }

  /// `앗! 인원이 꽉 차서 입장 불가능해요.`
  String get homeMaxRoom {
    return Intl.message(
      '앗! 인원이 꽉 차서 입장 불가능해요.',
      name: 'homeMaxRoom',
      desc: '',
      args: [],
    );
  }

  /// `게임 규칙`
  String get homeOnboardingRole {
    return Intl.message(
      '게임 규칙',
      name: 'homeOnboardingRole',
      desc: '',
      args: [],
    );
  }

  /// `{nickname}님, 환영해요\n악동미술가를 찾아 미술관을 지켜내세요!`
  String homeOnboarding1Title(Object nickname) {
    return Intl.message(
      '$nickname님, 환영해요\n악동미술가를 찾아 미술관을 지켜내세요!',
      name: 'homeOnboarding1Title',
      desc: '',
      args: [nickname],
    );
  }

  /// `1. 역할 배정`
  String get homeOnboarding2Title {
    return Intl.message(
      '1. 역할 배정',
      name: 'homeOnboarding2Title',
      desc: '',
      args: [],
    );
  }

  /// `착한미술가는 키워드를, 악동미술가는 카테고리가 주어져요.`
  String get homeOnboarding2Desc {
    return Intl.message(
      '착한미술가는 키워드를, 악동미술가는 카테고리가 주어져요.',
      name: 'homeOnboarding2Desc',
      desc: '',
      args: [],
    );
  }

  /// `2. 그림 그리기`
  String get homeOnboarding3Title {
    return Intl.message(
      '2. 그림 그리기',
      name: 'homeOnboarding3Title',
      desc: '',
      args: [],
    );
  }

  /// `착한미술가는 키워드를, 악동미술가는 정체를 숨기며 한 획씩 그림을 그려요.`
  String get homeOnboarding3Desc {
    return Intl.message(
      '착한미술가는 키워드를, 악동미술가는 정체를 숨기며 한 획씩 그림을 그려요.',
      name: 'homeOnboarding3Desc',
      desc: '',
      args: [],
    );
  }

  /// `3. 투표`
  String get homeOnboarding4Title {
    return Intl.message(
      '3. 투표',
      name: 'homeOnboarding4Title',
      desc: '',
      args: [],
    );
  }

  /// `제한 시간 내에 악동미술가가 누구인지 투표해요.`
  String get homeOnboarding4Desc {
    return Intl.message(
      '제한 시간 내에 악동미술가가 누구인지 투표해요.',
      name: 'homeOnboarding4Desc',
      desc: '',
      args: [],
    );
  }

  /// `4. 결과 - `
  String get homeOnboarding5Title1 {
    return Intl.message(
      '4. 결과 - ',
      name: 'homeOnboarding5Title1',
      desc: '',
      args: [],
    );
  }

  /// ` 승리`
  String get homeOnboarding5Title2 {
    return Intl.message(
      ' 승리',
      name: 'homeOnboarding5Title2',
      desc: '',
      args: [],
    );
  }

  /// `악동미술가가 키워드를 맞추거나, 지목되지 않으면 악동 미술가의 승리!`
  String get homeOnboarding5Desc1 {
    return Intl.message(
      '악동미술가가 키워드를 맞추거나, 지목되지 않으면 악동 미술가의 승리!',
      name: 'homeOnboarding5Desc1',
      desc: '',
      args: [],
    );
  }

  /// `악동미술가가 키워드를 맞추지 못하면 착한 미술가의 승리!`
  String get homeOnboarding5Desc2 {
    return Intl.message(
      '악동미술가가 키워드를 맞추지 못하면 착한 미술가의 승리!',
      name: 'homeOnboarding5Desc2',
      desc: '',
      args: [],
    );
  }

  /// `빠른 시작 알림 수신`
  String get quickStartNotiPermissionTitle {
    return Intl.message(
      '빠른 시작 알림 수신',
      name: 'quickStartNotiPermissionTitle',
      desc: '',
      args: [],
    );
  }

  /// `게임이 시작되거나 빠른 게임을 기다리는 유저가 있을 때 알림을 받으실래요?`
  String get quickStartNotiPermissionContent {
    return Intl.message(
      '게임이 시작되거나 빠른 게임을 기다리는 유저가 있을 때 알림을 받으실래요?',
      name: 'quickStartNotiPermissionContent',
      desc: '',
      args: [],
    );
  }

  /// `알림 받기`
  String get quickStartNotiPermissionConfirm {
    return Intl.message(
      '알림 받기',
      name: 'quickStartNotiPermissionConfirm',
      desc: '',
      args: [],
    );
  }

  /// `설정 → 빠른 시작 알림에서 다시 시도해 주세요`
  String get quickStartNotiPermissionFailure {
    return Intl.message(
      '설정 → 빠른 시작 알림에서 다시 시도해 주세요',
      name: 'quickStartNotiPermissionFailure',
      desc: '',
      args: [],
    );
  }

  /// `알림을 받으려면 권한이 필요해요.`
  String get quickStartNotiPermissionUnauthorized {
    return Intl.message(
      '알림을 받으려면 권한이 필요해요.',
      name: 'quickStartNotiPermissionUnauthorized',
      desc: '',
      args: [],
    );
  }

  /// `게임방법`
  String get onboardingTitle {
    return Intl.message('게임방법', name: 'onboardingTitle', desc: '', args: []);
  }

  /// `역할 배정`
  String get onboarding1Title {
    return Intl.message('역할 배정', name: 'onboarding1Title', desc: '', args: []);
  }

  /// `착한미술가는 키워드를, 악동미술가는 카테고리가 주어져요.`
  String get onboarding1Desc {
    return Intl.message(
      '착한미술가는 키워드를, 악동미술가는 카테고리가 주어져요.',
      name: 'onboarding1Desc',
      desc: '',
      args: [],
    );
  }

  /// `그림 그리기`
  String get onboarding2Title {
    return Intl.message('그림 그리기', name: 'onboarding2Title', desc: '', args: []);
  }

  /// `착한미술가는 키워드를, 악동미술가는 정체를 숨기며 한 획씩 그림을 그려요.`
  String get onboarding2Desc {
    return Intl.message(
      '착한미술가는 키워드를, 악동미술가는 정체를 숨기며 한 획씩 그림을 그려요.',
      name: 'onboarding2Desc',
      desc: '',
      args: [],
    );
  }

  /// `투표`
  String get onboarding3Title {
    return Intl.message('투표', name: 'onboarding3Title', desc: '', args: []);
  }

  /// `제한 시간 내에 악동미술가가 누구인지 투표해요.`
  String get onboarding3Desc {
    return Intl.message(
      '제한 시간 내에 악동미술가가 누구인지 투표해요.',
      name: 'onboarding3Desc',
      desc: '',
      args: [],
    );
  }

  /// `결과 - `
  String get onboarding4Title1 {
    return Intl.message('결과 - ', name: 'onboarding4Title1', desc: '', args: []);
  }

  /// ` 승리`
  String get onboarding4Title2 {
    return Intl.message(' 승리', name: 'onboarding4Title2', desc: '', args: []);
  }

  /// `악동미술가가 키워드를 맞추거나, 지목되지 않으면 악동 미술가의 승리!`
  String get onboarding4Desc1 {
    return Intl.message(
      '악동미술가가 키워드를 맞추거나, 지목되지 않으면 악동 미술가의 승리!',
      name: 'onboarding4Desc1',
      desc: '',
      args: [],
    );
  }

  /// `악동미술가가 키워드를 맞추지 못하면 착한 미술가의 승리!`
  String get onboarding4Desc2 {
    return Intl.message(
      '악동미술가가 키워드를 맞추지 못하면 착한 미술가의 승리!',
      name: 'onboarding4Desc2',
      desc: '',
      args: [],
    );
  }

  /// `QR 코드 스캔하기`
  String get joinBottomSheetQrScan {
    return Intl.message(
      'QR 코드 스캔하기',
      name: 'joinBottomSheetQrScan',
      desc: '',
      args: [],
    );
  }

  /// `참여코드 입력하기`
  String get joinBottomSheetEnterCode {
    return Intl.message(
      '참여코드 입력하기',
      name: 'joinBottomSheetEnterCode',
      desc: '',
      args: [],
    );
  }

  /// `참여하기`
  String get join {
    return Intl.message('참여하기', name: 'join', desc: '', args: []);
  }

  /// `참여코드를 입력하세요`
  String get joinTitle {
    return Intl.message('참여코드를 입력하세요', name: 'joinTitle', desc: '', args: []);
  }

  /// `참여코드 붙여넣기`
  String get joinPaste {
    return Intl.message('참여코드 붙여넣기', name: 'joinPaste', desc: '', args: []);
  }

  /// `참여코드를 확인해 주세요`
  String get joinCheckRoomId {
    return Intl.message(
      '참여코드를 확인해 주세요',
      name: 'joinCheckRoomId',
      desc: '',
      args: [],
    );
  }

  /// `영어와 숫자만 입력할 수 있어요`
  String get joinInvalidCharacters {
    return Intl.message(
      '영어와 숫자만 입력할 수 있어요',
      name: 'joinInvalidCharacters',
      desc: '',
      args: [],
    );
  }

  /// `설정으로 이동`
  String get joinQrPageGoToSetting {
    return Intl.message(
      '설정으로 이동',
      name: 'joinQrPageGoToSetting',
      desc: '',
      args: [],
    );
  }

  /// `인식 실패`
  String get joinQrPageFailure {
    return Intl.message('인식 실패', name: 'joinQrPageFailure', desc: '', args: []);
  }

  /// `설정에서 카메라 권한을 활성화 해주세요.`
  String get joinQrPagePermissionRequired {
    return Intl.message(
      '설정에서 카메라 권한을 활성화 해주세요.',
      name: 'joinQrPagePermissionRequired',
      desc: '',
      args: [],
    );
  }

  /// `로그인 페이지`
  String get loginPage {
    return Intl.message('로그인 페이지', name: 'loginPage', desc: '', args: []);
  }

  /// `간편 회원가입 후 동료들에게 공유해 보세요!`
  String get loginPageTitle {
    return Intl.message(
      '간편 회원가입 후 동료들에게 공유해 보세요!',
      name: 'loginPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `구글 로그인`
  String get loginWithGoogle {
    return Intl.message('구글 로그인', name: 'loginWithGoogle', desc: '', args: []);
  }

  /// `애플 로그인`
  String get loginWithApple {
    return Intl.message('애플 로그인', name: 'loginWithApple', desc: '', args: []);
  }

  /// `익명 로그인`
  String get loginWithAnonymous {
    return Intl.message(
      '익명 로그인',
      name: 'loginWithAnonymous',
      desc: '',
      args: [],
    );
  }

  /// `반가워요 👋`
  String get loginSuccess {
    return Intl.message('반가워요 👋', name: 'loginSuccess', desc: '', args: []);
  }

  /// `다시 시도해 주세요 🥹`
  String get loginFailure {
    return Intl.message(
      '다시 시도해 주세요 🥹',
      name: 'loginFailure',
      desc: '',
      args: [],
    );
  }

  /// `로그아웃 할까요?`
  String get logoutDialogTitle {
    return Intl.message(
      '로그아웃 할까요?',
      name: 'logoutDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `로그아웃`
  String get logout {
    return Intl.message('로그아웃', name: 'logout', desc: '', args: []);
  }

  /// `잘가요 👋`
  String get logoutSuccess {
    return Intl.message('잘가요 👋', name: 'logoutSuccess', desc: '', args: []);
  }

  /// `다시 시도해 주세요 🥹`
  String get logoutFailure {
    return Intl.message(
      '다시 시도해 주세요 🥹',
      name: 'logoutFailure',
      desc: '',
      args: [],
    );
  }

  /// `정말로 나가시겠어요?`
  String get gamePagePopTitle {
    return Intl.message(
      '정말로 나가시겠어요?',
      name: 'gamePagePopTitle',
      desc: '',
      args: [],
    );
  }

  /// `재접속 중입니다.`
  String get gamePageReconnecting {
    return Intl.message(
      '재접속 중입니다.',
      name: 'gamePageReconnecting',
      desc: '',
      args: [],
    );
  }

  /// `함께할 미술가들을 모으고 있어요.`
  String get gameQuickStartWaitingPageTitle {
    return Intl.message(
      '함께할 미술가들을 모으고 있어요.',
      name: 'gameQuickStartWaitingPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `{n}회`
  String gameQuickStartWaitingMiniGameClicks(Object n) {
    return Intl.message(
      '$n회',
      name: 'gameQuickStartWaitingMiniGameClicks',
      desc: '',
      args: [n],
    );
  }

  /// `대기시간`
  String get gameQuickStartWaitingTimer {
    return Intl.message(
      '대기시간',
      name: 'gameQuickStartWaitingTimer',
      desc: '',
      args: [],
    );
  }

  /// `현재 대기 인원 {n}명`
  String gameQuickStartWaitingCount(Object n) {
    return Intl.message(
      '현재 대기 인원 $n명',
      name: 'gameQuickStartWaitingCount',
      desc: '',
      args: [n],
    );
  }

  /// `매칭됐어요!`
  String get gameMatchFoundTitle {
    return Intl.message(
      '매칭됐어요!',
      name: 'gameMatchFoundTitle',
      desc: '',
      args: [],
    );
  }

  /// `매칭 됐어요. 준비해 주세요!`
  String get gameMatchReadySubtitle {
    return Intl.message(
      '매칭 됐어요. 준비해 주세요!',
      name: 'gameMatchReadySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `준비`
  String get gameMatchAccept {
    return Intl.message('준비', name: 'gameMatchAccept', desc: '', args: []);
  }

  /// `준비 완료`
  String get gameMatchAccepted {
    return Intl.message('준비 완료', name: 'gameMatchAccepted', desc: '', args: []);
  }

  /// `시간 안에 준비하지 않아 매칭에서 제외됐어요.`
  String get gameMatchDeclinedToast {
    return Intl.message(
      '시간 안에 준비하지 않아 매칭에서 제외됐어요.',
      name: 'gameMatchDeclinedToast',
      desc: '',
      args: [],
    );
  }

  /// `함께할 미술가들이\n모이고 있어요!`
  String get gameWaitingTitleWaiting {
    return Intl.message(
      '함께할 미술가들이\n모이고 있어요!',
      name: 'gameWaitingTitleWaiting',
      desc: '',
      args: [],
    );
  }

  /// `야호!\n이제 시작할 수 있어요`
  String get gameWaitingTitleReady {
    return Intl.message(
      '야호!\n이제 시작할 수 있어요',
      name: 'gameWaitingTitleReady',
      desc: '',
      args: [],
    );
  }

  /// `게임을 시작하려면 3명 이상 모여야 해요!`
  String get gameWaitingCannotStartTip {
    return Intl.message(
      '게임을 시작하려면 3명 이상 모여야 해요!',
      name: 'gameWaitingCannotStartTip',
      desc: '',
      args: [],
    );
  }

  /// `많이 모일수록 재미도 2배!`
  String get gameWaitingCanStartTip {
    return Intl.message(
      '많이 모일수록 재미도 2배!',
      name: 'gameWaitingCanStartTip',
      desc: '',
      args: [],
    );
  }

  /// `시작하기`
  String get gameWaitingStart {
    return Intl.message('시작하기', name: 'gameWaitingStart', desc: '', args: []);
  }

  /// `준비`
  String get gameWaitingReady {
    return Intl.message('준비', name: 'gameWaitingReady', desc: '', args: []);
  }

  /// `준비 취소`
  String get gameWaitingReadyCancel {
    return Intl.message(
      '준비 취소',
      name: 'gameWaitingReadyCancel',
      desc: '',
      args: [],
    );
  }

  /// `모두 준비하면 시작할 수 있어요!`
  String get gameWaitingWaitReadyTip {
    return Intl.message(
      '모두 준비하면 시작할 수 있어요!',
      name: 'gameWaitingWaitReadyTip',
      desc: '',
      args: [],
    );
  }

  /// `초대하기`
  String get gameWaitingInvite {
    return Intl.message('초대하기', name: 'gameWaitingInvite', desc: '', args: []);
  }

  /// `Trouble Painter 초대\n코드 : [{code}]\n링크 : {link}`
  String gameWaitingInviteMessage(Object code, Object link) {
    return Intl.message(
      'Trouble Painter 초대\n코드 : [$code]\n링크 : $link',
      name: 'gameWaitingInviteMessage',
      desc: '',
      args: [code, link],
    );
  }

  /// `방장이 되었어요!`
  String get gameWaitingYouAreHost {
    return Intl.message(
      '방장이 되었어요!',
      name: 'gameWaitingYouAreHost',
      desc: '',
      args: [],
    );
  }

  /// `{n}획`
  String gameRuleStrokes(Object n) {
    return Intl.message('$n획', name: 'gameRuleStrokes', desc: '', args: [n]);
  }

  /// `무제한`
  String get gameRuleUnlimitedStrokes {
    return Intl.message(
      '무제한',
      name: 'gameRuleUnlimitedStrokes',
      desc: '',
      args: [],
    );
  }

  /// `모든 카테고리`
  String get gameRuleAllCategories {
    return Intl.message(
      '모든 카테고리',
      name: 'gameRuleAllCategories',
      desc: '',
      args: [],
    );
  }

  /// `{nickname}님을 강퇴할까요?`
  String gameKickTitle(Object nickname) {
    return Intl.message(
      '$nickname님을 강퇴할까요?',
      name: 'gameKickTitle',
      desc: '',
      args: [nickname],
    );
  }

  /// `강퇴`
  String get gameKick {
    return Intl.message('강퇴', name: 'gameKick', desc: '', args: []);
  }

  /// `방장에 의해 방에서 나가게 되었어요.`
  String get gameKickedTitle {
    return Intl.message(
      '방장에 의해 방에서 나가게 되었어요.',
      name: 'gameKickedTitle',
      desc: '',
      args: [],
    );
  }

  /// `방장만 변경할 수 있어요.`
  String get gameRuleHostOnlyToast {
    return Intl.message(
      '방장만 변경할 수 있어요.',
      name: 'gameRuleHostOnlyToast',
      desc: '',
      args: [],
    );
  }

  /// `카테고리 {n}개`
  String gameRuleCategoryCount(Object n) {
    return Intl.message(
      '카테고리 $n개',
      name: 'gameRuleCategoryCount',
      desc: '',
      args: [n],
    );
  }

  /// `방 설정`
  String get gameRuleBottomSheetTitle {
    return Intl.message(
      '방 설정',
      name: 'gameRuleBottomSheetTitle',
      desc: '',
      args: [],
    );
  }

  /// `획 수`
  String get gameRuleBottomSheetStrokes {
    return Intl.message(
      '획 수',
      name: 'gameRuleBottomSheetStrokes',
      desc: '',
      args: [],
    );
  }

  /// `키워드 언어`
  String get gameRuleBottomSheetKeywordLanguage {
    return Intl.message(
      '키워드 언어',
      name: 'gameRuleBottomSheetKeywordLanguage',
      desc: '',
      args: [],
    );
  }

  /// `키워드 카테고리`
  String get gameRuleBottomSheetCategory {
    return Intl.message(
      '키워드 카테고리',
      name: 'gameRuleBottomSheetCategory',
      desc: '',
      args: [],
    );
  }

  /// `기본 설정으로 변경`
  String get gameRuleBottomSheetResetToast {
    return Intl.message(
      '기본 설정으로 변경',
      name: 'gameRuleBottomSheetResetToast',
      desc: '',
      args: [],
    );
  }

  /// `QR 코드로 입장하기`
  String get gameInviteBottomSheetTitle {
    return Intl.message(
      'QR 코드로 입장하기',
      name: 'gameInviteBottomSheetTitle',
      desc: '',
      args: [],
    );
  }

  /// `친구에게 QR 코드를 보여주거나 참여코드를 공유해 보세요`
  String get gameInviteBottomSheetDesc {
    return Intl.message(
      '친구에게 QR 코드를 보여주거나 참여코드를 공유해 보세요',
      name: 'gameInviteBottomSheetDesc',
      desc: '',
      args: [],
    );
  }

  /// `참여코드`
  String get gameInviteBottomSheetInvitationCode {
    return Intl.message(
      '참여코드',
      name: 'gameInviteBottomSheetInvitationCode',
      desc: '',
      args: [],
    );
  }

  /// `참여코드 공유하기`
  String get gameInviteBottomSheetShareLink {
    return Intl.message(
      '참여코드 공유하기',
      name: 'gameInviteBottomSheetShareLink',
      desc: '',
      args: [],
    );
  }

  /// `당신은`
  String get gameReadyRole1 {
    return Intl.message('당신은', name: 'gameReadyRole1', desc: '', args: []);
  }

  /// `입니다`
  String get gameReadyRole2 {
    return Intl.message('입니다', name: 'gameReadyRole2', desc: '', args: []);
  }

  /// `키워드를 악동미술가에게 들키지 않게 그리세요!`
  String get gameReadyRoleCitizenDescription {
    return Intl.message(
      '키워드를 악동미술가에게 들키지 않게 그리세요!',
      name: 'gameReadyRoleCitizenDescription',
      desc: '',
      args: [],
    );
  }

  /// `착한미술가들에게 정체를 들키지 않게 키워드를 추측하여 그리세요!`
  String get gameReadyRoleMafiaDescription {
    return Intl.message(
      '착한미술가들에게 정체를 들키지 않게 키워드를 추측하여 그리세요!',
      name: 'gameReadyRoleMafiaDescription',
      desc: '',
      args: [],
    );
  }

  /// `당신의 그리기 순서는?`
  String get gameDrawingTurnOverlayTitle {
    return Intl.message(
      '당신의 그리기 순서는?',
      name: 'gameDrawingTurnOverlayTitle',
      desc: '',
      args: [],
    );
  }

  /// `{n}초`
  String gameDrawingInitMsg0(Object n) {
    return Intl.message(
      '$n초',
      name: 'gameDrawingInitMsg0',
      desc: '',
      args: [n],
    );
  }

  /// `{msg0} 후 사라져요`
  String gameDrawingInitMsg1(Object msg0) {
    return Intl.message(
      '$msg0 후 사라져요',
      name: 'gameDrawingInitMsg1',
      desc: '',
      args: [msg0],
    );
  }

  /// `그리는 중`
  String get gameDrawingOtherTurn {
    return Intl.message(
      '그리는 중',
      name: 'gameDrawingOtherTurn',
      desc: '',
      args: [],
    );
  }

  /// `내 차례`
  String get gameDrawingMyTurn {
    return Intl.message('내 차례', name: 'gameDrawingMyTurn', desc: '', args: []);
  }

  /// `외출중`
  String get gameDrawingNotConnected {
    return Intl.message(
      '외출중',
      name: 'gameDrawingNotConnected',
      desc: '',
      args: [],
    );
  }

  /// `한 획만 그릴 수 있어요`
  String get gameDrawingSingleStrokeGuide {
    return Intl.message(
      '한 획만 그릴 수 있어요',
      name: 'gameDrawingSingleStrokeGuide',
      desc: '',
      args: [],
    );
  }

  /// `한 번에 한 획만 그릴 수 있어요`
  String get gameDrawingNoStrokesLeft {
    return Intl.message(
      '한 번에 한 획만 그릴 수 있어요',
      name: 'gameDrawingNoStrokesLeft',
      desc: '',
      args: [],
    );
  }

  /// `{n}획까지 그릴 수 있어요`
  String gameDrawingMultiStrokeGuide(Object n) {
    return Intl.message(
      '$n획까지 그릴 수 있어요',
      name: 'gameDrawingMultiStrokeGuide',
      desc: '',
      args: [n],
    );
  }

  /// `원하는 만큼 그릴 수 있어요`
  String get gameDrawingUnlimitedStrokeGuide {
    return Intl.message(
      '원하는 만큼 그릴 수 있어요',
      name: 'gameDrawingUnlimitedStrokeGuide',
      desc: '',
      args: [],
    );
  }

  /// `한 번에 {n}획까지 그릴 수 있어요`
  String gameDrawingNoStrokesLeftMulti(Object n) {
    return Intl.message(
      '한 번에 $n획까지 그릴 수 있어요',
      name: 'gameDrawingNoStrokesLeftMulti',
      desc: '',
      args: [n],
    );
  }

  /// `악동미술가를 지목해 주세요`
  String get gameVotingTitle {
    return Intl.message(
      '악동미술가를 지목해 주세요',
      name: 'gameVotingTitle',
      desc: '',
      args: [],
    );
  }

  /// `악동미술가에게 투표하세요`
  String get gameVotingGuide {
    return Intl.message(
      '악동미술가에게 투표하세요',
      name: 'gameVotingGuide',
      desc: '',
      args: [],
    );
  }

  /// `들켰다! 키워드를 맞추세요!`
  String get gameGuessHint {
    return Intl.message(
      '들켰다! 키워드를 맞추세요!',
      name: 'gameGuessHint',
      desc: '',
      args: [],
    );
  }

  /// `키워드는 띄어쓰기 없는 한 단어예요`
  String get gameGuessKeywordGuide {
    return Intl.message(
      '키워드는 띄어쓰기 없는 한 단어예요',
      name: 'gameGuessKeywordGuide',
      desc: '',
      args: [],
    );
  }

  /// `무슨 키워드일까?`
  String get gameGuessThinking {
    return Intl.message(
      '무슨 키워드일까?',
      name: 'gameGuessThinking',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get gameGuessAnswer {
    return Intl.message('', name: 'gameGuessAnswer', desc: '', args: []);
  }

  /// `일까?`
  String get gameGuessAnswer2 {
    return Intl.message('일까?', name: 'gameGuessAnswer2', desc: '', args: []);
  }

  /// `를 찾았어요`
  String get gameGuessCitizenTitle2 {
    return Intl.message(
      '를 찾았어요',
      name: 'gameGuessCitizenTitle2',
      desc: '',
      args: [],
    );
  }

  /// `악동미술가 키워드 입력중!`
  String get gameGuessCitizenDescription {
    return Intl.message(
      '악동미술가 키워드 입력중!',
      name: 'gameGuessCitizenDescription',
      desc: '',
      args: [],
    );
  }

  /// `악동미술가가 키워드를 맞추면 악동미술가의 승리에요`
  String get gameGuessCitizenCaption {
    return Intl.message(
      '악동미술가가 키워드를 맞추면 악동미술가의 승리에요',
      name: 'gameGuessCitizenCaption',
      desc: '',
      args: [],
    );
  }

  /// `WIN`
  String get gameResultWin {
    return Intl.message('WIN', name: 'gameResultWin', desc: '', args: []);
  }

  /// `LOSE`
  String get gameResultLose {
    return Intl.message('LOSE', name: 'gameResultLose', desc: '', args: []);
  }

  /// `아무도 눈치 못 챘어요`
  String get gameResultReasonMafiaUnnoticed {
    return Intl.message(
      '아무도 눈치 못 챘어요',
      name: 'gameResultReasonMafiaUnnoticed',
      desc: '',
      args: [],
    );
  }

  /// `악동미술가를 못 찾았어요`
  String get gameResultReasonCitizenNotFound {
    return Intl.message(
      '악동미술가를 못 찾았어요',
      name: 'gameResultReasonCitizenNotFound',
      desc: '',
      args: [],
    );
  }

  /// `키워드를 맞혔어요`
  String get gameResultReasonMafiaGuessed {
    return Intl.message(
      '키워드를 맞혔어요',
      name: 'gameResultReasonMafiaGuessed',
      desc: '',
      args: [],
    );
  }

  /// `악동미술가가 키워드를 맞혔어요`
  String get gameResultReasonCitizenMafiaGuessed {
    return Intl.message(
      '악동미술가가 키워드를 맞혔어요',
      name: 'gameResultReasonCitizenMafiaGuessed',
      desc: '',
      args: [],
    );
  }

  /// `키워드를 틀렸어요`
  String get gameResultReasonMafiaWrong {
    return Intl.message(
      '키워드를 틀렸어요',
      name: 'gameResultReasonMafiaWrong',
      desc: '',
      args: [],
    );
  }

  /// `악동미술가를 잡았어요`
  String get gameResultReasonCitizenCaught {
    return Intl.message(
      '악동미술가를 잡았어요',
      name: 'gameResultReasonCitizenCaught',
      desc: '',
      args: [],
    );
  }

  /// `악동미술가가 꽁꽁 숨었어요. 악동미술가는 다음 장난을\n치러 이미 미술관을 떠났어요`
  String get gameResultMafiaNotFoundDesc {
    return Intl.message(
      '악동미술가가 꽁꽁 숨었어요. 악동미술가는 다음 장난을\n치러 이미 미술관을 떠났어요',
      name: 'gameResultMafiaNotFoundDesc',
      desc: '',
      args: [],
    );
  }

  /// `정답을 맞추고 다른 장난을 치러\n이미 미술관을 떠났어요`
  String get gameResultMafiaCorrectDesc {
    return Intl.message(
      '정답을 맞추고 다른 장난을 치러\n이미 미술관을 떠났어요',
      name: 'gameResultMafiaCorrectDesc',
      desc: '',
      args: [],
    );
  }

  /// ` 키워드를 입력하여\n착한미술가들의 승리네요`
  String get gameResultMafiaWrongDesc {
    return Intl.message(
      ' 키워드를 입력하여\n착한미술가들의 승리네요',
      name: 'gameResultMafiaWrongDesc',
      desc: '',
      args: [],
    );
  }

  /// `다시하기`
  String get gameResultRetry {
    return Intl.message('다시하기', name: 'gameResultRetry', desc: '', args: []);
  }

  /// `악동미술가는\n`
  String get gameResultV2MafiaWin1 {
    return Intl.message(
      '악동미술가는\n',
      name: 'gameResultV2MafiaWin1',
      desc: '',
      args: [],
    );
  }

  /// `\n입니다.`
  String get gameResultV2MafiaWin2 {
    return Intl.message(
      '\n입니다.',
      name: 'gameResultV2MafiaWin2',
      desc: '',
      args: [],
    );
  }

  /// `\n\n`
  String get gameResultV2CitizenWin1 {
    return Intl.message(
      '\n\n',
      name: 'gameResultV2CitizenWin1',
      desc: '',
      args: [],
    );
  }

  /// `\n라고 써서 틀렸어요.`
  String get gameResultV2CitizenWin2 {
    return Intl.message(
      '\n라고 써서 틀렸어요.',
      name: 'gameResultV2CitizenWin2',
      desc: '',
      args: [],
    );
  }

  /// `한 번 더 하기`
  String get gameResultPlayAgain {
    return Intl.message(
      '한 번 더 하기',
      name: 'gameResultPlayAgain',
      desc: '',
      args: [],
    );
  }

  /// `이미 게임이 시작된 방이라 새 방을 만들었어요.`
  String get gameResultNewRoomInGame {
    return Intl.message(
      '이미 게임이 시작된 방이라 새 방을 만들었어요.',
      name: 'gameResultNewRoomInGame',
      desc: '',
      args: [],
    );
  }

  /// `방이 가득 차서 새 방을 만들었어요.`
  String get gameResultNewRoomFull {
    return Intl.message(
      '방이 가득 차서 새 방을 만들었어요.',
      name: 'gameResultNewRoomFull',
      desc: '',
      args: [],
    );
  }

  /// `방이 사라져서 새 방을 만들었어요.`
  String get gameResultNewRoomNotFound {
    return Intl.message(
      '방이 사라져서 새 방을 만들었어요.',
      name: 'gameResultNewRoomNotFound',
      desc: '',
      args: [],
    );
  }

  /// `홈 화면으로 나갈까요?`
  String get gameResultExitTitle {
    return Intl.message(
      '홈 화면으로 나갈까요?',
      name: 'gameResultExitTitle',
      desc: '',
      args: [],
    );
  }

  /// `개발자 메뉴`
  String get dev {
    return Intl.message('개발자 메뉴', name: 'dev', desc: '', args: []);
  }

  /// `로그`
  String get devLog {
    return Intl.message('로그', name: 'devLog', desc: '', args: []);
  }

  /// `로컬 데이터`
  String get devLocalData {
    return Intl.message('로컬 데이터', name: 'devLocalData', desc: '', args: []);
  }

  /// `UI 테스트 모드`
  String get devUiTestMode {
    return Intl.message('UI 테스트 모드', name: 'devUiTestMode', desc: '', args: []);
  }

  /// `UI 테스트 모드 표시`
  String get devUiTestModeMark {
    return Intl.message(
      'UI 테스트 모드 표시',
      name: 'devUiTestModeMark',
      desc: '',
      args: [],
    );
  }

  /// `컴포넌트`
  String get components {
    return Intl.message('컴포넌트', name: 'components', desc: '', args: []);
  }

  /// `로컬 데이터`
  String get localDataPageTitle {
    return Intl.message(
      '로컬 데이터',
      name: 'localDataPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `설정을 초기화할까요?`
  String get resetConfigConfirmDialogTitle {
    return Intl.message(
      '설정을 초기화할까요?',
      name: 'resetConfigConfirmDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `설정 초기화 완료`
  String get resetConfigSuccess {
    return Intl.message(
      '설정 초기화 완료',
      name: 'resetConfigSuccess',
      desc: '',
      args: [],
    );
  }

  /// `설정`
  String get setting {
    return Intl.message('설정', name: 'setting', desc: '', args: []);
  }

  /// `게임 설정`
  String get settingGameConfigure {
    return Intl.message(
      '게임 설정',
      name: 'settingGameConfigure',
      desc: '',
      args: [],
    );
  }

  /// `언어`
  String get settingLanguage {
    return Intl.message('언어', name: 'settingLanguage', desc: '', args: []);
  }

  /// `빠른 게임 알림`
  String get settingQuickStartNotification {
    return Intl.message(
      '빠른 게임 알림',
      name: 'settingQuickStartNotification',
      desc: '',
      args: [],
    );
  }

  /// `빠른 게임을 기다리는 유저가 있을 때 알림을 보내줄게요!`
  String get settingQuickStartNotificationEnalbed {
    return Intl.message(
      '빠른 게임을 기다리는 유저가 있을 때 알림을 보내줄게요!',
      name: 'settingQuickStartNotificationEnalbed',
      desc: '',
      args: [],
    );
  }

  /// `알림 비활성화`
  String get settingQuickStartNotificationDisabled {
    return Intl.message(
      '알림 비활성화',
      name: 'settingQuickStartNotificationDisabled',
      desc: '',
      args: [],
    );
  }

  /// `문의`
  String get settingContact {
    return Intl.message('문의', name: 'settingContact', desc: '', args: []);
  }

  /// `문의하기`
  String get settingContactUs {
    return Intl.message('문의하기', name: 'settingContactUs', desc: '', args: []);
  }

  /// `리뷰 작성`
  String get settingWriteReview {
    return Intl.message(
      '리뷰 작성',
      name: 'settingWriteReview',
      desc: '',
      args: [],
    );
  }

  /// `답변을 위해 필요하니 지우지 말아주세요.`
  String get settingContactUsDoNotDelete {
    return Intl.message(
      '답변을 위해 필요하니 지우지 말아주세요.',
      name: 'settingContactUsDoNotDelete',
      desc: '',
      args: [],
    );
  }

  /// `{name}로 문의 부탁드려요`
  String settingContactUsPleaseMailTo(Object name) {
    return Intl.message(
      '$name로 문의 부탁드려요',
      name: 'settingContactUsPleaseMailTo',
      desc: '',
      args: [name],
    );
  }

  /// `서비스 정보`
  String get settingAbout {
    return Intl.message('서비스 정보', name: 'settingAbout', desc: '', args: []);
  }

  /// `공지사항`
  String get settingNotice {
    return Intl.message('공지사항', name: 'settingNotice', desc: '', args: []);
  }

  /// `버전 정보`
  String get settingVersion {
    return Intl.message('버전 정보', name: 'settingVersion', desc: '', args: []);
  }

  /// `라이선스`
  String get settingLicense {
    return Intl.message('라이선스', name: 'settingLicense', desc: '', args: []);
  }

  /// `개발`
  String get settingDevelopment {
    return Intl.message('개발', name: 'settingDevelopment', desc: '', args: []);
  }

  /// `테마`
  String get settingTheme {
    return Intl.message('테마', name: 'settingTheme', desc: '', args: []);
  }

  /// `라이트`
  String get settingLight {
    return Intl.message('라이트', name: 'settingLight', desc: '', args: []);
  }

  /// `다크`
  String get settingDark {
    return Intl.message('다크', name: 'settingDark', desc: '', args: []);
  }

  /// `알림 권한이 필요해요`
  String get goToNotificationSettingDialogTitle {
    return Intl.message(
      '알림 권한이 필요해요',
      name: 'goToNotificationSettingDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `기기 설정에서 알림 권한을 활성화 해주세요`
  String get goToNotificationSettingDialogDesc {
    return Intl.message(
      '기기 설정에서 알림 권한을 활성화 해주세요',
      name: 'goToNotificationSettingDialogDesc',
      desc: '',
      args: [],
    );
  }

  /// `설정으로 이동`
  String get goToNotificationSettingDialogConfirm {
    return Intl.message(
      '설정으로 이동',
      name: 'goToNotificationSettingDialogConfirm',
      desc: '',
      args: [],
    );
  }

  /// `변경되었어요`
  String get languageBottomSheetChanged {
    return Intl.message(
      '변경되었어요',
      name: 'languageBottomSheetChanged',
      desc: '',
      args: [],
    );
  }

  /// `변경할 닉네임을 입력해 주세요`
  String get editNicknameTitle {
    return Intl.message(
      '변경할 닉네임을 입력해 주세요',
      name: 'editNicknameTitle',
      desc: '',
      args: [],
    );
  }

  /// `최대 7자까지 쓸 수 있어요`
  String get editNicknameDesc {
    return Intl.message(
      '최대 7자까지 쓸 수 있어요',
      name: 'editNicknameDesc',
      desc: '',
      args: [],
    );
  }

  /// `닉네임 입력`
  String get editNicknameHint {
    return Intl.message('닉네임 입력', name: 'editNicknameHint', desc: '', args: []);
  }

  /// `라이선스 {n}개`
  String appLicenseTotal(Object n) {
    return Intl.message(
      '라이선스 $n개',
      name: 'appLicenseTotal',
      desc: '',
      args: [n],
    );
  }

  /// `오픈소스 라이선스`
  String get appLicenseOpenSource {
    return Intl.message(
      '오픈소스 라이선스',
      name: 'appLicenseOpenSource',
      desc: '',
      args: [],
    );
  }

  /// `확인`
  String get confirm {
    return Intl.message('확인', name: 'confirm', desc: '', args: []);
  }

  /// `취소`
  String get cancel {
    return Intl.message('취소', name: 'cancel', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
