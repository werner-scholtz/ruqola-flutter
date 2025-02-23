/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class SessionList extends Restapiabstractjob {
  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  Uri url(String url) {
    return generateUrl(url, RestApiUrlType.sessionsList);
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      print("Impossible to start LicensesList");
      return RestapiabstractjobResult();
    }

    http.Response response = await http.get(url(serverUrl!), headers: headers());
    return result(response);
  }
}
