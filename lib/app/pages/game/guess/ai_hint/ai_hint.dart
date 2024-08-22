class AiHint {
  final bool isBusy;
  final bool isShow;
  final String hint;

  AiHint({
    this.isBusy = false,
    this.isShow = false,
    this.hint = "",
  });

  bool get isHint => hint.isNotEmpty;

  AiHint copyWith({
    bool? isBusy,
    bool? isShow,
    String? hint,
  }) {
    return AiHint(
      isBusy: isBusy ?? this.isBusy,
      isShow: isShow ?? this.isShow,
      hint: hint ?? this.hint,
    );
  }
}
