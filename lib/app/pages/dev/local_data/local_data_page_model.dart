import 'dart:convert';

import 'package:x_pr/app/pages/dev/local_data/local_data_page_state.dart';
import 'package:x_pr/core/view/base_view_model.dart';

class LocalDataPageModel extends BaseViewModel<LocalDataPageState> {
  LocalDataPageModel(super.buildState);

  Map<String, dynamic> getPayload(String idToken) {
    String payloadString = idToken.split(".")[1];
    payloadString = payloadString + "=" * (payloadString.length % 4);
    return jsonDecode(utf8.decode(base64Decode(payloadString)));
  }
}
