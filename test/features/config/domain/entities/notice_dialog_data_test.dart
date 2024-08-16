import 'package:flutter_test/flutter_test.dart';
import 'package:x_pr/core/utils/time/network_time_ext.dart';
import 'package:x_pr/features/config/domain/entities/notice_dialog_data.dart';
import 'package:x_pr/features/config/domain/entities/notice_dialog_history.dart';

void main() {
  late NoticeDialogData data;
  late NoticeDialogHistory history;

  setUp(() {
    data = NoticeDialogData(
      version: 1,
      exposureIntervalHour: 1,
      isShow: true,
      startedAt: NetworkTime.now.subtract(const Duration(hours: 12)),
      endedAt: NetworkTime.now.add(const Duration(hours: 12)),
      title: "title",
      desc: "desc",
    );

    history = NoticeDialogHistory(
      version: 0,
      exposedAt: NetworkTime.now.subtract(
        const Duration(hours: 24),
      ),
    );
  });

  group('NoticeDialogData', () {
    test('Check isShow', () {
      expect(data.copyWith(isShow: true).isShowNotice(history), true);
      expect(data.copyWith(isShow: false).isShowNotice(history), false);
    });

    test('Check exposure time', () {
      /// Before start
      final startedAt = data.endedAt.subtract(const Duration(hours: 1));
      expect(data.copyWith(startedAt: startedAt).isShowNotice(history), false);

      /// After start & before end
      expect(
        data
            .copyWith(
              startedAt: NetworkTime.now.subtract(const Duration(hours: 1)),
              endedAt: NetworkTime.now.add(const Duration(hours: 1)),
            )
            .isShowNotice(history),
        true,
      );

      /// After end
      final endedAt = data.startedAt.add(const Duration(hours: 1));
      expect(data.copyWith(endedAt: endedAt).isShowNotice(history), false);
    });

    test('Check first exposure', () {
      expect(data.isShowNotice(null), true);
    });

    test('Check version and exposure interval', () {
      /// History version < notice version
      expect(
        data.copyWith(version: 1).isShowNotice(history.copyWith(version: 0)),
        true,
      );

      /// History version >= notice version
      expect(
        data
            .copyWith(
              version: 1,
              exposureIntervalHour: 1,
              startedAt: NetworkTime.now.subtract(const Duration(hours: 2)),
              endedAt: NetworkTime.now.add(const Duration(hours: 2)),
            )
            .isShowNotice(
              history.copyWith(
                version: 1,
                exposedAt: NetworkTime.now,
              ),
            ),
        false,
      );
      expect(
        data
            .copyWith(
              version: 1,
              exposureIntervalHour: 1,
              startedAt: NetworkTime.now.subtract(const Duration(hours: 2)),
              endedAt: NetworkTime.now.add(const Duration(hours: 2)),
            )
            .isShowNotice(
              history.copyWith(
                version: 1,
                exposedAt: NetworkTime.now.subtract(const Duration(hours: 1)),
              ),
            ),
        true,
      );
      expect(
        data
            .copyWith(
              version: 1,
              exposureIntervalHour: 1,
              startedAt: NetworkTime.now.subtract(const Duration(hours: 2)),
              endedAt: NetworkTime.now.add(const Duration(hours: 2)),
            )
            .isShowNotice(
              history.copyWith(
                version: 1,
                exposedAt: NetworkTime.now.subtract(const Duration(hours: 4)),
              ),
            ),
        true,
      );
      expect(
        data
            .copyWith(
              version: 1,
              exposureIntervalHour: 2,
              startedAt: NetworkTime.now.subtract(const Duration(hours: 2)),
              endedAt: NetworkTime.now.add(const Duration(hours: 2)),
            )
            .isShowNotice(
              history.copyWith(
                version: 1,
                exposedAt: NetworkTime.now,
              ),
            ),
        false,
      );
    });
  });
}
