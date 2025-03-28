/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */
import 'package:librocketchatrestapi/librocketchatrestapi.dart' as librocketchatrestapi;
import 'package:test/test.dart';

void main() {
  group('restapiutils', () {
    test('Test enum RestApiUrlType', () {
      expect(librocketchatrestapi.RestApiUrlType.bannersDismiss.name, 'banners.dismiss');
    });

    test('Test RestApiUrlExtensionType', () {
      expect(librocketchatrestapi.RestApiUrlExtensionType.noExtension.path, '/api/');
      expect(librocketchatrestapi.RestApiUrlExtensionType.v1.path, '/api/v1/');
      expect(librocketchatrestapi.RestApiUrlExtensionType.apps.path, '/api/apps/');
    });

    test('Test generateUrl', () {
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.empty,
              librocketchatrestapi.RestApiUrlExtensionType.apps,
              "bla-bla/logs"),
          Uri.parse('http://www.kde.org/api/apps/bla-bla/logs'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsList),
          Uri.parse('http://www.kde.org/api/v1/channels.list'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.login),
          Uri.parse('http://www.kde.org/api/v1/login'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.logout),
          Uri.parse('http://www.kde.org/api/v1/logout'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.me),
          Uri.parse('http://www.kde.org/api/v1/me'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersCreate),
          Uri.parse('http://www.kde.org/api/v1/users.create'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersCreateToken),
          Uri.parse('http://www.kde.org/api/v1/users.createToken'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersGetPresence),
          Uri.parse('http://www.kde.org/api/v1/users.getPresence'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersInfo),
          Uri.parse('http://www.kde.org/api/v1/users.info'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersList),
          Uri.parse('http://www.kde.org/api/v1/users.list'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersDelete),
          Uri.parse('http://www.kde.org/api/v1/users.delete'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersRegister),
          Uri.parse('http://www.kde.org/api/v1/users.register'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersGetAvatar),
          Uri.parse('http://www.kde.org/api/v1/users.getAvatar'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersResetAvatar),
          Uri.parse('http://www.kde.org/api/v1/users.resetAvatar'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersSetAvatar),
          Uri.parse('http://www.kde.org/api/v1/users.setAvatar'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersUpdate),
          Uri.parse('http://www.kde.org/api/v1/users.update'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersUpdateOwnBasicInfo),
          Uri.parse('http://www.kde.org/api/v1/users.updateOwnBasicInfo'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersGetUsernameSuggestion),
          Uri.parse('http://www.kde.org/api/v1/users.getUsernameSuggestion'));

      expect(
          librocketchatrestapi.generateUrl("http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.usersRemovePersonalAccessToken),
          Uri.parse('http://www.kde.org/api/v1/users.removePersonalAccessToken'));
      expect(
          librocketchatrestapi.generateUrl("http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.usersGeneratePersonalAccessToken),
          Uri.parse('http://www.kde.org/api/v1/users.generatePersonalAccessToken'));
      expect(
          librocketchatrestapi.generateUrl("http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.usersRegeneratePersonalAccessToken),
          Uri.parse('http://www.kde.org/api/v1/users.regeneratePersonalAccessToken'));
      expect(
          librocketchatrestapi.generateUrl("http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.usersGetPersonalAccessTokens),
          Uri.parse('http://www.kde.org/api/v1/users.getPersonalAccessTokens'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersSetStatus),
          Uri.parse('http://www.kde.org/api/v1/users.setStatus'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersGetStatus),
          Uri.parse('http://www.kde.org/api/v1/users.getStatus'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersPresence),
          Uri.parse('http://www.kde.org/api/v1/users.presence'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersAutocomplete),
          Uri.parse('http://www.kde.org/api/v1/users.autocomplete'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersRemoveOtherTokens),
          Uri.parse('http://www.kde.org/api/v1/users.removeOtherTokens'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersSetActiveStatus),
          Uri.parse('http://www.kde.org/api/v1/users.setActiveStatus'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersResetTOTP),
          Uri.parse('http://www.kde.org/api/v1/users.resetTOTP'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersResetE2EKey),
          Uri.parse('http://www.kde.org/api/v1/users.resetE2EKey'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatDelete),
          Uri.parse('http://www.kde.org/api/v1/chat.delete'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatGetMessage),
          Uri.parse('http://www.kde.org/api/v1/chat.getMessage'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatPinMessage),
          Uri.parse('http://www.kde.org/api/v1/chat.pinMessage'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatPostMessage),
          Uri.parse('http://www.kde.org/api/v1/chat.postMessage'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatReact),
          Uri.parse('http://www.kde.org/api/v1/chat.react'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatIgnoreUser),
          Uri.parse('http://www.kde.org/api/v1/chat.ignoreUser'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatStarMessage),
          Uri.parse('http://www.kde.org/api/v1/chat.starMessage'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatUnPinMessage),
          Uri.parse('http://www.kde.org/api/v1/chat.unPinMessage'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatUnStarMessage),
          Uri.parse('http://www.kde.org/api/v1/chat.unStarMessage'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatUpdate),
          Uri.parse('http://www.kde.org/api/v1/chat.update'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatSearch),
          Uri.parse('http://www.kde.org/api/v1/chat.search'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatReportMessage),
          Uri.parse('http://www.kde.org/api/v1/chat.reportMessage'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatFollowMessage),
          Uri.parse('http://www.kde.org/api/v1/chat.followMessage'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatUnFollowMessage),
          Uri.parse('http://www.kde.org/api/v1/chat.unfollowMessage'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatGetThreadsList),
          Uri.parse('http://www.kde.org/api/v1/chat.getThreadsList'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatSyncThreadMessages),
          Uri.parse('http://www.kde.org/api/v1/chat.syncThreadMessages'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatGetThreadMessages),
          Uri.parse('http://www.kde.org/api/v1/chat.getThreadMessages'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatSyncThreadsList),
          Uri.parse('http://www.kde.org/api/v1/chat.syncThreadsList'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatGetDeletedMessage),
          Uri.parse('http://www.kde.org/api/v1/chat.getDeletedMessages'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatSendMessage),
          Uri.parse('http://www.kde.org/api/v1/chat.sendMessage'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatMessageReadReceipts),
          Uri.parse('http://www.kde.org/api/v1/chat.getMessageReadReceipts'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatGetPinnedMessages),
          Uri.parse('http://www.kde.org/api/v1/chat.getPinnedMessages'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatGetMentionedMessages),
          Uri.parse('http://www.kde.org/api/v1/chat.getMentionedMessages'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatGetStarredMessages),
          Uri.parse('http://www.kde.org/api/v1/chat.getStarredMessages'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatGetSnippetedMessages),
          Uri.parse('http://www.kde.org/api/v1/chat.getSnippetedMessages'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.chatSyncMessages),
          Uri.parse('http://www.kde.org/api/v1/chat.syncMessages'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsAddAll),
          Uri.parse('http://www.kde.org/api/v1/channels.addAll'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsAddLeader),
          Uri.parse('http://www.kde.org/api/v1/channels.addLeader'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsRemoveLeader),
          Uri.parse('http://www.kde.org/api/v1/channels.removeLeader'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsAddModerator),
          Uri.parse('http://www.kde.org/api/v1/channels.addModerator'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsAddOwner),
          Uri.parse('http://www.kde.org/api/v1/channels.addOwner'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsArchive),
          Uri.parse('http://www.kde.org/api/v1/channels.archive'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsModerators),
          Uri.parse('http://www.kde.org/api/v1/channels.moderators'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsClose),
          Uri.parse('http://www.kde.org/api/v1/channels.close'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsCreate),
          Uri.parse('http://www.kde.org/api/v1/channels.create'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsGetIntegrations),
          Uri.parse('http://www.kde.org/api/v1/channels.getIntegrations'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsHistory),
          Uri.parse('http://www.kde.org/api/v1/channels.history'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsInfo),
          Uri.parse('http://www.kde.org/api/v1/channels.info'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsInvite),
          Uri.parse('http://www.kde.org/api/v1/channels.invite'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsKick),
          Uri.parse('http://www.kde.org/api/v1/channels.kick'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsLeave),
          Uri.parse('http://www.kde.org/api/v1/channels.leave'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsList),
          Uri.parse('http://www.kde.org/api/v1/channels.list'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsListJoined),
          Uri.parse('http://www.kde.org/api/v1/channels.list.joined'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsOpen),
          Uri.parse('http://www.kde.org/api/v1/channels.open'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsJoin),
          Uri.parse('http://www.kde.org/api/v1/channels.join'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsRemoveModerator),
          Uri.parse('http://www.kde.org/api/v1/channels.removeModerator'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsRemoveOwner),
          Uri.parse('http://www.kde.org/api/v1/channels.removeOwner'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsRename),
          Uri.parse('http://www.kde.org/api/v1/channels.rename'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsSetDescription),
          Uri.parse('http://www.kde.org/api/v1/channels.setDescription'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsSetJoinCode),
          Uri.parse('http://www.kde.org/api/v1/channels.setJoinCode'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsRoles),
          Uri.parse('http://www.kde.org/api/v1/channels.roles'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsSetPurpose),
          Uri.parse('http://www.kde.org/api/v1/channels.setPurpose'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsSetReadOnly),
          Uri.parse('http://www.kde.org/api/v1/channels.setReadOnly'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsSetTopic),
          Uri.parse('http://www.kde.org/api/v1/channels.setTopic'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsSetType),
          Uri.parse('http://www.kde.org/api/v1/channels.setType'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsUnarchive),
          Uri.parse('http://www.kde.org/api/v1/channels.unarchive'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsSetAnnouncement),
          Uri.parse('http://www.kde.org/api/v1/channels.setAnnouncement'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsFiles),
          Uri.parse('http://www.kde.org/api/v1/channels.files'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsMembers),
          Uri.parse('http://www.kde.org/api/v1/channels.members'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsCounters),
          Uri.parse('http://www.kde.org/api/v1/channels.counters'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsDelete),
          Uri.parse('http://www.kde.org/api/v1/channels.delete'));
      expect(
          librocketchatrestapi.generateUrl("http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.channelsGetAllUserMentionsByChannel),
          Uri.parse('http://www.kde.org/api/v1/channels.getAllUserMentionsByChannel'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsOnline),
          Uri.parse('http://www.kde.org/api/v1/channels.online'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsAddAll),
          Uri.parse('http://www.kde.org/api/v1/groups.addAll'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsAddModerator),
          Uri.parse('http://www.kde.org/api/v1/groups.addModerator'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsAddOwner),
          Uri.parse('http://www.kde.org/api/v1/groups.addOwner'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsArchive),
          Uri.parse('http://www.kde.org/api/v1/groups.archive'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsClose),
          Uri.parse('http://www.kde.org/api/v1/groups.close'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsCreate),
          Uri.parse('http://www.kde.org/api/v1/groups.create'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsGetIntegrations),
          Uri.parse('http://www.kde.org/api/v1/groups.getIntegrations'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsHistory),
          Uri.parse('http://www.kde.org/api/v1/groups.history'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsInfo),
          Uri.parse('http://www.kde.org/api/v1/groups.info'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsInvite),
          Uri.parse('http://www.kde.org/api/v1/groups.invite'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsKick),
          Uri.parse('http://www.kde.org/api/v1/groups.kick'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsLeave),
          Uri.parse('http://www.kde.org/api/v1/groups.leave'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsList),
          Uri.parse('http://www.kde.org/api/v1/groups.list'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsOpen),
          Uri.parse('http://www.kde.org/api/v1/groups.open'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsRemoveModerator),
          Uri.parse('http://www.kde.org/api/v1/groups.removeModerator'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupRemoveOwner),
          Uri.parse('http://www.kde.org/api/v1/groups.removeOwner'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsRename),
          Uri.parse('http://www.kde.org/api/v1/groups.rename'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsSetDescription),
          Uri.parse('http://www.kde.org/api/v1/groups.setDescription'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsSetPurpose),
          Uri.parse('http://www.kde.org/api/v1/groups.setPurpose'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsSetReadOnly),
          Uri.parse('http://www.kde.org/api/v1/groups.setReadOnly'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsSetTopic),
          Uri.parse('http://www.kde.org/api/v1/groups.setTopic'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsSetType),
          Uri.parse('http://www.kde.org/api/v1/groups.setType'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsListAll),
          Uri.parse('http://www.kde.org/api/v1/groups.listAll'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsMembers),
          Uri.parse('http://www.kde.org/api/v1/groups.members'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsUnarchive),
          Uri.parse('http://www.kde.org/api/v1/groups.unarchive'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsSetAnnouncement),
          Uri.parse('http://www.kde.org/api/v1/groups.setAnnouncement'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsRoles),
          Uri.parse('http://www.kde.org/api/v1/groups.roles'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsCounters),
          Uri.parse('http://www.kde.org/api/v1/groups.counters'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupRemoveLeader),
          Uri.parse('http://www.kde.org/api/v1/groups.removeLeader'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsAddLeader),
          Uri.parse('http://www.kde.org/api/v1/groups.addLeader'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsDelete),
          Uri.parse('http://www.kde.org/api/v1/groups.delete'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsSetEncrypted),
          Uri.parse('http://www.kde.org/api/v1/groups.setEncrypted'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.serverInfo),
          Uri.parse('http://www.kde.org/api/v1/info'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.settings),
          Uri.parse('http://www.kde.org/api/v1/settings'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.updateAdminSettings),
          Uri.parse('http://www.kde.org/api/v1/settings'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.settingsPublic),
          Uri.parse('http://www.kde.org/api/v1/settings.public'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.roomsUpload),
          Uri.parse('http://www.kde.org/api/v1/rooms.upload'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.spotlight),
          Uri.parse('http://www.kde.org/api/v1/spotlight'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.imClose),
          Uri.parse('http://www.kde.org/api/v1/im.close'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.imCreate),
          Uri.parse('http://www.kde.org/api/v1/im.create'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.imHistory),
          Uri.parse('http://www.kde.org/api/v1/im.history'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.imMessages),
          Uri.parse('http://www.kde.org/api/v1/im.messages'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.imMembers),
          Uri.parse('http://www.kde.org/api/v1/im.members'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.imOpen),
          Uri.parse('http://www.kde.org/api/v1/im.open'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.imSetTopic),
          Uri.parse('http://www.kde.org/api/v1/im.setTopic'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.imFiles),
          Uri.parse('http://www.kde.org/api/v1/im.files'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.imDelete),
          Uri.parse('http://www.kde.org/api/v1/im.delete'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.loadEmojiCustom),
          Uri.parse('http://www.kde.org/api/v1/emoji-custom.list'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.emojiCustomDelete),
          Uri.parse('http://www.kde.org/api/v1/emoji-custom.delete'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.emojiCustomCreate),
          Uri.parse('http://www.kde.org/api/v1/emoji-custom.create'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.emojiCustomUpdate),
          Uri.parse('http://www.kde.org/api/v1/emoji-custom.update'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.emojiCustomAll),
          Uri.parse('http://www.kde.org/api/v1/emoji-custom.all'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.roomsSaveNotification),
          Uri.parse('http://www.kde.org/api/v1/rooms.saveNotification'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.roomsSaveSettings),
          Uri.parse('http://www.kde.org/api/v1/rooms.saveRoomSettings'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.roomsAdminRooms),
          Uri.parse('http://www.kde.org/api/v1/rooms.adminRooms'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.roomsAdminRoomsGetRoom),
          Uri.parse('http://www.kde.org/api/v1/rooms.adminRooms.getRoom'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.subscriptionsRead),
          Uri.parse('http://www.kde.org/api/v1/subscriptions.read'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.subscriptionsUnRead),
          Uri.parse('http://www.kde.org/api/v1/subscriptions.unread'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.roomsGet),
          Uri.parse('http://www.kde.org/api/v1/rooms.get'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.roomsFavorite),
          Uri.parse('http://www.kde.org/api/v1/rooms.favorite'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.roomsCleanHistory),
          Uri.parse('http://www.kde.org/api/v1/rooms.cleanHistory'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.roomsInfo),
          Uri.parse('http://www.kde.org/api/v1/rooms.info'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.roomsLeave),
          Uri.parse('http://www.kde.org/api/v1/rooms.leave'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.roomsCreateDiscussion),
          Uri.parse('http://www.kde.org/api/v1/rooms.createDiscussion'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.roomsGetDiscussions),
          Uri.parse('http://www.kde.org/api/v1/rooms.getDiscussions'));
      expect(
          librocketchatrestapi.generateUrl("http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.roomsAutocompleteChannelAndPrivate),
          Uri.parse('http://www.kde.org/api/v1/rooms.autocomplete.channelAndPrivate'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.roomsExport),
          Uri.parse('http://www.kde.org/api/v1/rooms.export'));
      expect(
          librocketchatrestapi.generateUrl("http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.roomsChangeArchivactionState),
          Uri.parse('http://www.kde.org/api/v1/rooms.changeArchivationState'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.roomsDelete),
          Uri.parse('http://www.kde.org/api/v1/rooms.delete'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.forgotPassword),
          Uri.parse('http://www.kde.org/api/v1/users.forgotPassword'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.commandsList),
          Uri.parse('http://www.kde.org/api/v1/commands.list'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.commandsGet),
          Uri.parse('http://www.kde.org/api/v1/commands.get'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.commandsRun),
          Uri.parse('http://www.kde.org/api/v1/commands.run'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.commandsPreview),
          Uri.parse('http://www.kde.org/api/v1/commands.preview'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.e2EfetchMyKeys),
          Uri.parse('http://www.kde.org/api/v1/e2e.fetchMyKeys'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.e2EupdateGroupKey),
          Uri.parse('http://www.kde.org/api/v1/e2e.updateGroupKey'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.e2ESetRoomKeyID),
          Uri.parse('http://www.kde.org/api/v1/e2e.setRoomKeyID'));
      expect(
          librocketchatrestapi.generateUrl("http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.e2ESetUserPublicAndPrivateKeys),
          Uri.parse('http://www.kde.org/api/v1/e2e.setUserPublicAndPrivateKeys'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.e2ERequestSubscriptionKeys),
          Uri.parse('http://www.kde.org/api/v1/e2e.requestSubscriptionKeys'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.e2EResetOwnE2EKey),
          Uri.parse('http://www.kde.org/api/v1/e2e.resetOwnE2EKey'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.e2EAcceptSuggestedGroupKey),
          Uri.parse('http://www.kde.org/api/v1/e2e.acceptSuggestedGroupKey'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.e2ERejectSuggestedGroupKey),
          Uri.parse('http://www.kde.org/api/v1/e2e.rejectSuggestedGroupKey'));
      expect(
          librocketchatrestapi.generateUrl("http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.e2EProvideUsersWithSuggestedGroupKeys),
          Uri.parse('http://www.kde.org/api/v1/e2e.provideUsersWithSuggestedGroupKeys'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.e2EResetRoomKey),
          Uri.parse('http://www.kde.org/api/v1/e2e.resetRoomKey'));

      expect(
          librocketchatrestapi.generateUrl("http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.e2EFetchUsersWaitingForGroupKey),
          Uri.parse('http://www.kde.org/api/v1/e2e.provideUsersSuggestedGroupKeys'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.rolesList),
          Uri.parse('http://www.kde.org/api/v1/roles.list'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.rolesSync),
          Uri.parse('http://www.kde.org/api/v1/roles.sync'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.rolesCreate),
          Uri.parse('http://www.kde.org/api/v1/roles.create'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.rolesUpdate),
          Uri.parse('http://www.kde.org/api/v1/roles.update'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.rolesDelete),
          Uri.parse('http://www.kde.org/api/v1/roles.delete'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.rolesAddUserToRole),
          Uri.parse('http://www.kde.org/api/v1/roles.addUserToRole'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.rolesGetusersInRole),
          Uri.parse('http://www.kde.org/api/v1/roles.getUsersInRole'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.rolesRemoveUserFromRole),
          Uri.parse('http://www.kde.org/api/v1/roles.removeUserFromRole'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.videoConfJitsi),
          Uri.parse('http://www.kde.org/api/v1/video-conference/jitsi.update-timeout'));

      expect(
          librocketchatrestapi.generateUrl("http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.autoTranslateGetSupportedLanguages),
          Uri.parse('http://www.kde.org/api/v1/autotranslate.getSupportedLanguages'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.autoTranslateSaveSettings),
          Uri.parse('http://www.kde.org/api/v1/autotranslate.saveSettings'));
      expect(
          librocketchatrestapi.generateUrl("http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.autoTranslateTranslateMessage),
          Uri.parse('http://www.kde.org/api/v1/autotranslate.translateMessage'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.customUserStatusList),
          Uri.parse('http://www.kde.org/api/v1/custom-user-status.list'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.customUserStatusCreate),
          Uri.parse('http://www.kde.org/api/v1/custom-user-status.create'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.customUserStatusDelete),
          Uri.parse('http://www.kde.org/api/v1/custom-user-status.delete'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.customUserStatusUpdate),
          Uri.parse('http://www.kde.org/api/v1/custom-user-status.update'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.customSoundsList),
          Uri.parse('http://www.kde.org/api/v1/custom-sounds.list'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.findOrCreateInvite),
          Uri.parse('http://www.kde.org/api/v1/findOrCreateInvite'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.listInvites),
          Uri.parse('http://www.kde.org/api/v1/listInvites'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.removeInvite),
          Uri.parse('http://www.kde.org/api/v1/removeInvite'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.useInviteToken),
          Uri.parse('http://www.kde.org/api/v1/useInviteToken'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.validateInviteToken),
          Uri.parse('http://www.kde.org/api/v1/validateInviteToken'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.sendInvitationEmails),
          Uri.parse('http://www.kde.org/api/v1/sendInvitationEmail'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.users2FASendEmailCode),
          Uri.parse('http://www.kde.org/api/v1/users.2fa.sendEmailCode'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.users2FAEnableEmail),
          Uri.parse('http://www.kde.org/api/v1/users.2fa.enableEmail'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.users2FADisableEmail),
          Uri.parse('http://www.kde.org/api/v1/users.2fa.disableEmail'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersDeleteOwnAccount),
          Uri.parse('http://www.kde.org/api/v1/users.deleteOwnAccount'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersSetPreferences),
          Uri.parse('http://www.kde.org/api/v1/users.setPreferences'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.permissionsListAll),
          Uri.parse('http://www.kde.org/api/v1/permissions.listAll'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.permissionsUpdate),
          Uri.parse('http://www.kde.org/api/v1/permissions.update'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.statistics),
          Uri.parse('http://www.kde.org/api/v1/statistics'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.directory),
          Uri.parse('http://www.kde.org/api/v1/directory'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.teamsList),
          Uri.parse('http://www.kde.org/api/v1/teams.list'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.teamsListAll),
          Uri.parse('http://www.kde.org/api/v1/teams.listAll'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.teamsCreate),
          Uri.parse('http://www.kde.org/api/v1/teams.create'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.teamsAddRooms),
          Uri.parse('http://www.kde.org/api/v1/teams.addRooms'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.teamsRemoveRoom),
          Uri.parse('http://www.kde.org/api/v1/teams.removeRoom'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.teamsListRooms),
          Uri.parse('http://www.kde.org/api/v1/teams.listRooms'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.teamsUpdateRoom),
          Uri.parse('http://www.kde.org/api/v1/teams.updateRoom'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.teamsListRoomsOfUsers),
          Uri.parse('http://www.kde.org/api/v1/teams.listRoomsOfUser'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.teamsMembers),
          Uri.parse('http://www.kde.org/api/v1/teams.members'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.teamsAddMembers),
          Uri.parse('http://www.kde.org/api/v1/teams.addMembers'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.teamsUpdateMember),
          Uri.parse('http://www.kde.org/api/v1/teams.updateMember'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.teamsRemoveMember),
          Uri.parse('http://www.kde.org/api/v1/teams.removeMember'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.teamsLeave),
          Uri.parse('http://www.kde.org/api/v1/teams.leave'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.teamsInfo),
          Uri.parse('http://www.kde.org/api/v1/teams.info'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.teamsDelete),
          Uri.parse('http://www.kde.org/api/v1/teams.delete'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.teamsAutocomplete),
          Uri.parse('http://www.kde.org/api/v1/teams.autocomplete'));
      expect(
          librocketchatrestapi.generateUrl("http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.roomsAutocompleteAvailableForTeams),
          Uri.parse('http://www.kde.org/api/v1/rooms.autocomplete.availableForTeams'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.channelsConvertToTeam),
          Uri.parse('http://www.kde.org/api/v1/channels.convertToTeam'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.groupsConvertToTeam),
          Uri.parse('http://www.kde.org/api/v1/groups.convertToTeam'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.stdoutQueue),
          Uri.parse('http://www.kde.org/api/v1/stdout.queue'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.teamsConvertToChannel),
          Uri.parse('http://www.kde.org/api/v1/teams.convertToChannel'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.oauthAppsList),
          Uri.parse('http://www.kde.org/api/v1/oauth-apps.list'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.oauthAppsGet),
          Uri.parse('http://www.kde.org/api/v1/oauth-apps.get'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.oauthAppsCreate),
          Uri.parse('http://www.kde.org/api/v1/oauth-apps.create'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.oauthAppsUpdate),
          Uri.parse('http://www.kde.org/api/v1/oauth-apps.update'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.oauthAppsDelete),
          Uri.parse('http://www.kde.org/api/v1/oauth-apps.delete'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.settingsOauth),
          Uri.parse('http://www.kde.org/api/v1/settings.oauth'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.settingsAddCustomOauth),
          Uri.parse('http://www.kde.org/api/v1/settings.addCustomOAuth'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.licensesGet),
          Uri.parse('http://www.kde.org/api/v1/licenses.get'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.licensesMaxActiveusers),
          Uri.parse('http://www.kde.org/api/v1/licenses.maxActiveUsers'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.licensesAdd),
          Uri.parse('http://www.kde.org/api/v1/licenses.add'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.licensesIsEntreprise),
          Uri.parse('http://www.kde.org/api/v1/licenses.isEnterprise'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.licensesInfo),
          Uri.parse('http://www.kde.org/api/v1/licenses.info'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.bannersDismiss),
          Uri.parse('http://www.kde.org/api/v1/banners.dismiss'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.banners),
          Uri.parse('http://www.kde.org/api/v1/banners'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.sessionsList),
          Uri.parse('http://www.kde.org/api/v1/sessions/list'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.sessionsInfo),
          Uri.parse('http://www.kde.org/api/v1/sessions/info'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.sessionsListAll),
          Uri.parse('http://www.kde.org/api/v1/sessions/list.all'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.sessionsLogoutMe),
          Uri.parse('http://www.kde.org/api/v1/sessions/logout.me'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.sessionsLogout),
          Uri.parse('http://www.kde.org/api/v1/sessions/logout'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.sessionsInfoAdmin),
          Uri.parse('http://www.kde.org/api/v1/sessions/info.admin'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.userRequestDataDownload),
          Uri.parse('http://www.kde.org/api/v1/users.requestDataDownload'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.videoConferenceStart),
          Uri.parse('http://www.kde.org/api/v1/video-conference.start'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.videoConferenceJoin),
          Uri.parse('http://www.kde.org/api/v1/video-conference.join'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.videoConferenceCancel),
          Uri.parse('http://www.kde.org/api/v1/video-conference.cancel'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.videoConferenceInfo),
          Uri.parse('http://www.kde.org/api/v1/video-conference.info'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.videoConferenceList),
          Uri.parse('http://www.kde.org/api/v1/video-conference.list'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.videoConferenceProviders),
          Uri.parse('http://www.kde.org/api/v1/video-conference.providers'));
      expect(
          librocketchatrestapi.generateUrl("http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.videoConferenceCapabilities),
          Uri.parse('http://www.kde.org/api/v1/video-conference.capabilities'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.moderationReportsByusers),
          Uri.parse('http://www.kde.org/api/v1/moderation.reportsByUsers'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.moderationDismissReports),
          Uri.parse('http://www.kde.org/api/v1/moderation.dismissReports'));
      expect(
          librocketchatrestapi.generateUrl("http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.moderationUserReportedMessages),
          Uri.parse('http://www.kde.org/api/v1/moderation.user.reportedMessages'));
      expect(
          librocketchatrestapi.generateUrl("http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.moderationUserDeleteReportedMessages),
          Uri.parse('http://www.kde.org/api/v1/moderation.user.deleteReportedMessages'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.moderationReports),
          Uri.parse('http://www.kde.org/api/v1/moderation.reports'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.moderationReportInfo),
          Uri.parse('http://www.kde.org/api/v1/moderation.reportInfo'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.moderationUserReports),
          Uri.parse('http://www.kde.org/api/v1/moderation.userReports'));
      expect(
          librocketchatrestapi.generateUrl("http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.moderationUserReportsByUserId),
          Uri.parse('http://www.kde.org/api/v1/moderation.user.reportsByUserId'));
      expect(
          librocketchatrestapi.generateUrl("http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.moderationDismissUserReports),
          Uri.parse('http://www.kde.org/api/v1/moderation.dismissUserReports'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.moderationReportUser),
          Uri.parse('http://www.kde.org/api/v1/moderation.reportUser'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.roomsNameExists),
          Uri.parse('http://www.kde.org/api/v1/rooms.nameExists'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.methodCall),
          Uri.parse('http://www.kde.org/api/v1/method.call'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.methodCallAnon),
          Uri.parse('http://www.kde.org/api/v1/method.callAnon'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.appsUiInteraction,
              librocketchatrestapi.RestApiUrlExtensionType.apps),
          Uri.parse('http://www.kde.org/api/apps/ui.interaction'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersLogoutOtherClients),
          Uri.parse('http://www.kde.org/api/v1/users.logoutOtherClients'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.roomsMuteUser),
          Uri.parse('http://www.kde.org/api/v1/rooms.muteUser'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.roomsUnmuteUser),
          Uri.parse('http://www.kde.org/api/v1/rooms.unmuteUser'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.categoriesApps,
              librocketchatrestapi.RestApiUrlExtensionType.apps),
          Uri.parse('http://www.kde.org/api/apps/categories'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.featuredApps,
              librocketchatrestapi.RestApiUrlExtensionType.apps),
          Uri.parse('http://www.kde.org/api/apps/featured-apps'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.countApps,
              librocketchatrestapi.RestApiUrlExtensionType.apps),
          Uri.parse('http://www.kde.org/api/apps/count'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.notifyAdminsApps,
              librocketchatrestapi.RestApiUrlExtensionType.apps),
          Uri.parse('http://www.kde.org/api/apps/notify-admins'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.installedApps,
              librocketchatrestapi.RestApiUrlExtensionType.apps),
          Uri.parse('http://www.kde.org/api/apps/installed'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org",
              librocketchatrestapi.RestApiUrlType.marketplaceApps,
              librocketchatrestapi.RestApiUrlExtensionType.apps),
          Uri.parse('http://www.kde.org/api/apps/marketplace'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersListByStatus),
          Uri.parse('http://www.kde.org/api/v1/users.listByStatus'));
      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.usersSendWelcomeEmail),
          Uri.parse('http://www.kde.org/api/v1/users.sendWelcomeEmail'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.roomsImages),
          Uri.parse('http://www.kde.org/api/v1/rooms.images'));

      expect(
          librocketchatrestapi.generateUrl(
              "http://www.kde.org", librocketchatrestapi.RestApiUrlType.roomsMembersOrderedByRole),
          Uri.parse('http://www.kde.org/api/v1/rooms.membersOrderedByRole'));
    });
  });
}
