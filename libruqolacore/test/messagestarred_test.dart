/*
 * SPDX-FileCopyrightText: 2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'package:libruqolacore/libruqolacore.dart' as libruqolacore;
import 'package:test/test.dart';

void main() {
  group('MessageStarred', () {
    test('Test Initial MessageStarred values', () {
      final starred = libruqolacore.MessageStarred();
      expect(starred.isStarred, false);
    });
  });
}
