import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_dialog_data.freezed.dart';
part 'update_dialog_data.g.dart';

@freezed
class UpdateDialogData with _$UpdateDialogData {
  factory UpdateDialogData({
    required String title,
    required String button,
    required Uri url,
  }) = _UpdateDialogData;

  UpdateDialogData._();
  factory UpdateDialogData.fromEmpty() => UpdateDialogData(
        title: "",
        button: "",
        url: Uri(),
      );

  factory UpdateDialogData.fromJson(Map<String, dynamic> json) =>
      _$UpdateDialogDataFromJson(json);
}
