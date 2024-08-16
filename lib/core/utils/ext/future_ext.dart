import 'package:x_pr/core/utils/env/constant.dart';

extension FutureExt<T> on Future<T> {
  Future<T> waiting({
    int milliseconds = Constant.minLoaderDisplayMillies,
    void Function(bool isBusy)? callback,
  }) async {
    callback?.call(true);
    final result = await Future.wait([
      this,
      Future.delayed(Duration(milliseconds: milliseconds)),
    ]);
    callback?.call(false);
    return result[0];
  }
}
