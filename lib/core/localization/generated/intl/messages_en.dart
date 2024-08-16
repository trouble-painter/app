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

  static String m1(spy, spyKeyword) =>
      "The \"${spyKeyword}\" entered by spy \"${spy}\" is not a keyword 🚨";

  static String m2(spy) => "${spy} is entering a keyword..";

  static String m3(spy) =>
      "Spy \"${spy}\" has been designated. The spy is entering a keyword.";

  static String m4(category) =>
      "You have been identified as a spy.\nGuess the keyword for the [${category}] category!";

  static String m5(n) => "${n}sec";

  static String m6(msg0) => "Disappears in ${msg0}";

  static String m7(n) => "Moving to lobby in ${n}sec";

  static String m8(code, link) =>
      "Trouble Painter Invitation\ncode : [${code}]\nlink : ${link}";

  static String m9(nickname) =>
      "Welcome, ${nickname}\nFind the Trouble Painter\nand protect the art museum!";

  static String m10(roomId) => "Sketch Spy\n👉 Invitation Code: ${roomId}";

  static String m11(n) => "You can write up to ${n} characters";

  static String m12(nickname) => "${nickname} is drawing...";

  static String m13(n) => "${n}s";

  static String m14(name) => "Please email to ${name}";

  static String m15(spy) => "Spy \"${spy}\" guessed the keyword! 🕵🏻";

  static String m16(spy) => "Citizens couldn\'t find spy \"${spy}\" 🥹";

  static String m17(citizen) => "Unfortunately, \"${citizen}\" is a citizen 🥹";

  static String m18(n) => "Starts in ${n} seconds";

  static String m19(n) => "Your order: ${n}th";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "animal": MessageLookupByLibrary.simpleMessage("Animal"),
        "appLicenseBgm": MessageLookupByLibrary.simpleMessage("BGM license"),
        "appLicenseOpenSource":
            MessageLookupByLibrary.simpleMessage("Open source license"),
        "appLicenseTotal": m0,
        "appName": MessageLookupByLibrary.simpleMessage("Trouble Painter"),
        "brush": MessageLookupByLibrary.simpleMessage("Brush"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cannotVoteSelf":
            MessageLookupByLibrary.simpleMessage("I can\'t vote for myself."),
        "category": MessageLookupByLibrary.simpleMessage("Category"),
        "checkNetwork": MessageLookupByLibrary.simpleMessage(
            "Please check the network connection status"),
        "citizen": MessageLookupByLibrary.simpleMessage("Good Painter"),
        "citizenWinAction": m1,
        "citizenWinResult":
            MessageLookupByLibrary.simpleMessage("Citizen victory! 🎉"),
        "citizens": MessageLookupByLibrary.simpleMessage("Good Painters"),
        "complete": MessageLookupByLibrary.simpleMessage("Complete"),
        "components": MessageLookupByLibrary.simpleMessage("Components"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "copied": MessageLookupByLibrary.simpleMessage("Copied"),
        "createRoom": MessageLookupByLibrary.simpleMessage("Create a Room"),
        "dev": MessageLookupByLibrary.simpleMessage("Developer Menu"),
        "devGameDevMode":
            MessageLookupByLibrary.simpleMessage("Game Developer Mode"),
        "devLocalData": MessageLookupByLibrary.simpleMessage("Local Data"),
        "devLog": MessageLookupByLibrary.simpleMessage("Log"),
        "devUiTestMode": MessageLookupByLibrary.simpleMessage("UI Test Mode"),
        "drawingSecLimit": MessageLookupByLibrary.simpleMessage("Time limit"),
        "drawingStrokeLimit":
            MessageLookupByLibrary.simpleMessage("Stroke limit"),
        "editNickname": MessageLookupByLibrary.simpleMessage("Change Nickname"),
        "editNicknameDesc": MessageLookupByLibrary.simpleMessage(
            "You can use up to 7 characters"),
        "editNicknameHint":
            MessageLookupByLibrary.simpleMessage("Enter nickname"),
        "editNicknameTitle": MessageLookupByLibrary.simpleMessage(
            "Please enter the new nickname"),
        "empty": MessageLookupByLibrary.simpleMessage("Empty"),
        "eraser": MessageLookupByLibrary.simpleMessage("Eraser"),
        "gameAnsweringCitizenInputHint": m2,
        "gameAnsweringCitizenTitle": m3,
        "gameAnsweringDesc": MessageLookupByLibrary.simpleMessage(
            "If the keyword is guessed correctly, the spy wins."),
        "gameAnsweringSpyInputHint":
            MessageLookupByLibrary.simpleMessage("Please enter a keyword."),
        "gameAnsweringSpyTitle": m4,
        "gameDesc1": MessageLookupByLibrary.simpleMessage(
            "1️⃣ The keyword is only known to citizens.\n2️⃣ Draw one stroke to move on to the next turn.\n3️⃣ After drawing twice in total, nominate a spy.\n4️⃣ If a spy is pointed out, submit the keywords the spy came up with."),
        "gameDesc2": MessageLookupByLibrary.simpleMessage(
            "🧑‍🎨 Citizen wins\nIf the spy fails to guess the keyword\n\n🕵🏻 Spy wins\nIf he is not pointed out as a spy,\nor if he guesses the keyword"),
        "gameDrawingInitMsg0": m5,
        "gameDrawingInitMsg1": m6,
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
        "gameName": MessageLookupByLibrary.simpleMessage("Find the Spy"),
        "gamePagePopDesc": MessageLookupByLibrary.simpleMessage(
            "You will need an invitation code to re-enter."),
        "gamePagePopTitle":
            MessageLookupByLibrary.simpleMessage("Do you want to leave?"),
        "gamePageReconnecting":
            MessageLookupByLibrary.simpleMessage("Reconnecting"),
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
        "gameResultTimerDesc": m7,
        "gameStart": MessageLookupByLibrary.simpleMessage("Getting started"),
        "gameVotingTitle": MessageLookupByLibrary.simpleMessage(
            "Please point out the Trouble Painter"),
        "gameWaitingCanStartTip": MessageLookupByLibrary.simpleMessage(
            "The more people, the more fun!"),
        "gameWaitingCannotStartTip": MessageLookupByLibrary.simpleMessage(
            "At least 3 people are needed to start the game!"),
        "gameWaitingInvite": MessageLookupByLibrary.simpleMessage("Invite"),
        "gameWaitingInviteMessage": m8,
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
        "homeOnboarding1Title": m9,
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
        "homeRejoinRoom": MessageLookupByLibrary.simpleMessage("Rejoin"),
        "inviteCodeRequired": MessageLookupByLibrary.simpleMessage(
            "Please enter your invitation code"),
        "inviteMessage": m10,
        "join": MessageLookupByLibrary.simpleMessage("Join"),
        "joinCheckRoomId": MessageLookupByLibrary.simpleMessage(
            "Please check the invitation code"),
        "joinPaste":
            MessageLookupByLibrary.simpleMessage("Paste the invitation code"),
        "joinRoom": MessageLookupByLibrary.simpleMessage("Room Entry"),
        "joinTitle":
            MessageLookupByLibrary.simpleMessage("Enter invitation code"),
        "keyword": MessageLookupByLibrary.simpleMessage("Keyword"),
        "keywordRequired":
            MessageLookupByLibrary.simpleMessage("Please enter a keyword."),
        "languageBottomSheetChanged":
            MessageLookupByLibrary.simpleMessage("Changed"),
        "leave": MessageLookupByLibrary.simpleMessage("Leave"),
        "left": MessageLookupByLibrary.simpleMessage("Exit"),
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
        "myTurn":
            MessageLookupByLibrary.simpleMessage("It\'s my turn to draw."),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "nicknameAgreement1": MessageLookupByLibrary.simpleMessage(
            "Entering nickname implies agreement to the "),
        "nicknameAgreement2": MessageLookupByLibrary.simpleMessage("."),
        "nicknameHint": MessageLookupByLibrary.simpleMessage("nickname"),
        "nicknameMax": m11,
        "nicknameRequired":
            MessageLookupByLibrary.simpleMessage("Please enter your nickname"),
        "nicknameTitle": MessageLookupByLibrary.simpleMessage(
            "Hello\nPlease write your nickname"),
        "notMyTurn": MessageLookupByLibrary.simpleMessage("It\'s not my turn"),
        "noticeDialogShowUrl":
            MessageLookupByLibrary.simpleMessage("Read More"),
        "object": MessageLookupByLibrary.simpleMessage("Object"),
        "ongoingGame":
            MessageLookupByLibrary.simpleMessage("There is a game in progress"),
        "order": MessageLookupByLibrary.simpleMessage("card"),
        "otherPlayerTurn": m12,
        "playAgain": MessageLookupByLibrary.simpleMessage("Play Again"),
        "playRequirements": MessageLookupByLibrary.simpleMessage(
            "The game requires at least 3 players to start."),
        "players": MessageLookupByLibrary.simpleMessage("Participant List"),
        "pleaseCompleteTheSketch":
            MessageLookupByLibrary.simpleMessage("Please complete the sketch"),
        "resetConfigConfirmDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Do you want to reset config?"),
        "resetConfigSuccess": MessageLookupByLibrary.simpleMessage(
            "Config initialization complete"),
        "roomIsFull": MessageLookupByLibrary.simpleMessage("The room is full"),
        "roomNotFound":
            MessageLookupByLibrary.simpleMessage("I can\'t find my room"),
        "sec": m13,
        "settingContactUs": MessageLookupByLibrary.simpleMessage("Contact Us"),
        "settingContactUsDoNotDelete": MessageLookupByLibrary.simpleMessage(
            "Please do not delete this information."),
        "settingContactUsPleaseMailTo": m14,
        "settingDark": MessageLookupByLibrary.simpleMessage("Dark"),
        "settingLanguage": MessageLookupByLibrary.simpleMessage("Language"),
        "settingLicense": MessageLookupByLibrary.simpleMessage("License"),
        "settingLight": MessageLookupByLibrary.simpleMessage("Light"),
        "settingTheme": MessageLookupByLibrary.simpleMessage("Theme"),
        "settingVersion": MessageLookupByLibrary.simpleMessage("Version"),
        "sketchConfirmDialogTitle": MessageLookupByLibrary.simpleMessage(
            "Have you completed your sketch?"),
        "sketchLoadingMessage":
            MessageLookupByLibrary.simpleMessage("Creating a drawing.."),
        "spyWinByAnsweringAction": m15,
        "spyWinByAnsweringResult":
            MessageLookupByLibrary.simpleMessage("Spy wins! 🎉"),
        "spyWinByMultiCitizenVoted": m16,
        "spyWinBySingleCitizenVoted": m17,
        "spyWinByVotingResult":
            MessageLookupByLibrary.simpleMessage("Spy wins! 🎉"),
        "startAfter": m18,
        "submit": MessageLookupByLibrary.simpleMessage("Submit"),
        "termsOfService":
            MessageLookupByLibrary.simpleMessage("Terms of Service"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Try again"),
        "turnLimit": MessageLookupByLibrary.simpleMessage("Turns limit"),
        "updateDialogGoToUpdate":
            MessageLookupByLibrary.simpleMessage("Go To Update"),
        "voteForSpy":
            MessageLookupByLibrary.simpleMessage("Point out the spy!"),
        "votingSecLimit": MessageLookupByLibrary.simpleMessage("Voting time"),
        "youAreNotSpy": MessageLookupByLibrary.simpleMessage(
            "You are a citizen.\nProve that you are a citizen without being discovered by spies."),
        "youAreSpy": MessageLookupByLibrary.simpleMessage(
            "You are a spy.\nLook at other players\' pictures and guess the keyword."),
        "yourOrderIs": m19
      };
}
