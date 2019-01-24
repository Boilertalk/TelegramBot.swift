//
//  TelegramChat.swift
//  VaporTelegramBot
//
//  Created by Koray Koska on 14.01.19.
//

import Foundation

public final class TelegramChat: Codable {

    // MARK: - Primitive types

    /// Unique identifier for this chat.
    /// This number may be greater than 32 bits and some programming languages
    /// may have difficulty/silent defects in interpreting it.
    /// But it is smaller than 52 bits, so a signed 64 bit integer
    /// or double-precision float type are safe for storing this identifier.
    public var id: Int

    /// Type of chat, can be either “private”, “group”, “supergroup” or “channel”
    public var type: TelegramChatType

    /// Optional. Title, for supergroups, channels and group chats
    public var title: String?

    /// Optional. Username, for private chats, supergroups and channels if available
    public var username: String?

    /// Optional. First name of the other party in a private chat
    public var firstName: String?

    /// Optional. Last name of the other party in a private chat
    public var lastName: String?

    /// Optional. True if a group has ‘All Members Are Admins’ enabled.
    public var allMembersAreAdministrators: Bool?

    /// Optional. Description, for supergroups and channel chats. Returned only in getChat.
    public var description: String?

    /// Optional. Chat invite link, for supergroups and channel chats. Returned only in getChat.
    public var inviteLink: String?

    /// Optional. For supergroups, name of group sticker set. Returned only in getChat.
    public var stickerSetName: String?

    /// Optional. True, if the bot can change the group sticker set. Returned only in getChat.
    public var canSetStickerSet: Bool?

    // MARK: - Object types

    /// Optional. Chat photo. Returned only in getChat.
    public var photo: TelegramChatPhoto?

    /// Optional. Pinned message, for supergroups and channel chats. Returned only in getChat.
    public var pinnedMessage: TelegramMessage?

    // MARK: - Initialization

    public init(
        id: Int,
        type: TelegramChatType,
        title: String?,
        username: String?,
        firstName: String?,
        lastName: String?,
        allMembersAreAdministrators: Bool?,
        description: String?,
        inviteLink: String?,
        stickerSetName: String?,
        canSetStickerSet: Bool?,
        photo: TelegramChatPhoto?,
        pinnedMessage: TelegramMessage?
    ) {
        self.id = id
        self.type = type
        self.title = title
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.allMembersAreAdministrators = allMembersAreAdministrators
        self.description = description
        self.inviteLink = inviteLink
        self.stickerSetName = stickerSetName
        self.canSetStickerSet = canSetStickerSet
        self.photo = photo
        self.pinnedMessage = pinnedMessage
    }
}

public enum TelegramChatType: String, Codable {

    case privateChat = "private"
    case groupChat = "group"
    case supergroupChat = "supergroup"
    case channelChat = "channel"
}
