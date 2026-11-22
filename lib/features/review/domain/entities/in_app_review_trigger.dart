/// When an in-app review request is considered
enum InAppReviewTrigger {
  /// The first game has ended; asked once, only if never requested before
  firstGameEnd,

  /// The app was opened; asked again once the platform interval has passed
  homeEntry,
}
