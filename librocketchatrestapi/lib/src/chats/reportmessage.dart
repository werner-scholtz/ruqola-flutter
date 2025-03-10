/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class ReportMessageInfo {
  final String messageId;
  final String description;

  ReportMessageInfo(this.messageId, this.description);
  bool canStart() {
    return messageId.isNotEmpty && description.isNotEmpty;
  }

  Map<String, String> body() =>
      {'messageId': messageId, 'description': description};
  @override
  String toString() {
    return "ReportMessageInfo(messageId: $messageId, description: $description)";
  }
}

class ReportMessage extends Restapiabstractjob {
  final ReportMessageInfo _info;
  ReportMessage(this._info);
  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  Uri url(String url) {
    return generateUrl(url, RestApiUrlType.chatReportMessage);
  }

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start ReportMessage");
      return false;
    }
    return _info.canStart();
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      return RestapiabstractjobResult();
    }

    http.Response response = await http.post(url(serverUrl!),
        headers: headers(), body: _info.body());
    return result(response);
  }
}
