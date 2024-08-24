// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(n) => "License ${n}";

  static String m1(n) => "${n}sec";

  static String m2(msg0) => "Disappears in ${msg0}";

  static String m3(n) => "Moving to lobby in ${n}sec";

  static String m4(code, link) =>
      "Trouble Painter Invitation\ncode : [${code}]\nlink : ${link}";

  static String m5(nickname) =>
      "Welcome, ${nickname}\nFind the Trouble Painter\nand protect the art museum!";

  static String m6(n) => "You can write up to ${n} characters";

  static String m7(n) => "${n}s";

  static String m8(name) => "Please email to ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appLicenseOpenSource":
            MessageLookupByLibrary.simpleMessage("Open source license"),
        "appLicenseTotal": m0,
        "appName": MessageLookupByLibrary.simpleMessage("Trouble Painter"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "category": MessageLookupByLibrary.simpleMessage("Category"),
        "checkNetwork": MessageLookupByLibrary.simpleMessage(
            "Please check the network connection status"),
        "citizen": MessageLookupByLibrary.simpleMessage("Good Painter"),
        "citizens": MessageLookupByLibrary.simpleMessage("Good Painters"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "complete": MessageLookupByLibrary.simpleMessage("Complete"),
        "components": MessageLookupByLibrary.simpleMessage("Components"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "copied": MessageLookupByLibrary.simpleMessage("Copied"),
        "dev": MessageLookupByLibrary.simpleMessage("Developer Menu"),
        "devLocalData": MessageLookupByLibrary.simpleMessage("Local Data"),
        "devLog": MessageLookupByLibrary.simpleMessage("Log"),
        "devUiTestMode": MessageLookupByLibrary.simpleMessage("UI Test Mode"),
        "editNicknameDesc": MessageLookupByLibrary.simpleMessage(
            "You can use up to 7 characters"),
        "editNicknameHint":
            MessageLookupByLibrary.simpleMessage("Enter nickname"),
        "editNicknameTitle": MessageLookupByLibrary.simpleMessage(
            "Please enter the new nickname"),
        "empty": MessageLookupByLibrary.simpleMessage("Empty"),
        "gameDrawingInitMsg0": m1,
        "gameDrawingInitMsg1": m2,
        "gameDrawingMyTurn": MessageLookupByLibrary.simpleMessage("My Turn"),
        "gameDrawingNotConnected":
            MessageLookupByLibrary.simpleMessage("Offline"),
        "gameDrawingOtherTurn": MessageLookupByLibrary.simpleMessage("Drawing"),
        "gameDrawingTurnOverlayTitle":
            MessageLookupByLibrary.simpleMessage("What is your drawing order?"),
        "gameGuessAiHint": MessageLookupByLibrary.simpleMessage("AI Hint"),
        "gameGuessAnswer": MessageLookupByLibrary.simpleMessage("Is it "),
        "gameGuessAnswer2": MessageLookupByLibrary.simpleMessage("?"),
        "gameGuessCitizenCaption": MessageLookupByLibrary.simpleMessage(
            "If the Truble Painter gueeses the keyword, they win."),
        "gameGuessCitizenDescription": MessageLookupByLibrary.simpleMessage(
            "But don\'t let your guard down yet!"),
        "gameGuessCitizenTitle2":
            MessageLookupByLibrary.simpleMessage(" Found"),
        "gameGuessHint":
            MessageLookupByLibrary.simpleMessage("Gotcha! Guess the keyword!"),
        "gameGuessThinking": MessageLookupByLibrary.simpleMessage("Thinking.."),
        "gamePagePopTitle":
            MessageLookupByLibrary.simpleMessage("Do you want to leave?"),
        "gamePageReconnecting":
            MessageLookupByLibrary.simpleMessage("Reconnecting"),
        "gameQuickStartWaitingPageDesc":
            MessageLookupByLibrary.simpleMessage("Waiting..."),
        "gameQuickStartWaitingPageTitle": MessageLookupByLibrary.simpleMessage(
            "Painters are gathering to join us."),
        "gameReadyRole1": MessageLookupByLibrary.simpleMessage("You are"),
        "gameReadyRole2": MessageLookupByLibrary.simpleMessage(""),
        "gameReadyRoleCitizenDescription": MessageLookupByLibrary.simpleMessage(
            "To avoid detection by Trouble Painter, express your keywords in pictures as instructed."),
        "gameReadyRoleMafiaDescription": MessageLookupByLibrary.simpleMessage(
            "Guess what keywords Good Painters draw on. You can\'t reveal your identity."),
        "gameResultCitizensWin": MessageLookupByLibrary.simpleMessage(" Win"),
        "gameResultMafiaCorrectDesc": MessageLookupByLibrary.simpleMessage(
            "Truble Painter guessed correctly\nand left for the next prank"),
        "gameResultMafiaNotFoundDesc": MessageLookupByLibrary.simpleMessage(
            "Truble Painter is hiding.\nLeft the museum for the next prank"),
        "gameResultMafiaWins": MessageLookupByLibrary.simpleMessage(" Wins"),
        "gameResultMafiaWrongDesc": MessageLookupByLibrary.simpleMessage(
            " keyword entered,\nGood Painters win"),
        "gameResultRetry": MessageLookupByLibrary.simpleMessage("Retry"),
        "gameResultTimerDesc": m3,
        "gameVotingTitle": MessageLookupByLibrary.simpleMessage(
            "Please point out the Trouble Painter"),
        "gameWaitingCanStartTip": MessageLookupByLibrary.simpleMessage(
            "The more people, the more fun!"),
        "gameWaitingCannotStartTip": MessageLookupByLibrary.simpleMessage(
            "At least 3 people are needed to start the game!"),
        "gameWaitingInvite": MessageLookupByLibrary.simpleMessage("Invite"),
        "gameWaitingInviteMessage": m4,
        "gameWaitingStart": MessageLookupByLibrary.simpleMessage("Start"),
        "gameWaitingTitleReady":
            MessageLookupByLibrary.simpleMessage("Yay!\nWe can start now"),
        "gameWaitingTitleWaiting": MessageLookupByLibrary.simpleMessage(
            "Painters are gathering\nto collaborate!"),
        "gameWaitingYouAreHost":
            MessageLookupByLibrary.simpleMessage("You\'re now the host!"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "homeCreateRoom": MessageLookupByLibrary.simpleMessage("Create Room"),
        "homeJoinRoom":
            MessageLookupByLibrary.simpleMessage("Enter Invitation Code"),
        "homeMaxRoom": MessageLookupByLibrary.simpleMessage(
            "Oops! Room is full. Please try again later."),
        "homeNoRoom": MessageLookupByLibrary.simpleMessage(
            "This invitation code does not exist."),
        "homeOnboarding1Title": m5,
        "homeOnboarding2Desc": MessageLookupByLibrary.simpleMessage(
            "The Good Painter is given a keyword, and the Trouble Painter is given a category."),
        "homeOnboarding2Title":
            MessageLookupByLibrary.simpleMessage("1. Role assignment"),
        "homeOnboarding3Desc": MessageLookupByLibrary.simpleMessage(
            "The Good Painter hides the keyword, the Trouble Painter hides identity and draw a line."),
        "homeOnboarding3Title":
            MessageLookupByLibrary.simpleMessage("2. Drawing"),
        "homeOnboarding4Desc": MessageLookupByLibrary.simpleMessage(
            "Vote on who the Trouble Painter is within the time limit."),
        "homeOnboarding4Title":
            MessageLookupByLibrary.simpleMessage("3. Voting"),
        "homeOnboarding5Desc1": MessageLookupByLibrary.simpleMessage(
            "If the Trouble Painter guesses the keyword or isn\'t identified, the Trouble Painter wins!"),
        "homeOnboarding5Desc2": MessageLookupByLibrary.simpleMessage(
            "If the Trouble Painter doesn\'t guess the keyword, the Good Painter wins!"),
        "homeOnboarding5Title1":
            MessageLookupByLibrary.simpleMessage("4. Results - "),
        "homeOnboarding5Title2": MessageLookupByLibrary.simpleMessage(" wins"),
        "homeOnboardingRole":
            MessageLookupByLibrary.simpleMessage("Game Rules"),
        "homeRandomQuickStart":
            MessageLookupByLibrary.simpleMessage("Quick Start"),
        "homeRejoinRoom": MessageLookupByLibrary.simpleMessage("Rejoin"),
        "join": MessageLookupByLibrary.simpleMessage("Join"),
        "joinCheckRoomId": MessageLookupByLibrary.simpleMessage(
            "Please check the invitation code"),
        "joinPaste":
            MessageLookupByLibrary.simpleMessage("Paste the invitation code"),
        "joinTitle":
            MessageLookupByLibrary.simpleMessage("Enter invitation code"),
        "keyword": MessageLookupByLibrary.simpleMessage("Keyword"),
        "languageBottomSheetChanged":
            MessageLookupByLibrary.simpleMessage("Changed"),
        "leave": MessageLookupByLibrary.simpleMessage("Leave"),
        "localDataPageTitle":
            MessageLookupByLibrary.simpleMessage("Local Data"),
        "loginFailure":
            MessageLookupByLibrary.simpleMessage("Please try again 🥹"),
        "loginPage": MessageLookupByLibrary.simpleMessage("Login Page"),
        "loginPageTitle": MessageLookupByLibrary.simpleMessage(
            "Simply sign up for membership and share it with your colleagues!"),
        "loginSuccess":
            MessageLookupByLibrary.simpleMessage("Nice to meet you 👋"),
        "loginWithAnonymous":
            MessageLookupByLibrary.simpleMessage("Sign in with Anonymous"),
        "loginWithApple":
            MessageLookupByLibrary.simpleMessage("Sign in with Apple"),
        "loginWithGoogle":
            MessageLookupByLibrary.simpleMessage("Sign in with Google"),
        "logout": MessageLookupByLibrary.simpleMessage("Sign Out"),
        "logoutDialogTitle":
            MessageLookupByLibrary.simpleMessage("Do you want to logout?"),
        "logoutFailure":
            MessageLookupByLibrary.simpleMessage("Please try again 🥹"),
        "logoutSuccess": MessageLookupByLibrary.simpleMessage("Bye 👋"),
        "mafia": MessageLookupByLibrary.simpleMessage("Trouble Painter"),
        "maintenanceDialogDesc": MessageLookupByLibrary.simpleMessage(
            "We are currently performing maintenance to provide better service. If the work is completed earlier than expected, the service will resume immediately."),
        "me": MessageLookupByLibrary.simpleMessage("me"),
        "nicknameAgreement1": MessageLookupByLibrary.simpleMessage(
            "Entering nickname implies agreement to the "),
        "nicknameAgreement2": MessageLookupByLibrary.simpleMessage("."),
        "nicknameHint": MessageLookupByLibrary.simpleMessage("nickname"),
        "nicknameMax": m6,
        "nicknameRequired":
            MessageLookupByLibrary.simpleMessage("Please enter your nickname"),
        "nicknameTitle": MessageLookupByLibrary.simpleMessage(
            "Hello\nPlease write your nickname"),
        "notMyTurn": MessageLookupByLibrary.simpleMessage("It\'s not my turn"),
        "noticeDialogShowUrl":
            MessageLookupByLibrary.simpleMessage("Read More"),
        "ongoingGame":
            MessageLookupByLibrary.simpleMessage("There is a game in progress"),
        "resetConfigConfirmDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Do you want to reset config?"),
        "resetConfigSuccess": MessageLookupByLibrary.simpleMessage(
            "Config initialization complete"),
        "sec": m7,
        "settingContactUs": MessageLookupByLibrary.simpleMessage("Contact Us"),
        "settingContactUsDoNotDelete": MessageLookupByLibrary.simpleMessage(
            "Please do not delete this information."),
        "settingContactUsPleaseMailTo": m8,
        "settingDark": MessageLookupByLibrary.simpleMessage("Dark"),
        "settingLanguage": MessageLookupByLibrary.simpleMessage("Language"),
        "settingLicense": MessageLookupByLibrary.simpleMessage("License"),
        "settingLight": MessageLookupByLibrary.simpleMessage("Light"),
        "settingTheme": MessageLookupByLibrary.simpleMessage("Theme"),
        "settingVersion": MessageLookupByLibrary.simpleMessage("Version"),
        "termsOfService":
            MessageLookupByLibrary.simpleMessage("Terms of Service"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Try again"),
        "updateDialogGoToUpdate":
            MessageLookupByLibrary.simpleMessage("Go To Update")
      };
}
