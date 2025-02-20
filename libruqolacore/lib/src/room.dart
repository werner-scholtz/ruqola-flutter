/*
 * SPDX-FileCopyrightText: 2024-2025 Laurent Montel <laurent.montel@kdab.com>
 *
 * SPDX-License-Identifier: LGPL-2.0-or-later
 */

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:libruqolacore/src/avatarinfo.dart';
import 'package:libruqolacore/src/message/message.dart';
import 'package:libruqolacore/src/teams/teaminfo.dart';

// t (can take values "d" , "c" or "p" or "l")
enum RoomType {
  unknown,
  direct,
  channel,
  private,
  // Omnichannel ?
}

// Add state
enum RoomState {
  none(0),
  readOnly(1),
  selected(2),
  favorite(4),
  open(8),
  alert(16),
  blocker(32),
  archived(64),
  blocked(128),
  encrypted(256),
  joinCodeRequired(512),
  wasInitialized(1024),
  broadCast(2048),
  autoTranslate(4096);

  final int value;
  const RoomState(this.value);
}

class Room with ChangeNotifier {
  String displayName() {
    /*
            if (mRocketChatAccount) {
                if (mRocketChatAccount->useRealName()) {
                    return r->displayFName();
                } else {
                    if (mChannelType == RoomType.direct) {
                        return mName;
                    } else {
                  */
    if (fName != null && fName!.isEmpty) {
      return fName!;
    } else {
      return name;
    }
/*                
                    }
                }
            } else {
                return r->name();
            }
*/
  }

  void roomTypeFromString(String type) {
    if (type == "p") {
      channelType = RoomType.private;
    } else if (type == "c") {
      channelType = RoomType.channel;
    } else if (type == "d") {
      channelType = RoomType.direct;
    } else {
      channelType = RoomType.unknown;
    }
  }

  /*
AvatarInfo avatarInfo()
{
    if (mCurrentAvatarInfo.isValid()) {
        return mCurrentAvatarInfo;
    }
    // TODO direct channel or group channel
    Utils::AvatarInfo info;
    info.etag = QString::fromLatin1(mAvatarETag);
    // Group => uids >= 3
    if (mUids.count() > 2) {
        QString identifier;
        for (const QString &username : mUserNames) {
            identifier.append(username);
        }
        identifier.prepend(QString::number(mUids.count()));
        info.avatarType = Utils::AvatarType::User;
        info.identifier = identifier;
    } else if (mUids.count() == 2) {
        info.avatarType = Utils::AvatarType::User;
        if (mRocketChatAccount) {
            QString otherUserName;
            for (const QString &userName : mUserNames) {
                if (userName != mRocketChatAccount->userName()) {
                    otherUserName = userName;
                }
            }
            info.identifier = otherUserName;
        }
    } else {
        info.avatarType = Utils::AvatarType::Room;
        info.identifier = QString::fromLatin1(mRoomId);
    }
    mCurrentAvatarInfo = info;
    return mCurrentAvatarInfo;
}
    */

  void parseSubscriptionRoom(Map<String, dynamic> map) {
    roomId = map["rid"].toString();
    name = map["name"].toString();
    open = map["open"];
    alert = map["alert"];
    fName = map["fname"];
    if (map.containsKey("ro")) {
      readOnly = map["ro"];
    }

    if (map.containsKey("blocker")) {
      blocker = map["blocker"];
    } else {
      blocker = false;
    }
    if (map.containsKey("blocked")) {
      blocked = map["blocked"];
    } else {
      blocked = false;
    }

    if (map.containsKey("encrypted")) {
      encrypted = map["encrypted"];
    } else {
      encrypted = false;
    }

    if (map.containsKey("f")) {
      favorite = map["f"];
    }
    roomTypeFromString(map["t"] ?? '');

    print("$this");
    notifyListeners();
  }

  void notify() {
    notifyListeners();
  }

  void parseInsertRoom(Map<String, dynamic> map) {
    roomId = map["_id"].toString();
    name = map["name"].toString();
    open = map["open"];
    alert = map["alert"];
    fName = map["fname"];
    if (map.containsKey("ro")) {
      readOnly = map["ro"];
    }

    if (map.containsKey("announcement")) {
      announcement = map["announcement"];
    }
    if (map.containsKey("description")) {
      description = map["description"];
    }
    unread = map["unread"];

    if (map.containsKey("f")) {
      favorite = map["f"];
    }

    if (map.containsKey("tunread")) {
      threadUnread =
          (jsonDecode(map["tunread"]) as List<dynamic>).cast<String>();
    }

    autoTranslate = map["autoTranslate"] ?? false;

    roomTypeFromString(map["t"] ?? '');
    teamInfo = TeamInfo.fromJson(map);
    autotranslateLanguage = map["autoTranslateLanguage"];
    if (map.containsKey("userMentions")) {
      userMentions = map["userMentions"] ?? 0;
    }

    if (map.containsKey("groupMentions")) {
      groupMentions = map["groupMentions"] ?? 0;
    }
/*
    setJitsiTimeout(Utils::parseDate(QStringLiteral("jitsiTimeout"), json));
    // topic/announcement/description is not part of update subscription

    if (json.contains("tunread"_L1)) {
        setThreadUnread(extractStringList(json, "tunread"_L1));
    }
    setUpdatedAt(Utils::parseDate(QStringLiteral("_updatedAt"), json));
    setLastSeenAt(Utils::parseDate(QStringLiteral("ls"), json));
    setLastMessageAt(Utils::parseDate(QStringLiteral("lm"), json));


    parseBlockerArchived(json);

    // setE2eKeyId(json["e2eKeyId"_L1].toString());
    setE2EKey(json["E2EKey"_L1].toString());

    if (json.contains("encrypted"_L1)) {
        setEncrypted(json["encrypted"_L1].toBool());
    } else {
        setEncrypted(false);
    }

    parseCommonData(json);
    parseDisplaySystemMessage(json);

    const QJsonValue ownerValue = json.value("u"_L1);
    if (!ownerValue.isUndefined()) {
        const QJsonObject objOwner = ownerValue.toObject();
        setRoomCreatorUserId(objOwner.value("_id"_L1).toString().toLatin1());
        setRoomCreatorUserName(objOwner.value("username"_L1).toString());
    } else {
        // When room is initialized we are the owner. When we update room we have the real
        // owner and if it's empty => we need to clear it.
        setRoomCreatorUserId(QByteArray());
        setRoomCreatorUserName(QString());
    }
    // qDebug() << " *thus" << *this;
    mNotificationOptions.parseNotificationOptions(json);
*/

    notifyListeners();
  }

  void parseUpdateRoom(Map<String, dynamic> map) {
    if (map.containsKey("alert")) {
      alert = map["alert"];
    }
    if (map.containsKey("f")) {
      favorite = map["f"];
    }
    if (map.containsKey("unread")) {
      unread = map["unread"];
    }
    if (map.containsKey("announcement")) {
      announcement = map["announcement"];
    }

    if (map.containsKey("open")) {
      open = map["open"];
    }
    if (map.containsKey("topic")) {
      topic = map["topic"];
    }
    if (map.containsKey("name")) {
      name = map["name"];
    }
    if (map.containsKey("description")) {
      description = map["description"];
    }
    if (map.containsKey("fname")) {
      fName = map["fname"];
    }
    readOnly = map["ro"] ?? false;
    if (map.containsKey("rid")) {
      roomId = map["rid"];
    }
    if (map.containsKey("msgs")) {
      numberMessages = map["msgs"];
    }
    if (map.containsKey("autoTranslate")) {
      autoTranslate = map["autoTranslate"];
    }

    encrypted = map["encrypted"] ?? false;

    if (map.containsKey("userMentions")) {
      userMentions = map["userMentions"] ?? 0;
    }
    if (map.containsKey("groupMentions")) {
      groupMentions = map["groupMentions"] ?? 0;
    }

    if (map.containsKey("autoTranslateLanguage")) {
      autotranslateLanguage = map["autoTranslateLanguage"];
    }
/*
    setJitsiTimeout(Utils::parseDate(QStringLiteral("jitsiTimeout"), map));

    if (map.containsKey("joinCodeRequired")) {
        setJoinCodeRequired(map["joinCodeRequired"].toBool());
    } else {
        setJoinCodeRequired(false);
    }

    parseBlockerArchived(map);
    if (map.containsKey("blocked")) {
        setBlocked(map["blocked"].toBool());
    } else {
        setBlocked(false);
    }


    // TODO verify it. add autotest
    if (map.containsKey("broadcast")) {
        setBroadcast(map["broadcast"].toBool());
    } else {
        setBroadcast(false);
    }
    
    const qint64 result = Utils::parseDate(QStringLiteral("ls"), map);
    if (result != -1) {
        setLastSeenAt(result);
    }
    const qint64 lm = Utils::parseDate(QStringLiteral("lm"), map);
    if (lm != -1) {
        setLastMessageAt(lm);
    }

    setHighlightsWord(extractStringList(map, "userHighlights"));

    if (map.containsKey("ignored")) {
        setIgnoredUsers(extractStringList(map, "ignored"));
    }

    // TODO E2EKey
    setE2eKeyId(map["e2eKeyId"]);

    const QJsonValue ownerValue = map.value("u");
    if (!ownerValue.isUndefined()) {
        const QJsonObject objOwner = ownerValue.toObject();
        setRoomCreatorUserId(objOwner.value("_id").toLatin1());
        setRoomCreatorUserName(objOwner.value("username"));
    } else {
        // When room is initialized we are the owner. When we update room we have the real
        // owner and if it's empty => we need to clear it.
        setRoomCreatorUserId(QByteArray());
        setRoomCreatorUserName(QString());
    }
    if (map.containsKey("prid")) {
        setParentRid(map["prid"].toLatin1());
    }
    if (map.containsKey("uids")) {
        const QJsonArray &uidsArray = map["uids"].toArray();
        const auto &u0 = uidsArray[0].toLatin1();
        const auto &u1 = uidsArray[1].toLatin1();
        setDirectChannelUserId((u0 == mRocketChatAccount->userId()) ? u1 : u0);

        QStringList lstUids;
        lstUids.reserve(uidsArray.count());
        for (int i = 0; i < uidsArray.count(); ++i) {
            lstUids << uidsArray.at(i);
        }
        setUids(lstUids);
    }

    const QJsonArray userNamesArray = map.value("usernames").toArray();
    QStringList lstUserNames;
    const int nbUserNamesArray = userNamesArray.count();
    lstUserNames.reserve(nbUserNamesArray);
    for (int i = 0; i < nbUserNamesArray; ++i) {
        lstUserNames << userNamesArray.at(i);
    }
    setUserNames(lstUserNames);

    setMutedUsers(extractStringList(map, "muted"));
    parseDisplaySystemMessage(map);
    parseRetentionInfo(map);
*/
    avatarETag = map["avatarETag"] ?? '';
    teamInfo = TeamInfo.fromJson(map);
    notifyListeners();
  }

  // Roles
  List<String>? roles;

  List<String>? uids;
  List<String>? userNames;
  List<String>? threadUnread;

  String roomId = "";
  // name
  String name = "";

  String? fName;

  // topic
  String topic = "";

  // Description
  String? description;

  // Announcement
  String? announcement;

  String? parentRid;

  String? autotranslateLanguage;

  String avatarETag = "";

  int numberMessages = 0;

  int groupMentions = 0;
  int userMentions = 0;
  int unread = 0;
  bool open = true;
  bool alert = false;
  bool readOnly = false;
  bool favorite = false;

  bool wasInitialized = false;
  bool blocker = false;
  bool blocked = false;
  bool encrypted = false;
  bool autoTranslate = false;

  RoomType channelType = RoomType.unknown;
  TeamInfo teamInfo = TeamInfo.defaultValues();
  List<Message> messages = [];

  @override
  String toString() {
    return "Room(avatarETag: $avatarETag, roomId: $roomId  name: $name open: $open mAnnouncement: $announcement mReadOnly: $readOnly mAlert: $alert, number of message:${messages.length}, teamInfo: $teamInfo, groupMentions: $groupMentions, userMentions $userMentions)";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Room &&
        roles == other.roles &&
        roomId == other.roomId &&
        uids == other.uids &&
        userNames == other.userNames &&
        threadUnread == other.threadUnread &&
        name == other.name &&
        fName == other.fName &&
        topic == other.topic &&
        description == other.description &&
        announcement == other.announcement &&
        parentRid == other.parentRid &&
        autotranslateLanguage == other.autotranslateLanguage &&
        avatarETag == other.avatarETag &&
        numberMessages == other.numberMessages &&
        groupMentions == other.groupMentions &&
        userMentions == other.userMentions &&
        unread == other.unread &&
        open == other.open &&
        alert == other.alert &&
        readOnly == other.readOnly &&
        favorite == other.favorite &&
        wasInitialized == other.wasInitialized &&
        blocker == other.blocker &&
        blocked == other.blocked &&
        encrypted == other.encrypted &&
        autoTranslate == other.autoTranslate &&
        channelType == other.channelType &&
        teamInfo == other.teamInfo &&
        messages == other.messages;
  }

  @override
  int get hashCode =>
      roles.hashCode ^
      roomId.hashCode ^
      uids.hashCode ^
      userNames.hashCode ^
      threadUnread.hashCode ^
      name.hashCode ^
      fName.hashCode ^
      topic.hashCode ^
      description.hashCode ^
      announcement.hashCode ^
      parentRid.hashCode ^
      autotranslateLanguage.hashCode ^
      avatarETag.hashCode ^
      numberMessages.hashCode ^
      groupMentions.hashCode ^
      userMentions.hashCode ^
      unread.hashCode ^
      open.hashCode ^
      alert.hashCode ^
      readOnly.hashCode ^
      favorite.hashCode ^
      wasInitialized.hashCode ^
      blocker.hashCode ^
      blocked.hashCode ^
      encrypted.hashCode ^
      autoTranslate.hashCode ^
      channelType.hashCode ^
      teamInfo.hashCode ^
      messages.hashCode;
}
