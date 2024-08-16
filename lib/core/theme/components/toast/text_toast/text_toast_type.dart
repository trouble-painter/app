part of '../toast.dart';

enum TextToastType {
  warning("info_warning"),
  success("info_safe"),
  normal(null);

  const TextToastType(this.icon);
  final String? icon;
}
