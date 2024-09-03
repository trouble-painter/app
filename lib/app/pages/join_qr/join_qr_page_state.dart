class JoinQrPageState {
  final bool isBusy;

  JoinQrPageState({this.isBusy = false});

  JoinQrPageState copyWith({
    bool? isBusy,
  }) {
    return JoinQrPageState(
      isBusy: isBusy ?? this.isBusy,
    );
  }
}
