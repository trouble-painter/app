sealed class JoinQrPageState {}

class JoinQrPageInitState extends JoinQrPageState {}

class JoinQrPageGrantedState extends JoinQrPageState {
  final bool isBusy;

  JoinQrPageGrantedState({required this.isBusy});
  JoinQrPageGrantedState copyWith({
    bool? isBusy,
  }) {
    return JoinQrPageGrantedState(
      isBusy: isBusy ?? this.isBusy,
    );
  }
}

class JoinQrPageDeniedState extends JoinQrPageState {}
