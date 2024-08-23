import 'package:x_pr/core/utils/ext/string_ext.dart';
import 'package:x_pr/features/analytics/domain/entity/app_event/app_event.dart';

class FirebaseAnalyticsEvent {
  final String name;
  final Map<String, Object>? parameters;

  const FirebaseAnalyticsEvent({
    required this.name,
    this.parameters,
  });

  factory FirebaseAnalyticsEvent.fromAppEvent(AppEvent event) {
    /// Name : Covert to snakecase and remove "_event"
    const String e = "_event";
    final String className = event.runtimeType.toString().toSnakeCase();
    final String name = (className.endsWith(e))
        ? className.substring(0, className.length - e.length)
        : className;

    /// Parameters : Convert key to snakecase
    final Map<String, Object> json = event.toJson();
    final Map<String, Object>? parameters = json.isEmpty
        ? null
        : Map.fromEntries(
            json.entries.map((e) {
              return MapEntry(
                e.key.toSnakeCase(),

                /// parameter not support bool
                e.value.runtimeType == bool
                    ? (e.value == true ? 1 : 0)
                    : e.value,
              );
            }),
          );

    return FirebaseAnalyticsEvent(
      name: name,
      parameters: parameters,
    );
  }
}
