/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:librocketchatrestapi/librocketchatrestapi.dart';
import 'package:http/http.dart' as http;

class RoleDeleteInfo {
  final String roleId;
  RoleDeleteInfo(this.roleId);
  bool canStart() {
    return roleId.isNotEmpty;
  }

  Map<String, String> body() => {'roleId': roleId};
  @override
  String toString() {
    return "RoleDeleteInfo(roleId: $roleId)";
  }
}

class RoleDelete extends Restapiabstractjob {
  final RoleDeleteInfo _info;

  RoleDelete(this._info);

  @override
  bool canStart() {
    if (!super.canStart()) {
      print("Impossible to start RoleDelete");
      return false;
    }
    return _info.canStart();
  }

  @override
  bool requireHttpAuthentication() {
    return true;
  }

  @override
  Uri url(String url) {
    return generateUrl(url, RestApiUrlType.rolesDelete);
  }

  @override
  Future<RestapiabstractjobResult> start() async {
    if (!canStart()) {
      return RestapiabstractjobResult();
    }
    http.Response response =
        await http.post(url(serverUrl!), headers: headers(), body: _info.body());
    return result(response);
  }
}
