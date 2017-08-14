//
//  TelegramMessage.swift
//  VaporTelegramBot
//
//  Created by Koray Koska on 08/08/2017.
//
//

import Foundation
import JSON

public final class TelegramMessage: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let messageIdKey = "message_id"
        public static let dateKey = "date"
        public static let forwardFromMessageIdKey = "forward_from_message_id"
        public static let forwardDateKey = "forward_date"
        public static let editDateKey = "edit_date"
        public static let textKey = "text"
        public static let captionKey = "caption"
        public static let newChatTitleKey = "new_chat_title"
        public static let deleteChatPhotoKey = "delete_chat_photo"
        public static let groupChatCreatedKey = "group_chat_created"
        public static let supergroupChatCreatedKey = "supergroup_chat_created"
        public static let channelChatCreatedKey = "channel_chat_created"
        public static let migrateToChatIdKey = "migrate_to_chat_id"
        public static let migrateFromChatIdKey = "migrate_from_chat_id"

        public static let fromKey = "from"
        public static let chatKey = "chat"
        public static let forwardFromKey = "forward_from"
        public static let forwardFromChatKey = "forward_from_chat"
        public static let replyToMessageKey = "reply_to_message"
        public static let entitiesKey = "entities"
        public static let audioKey = "audio"
        public static let documentKey = "document"
        public static let gameKey = "game"
        public static let photoKey = "photo"
        public static let stickerKey = "sticker"
        public static let videoKey = "video"
    }

    // MARK: - Primitive types

    /// Unique message identifier inside this chat
    public var messageId: Int

    /// Date the message was sent in Unix time
    public var date: Int

    /// Optional. For forwarded channel posts, identifier of the original message in the channel
    public var forwardFromMessageId: Int?

    /// Optional. For forwarded messages, date the original message was sent in Unix time
    public var forwardDate: Int?

    /// Optional. Date the message was last edited in Unix time
    public var editDate: Int?

    /// Optional. For text messages, the actual UTF-8 text of the message, 0-4096 characters.
    public var text: String?

    /// Optional. Caption for the document, photo or video, 0-200 characters
    public var caption: String?

    /// Optional. A chat title was changed to this value
    public var newChatTitle: String?

    /// Optional. Service message: the chat photo was deleted. Either nil or true
    public var deleteChatPhoto: Bool?

    /// Optional. Service message: the group has been created. Either nil or true
    public var groupChatCreated: Bool?

    /// Optional. Service message: the supergroup has been created.
    /// This field can‘t be received in a message coming through updates,
    /// because bot can’t be a member of a supergroup when it is created.
    /// It can only be found in reply_to_message if someone replies to a
    /// very first message in a directly created supergroup.
    /// Either nil or true
    public var supergroupChatCreated: Bool?

    /// Optional. Service message: the channel has been created.
    /// This field can‘t be received in a message coming through updates,
    /// because bot can’t be a member of a channel when it is created.
    /// It can only be found in reply_to_message if someone replies to a
    /// very first message in a channel.
    /// Either nil or true
    public var channelChatCreated: Bool?

    /// Optional. The group has been migrated to a supergroup with the specified identifier.
    /// This number may be greater than 32 bits and some programming languages may have
    /// difficulty/silent defects in interpreting it. But it is smaller than 52 bits,
    /// so a signed 64 bit integer or double-precision float type are safe for
    /// storing this identifier.
    public var migrateToChatId: Int?

    /// Optional. The supergroup has been migrated from a group with the specified identifier.
    /// This number may be greater than 32 bits and some programming languages may have
    /// difficulty/silent defects in interpreting it. But it is smaller than 52 bits,
    /// so a signed 64 bit integer or double-precision float type are safe for
    /// storing this identifier.
    public var migrateFromChatId: Int?

    // MARK: - Object types

    /// Optional. Sender, can be empty for messages sent to channels
    public var from: TelegramUser?

    /// Conversation the message belongs to
    public var chat: TelegramChat

    /// Optional. For forwarded messages, sender of the original message
    public var forwardFrom: TelegramUser?

    /// Optional. For messages forwarded from a channel, information about the original channel
    public var forwardFromChat: TelegramChat?

    /// Optional. For replies, the original message.
    /// Note that the Message object in this field will not contain further
    /// reply_to_message fields even if it itself is a reply.
    public var replyToMessage: TelegramMessage?

    /// Optional. For text messages, special entities like usernames, URLs, bot commands, etc.
    /// that appear in the text
    public var entities: [TelegramMessageEntity]?

    /// Optional. Message is an audio file, information about the file
    public var audio: TelegramAudio?

    /// Optional. Message is a general file, information about the file
    public var document: TelegramDocument?

    /// Optional. Message is a game, information about the game.
    /// More about games » https://core.telegram.org/bots/api#games
    public var game: TelegramGame?

    /// Optional. Message is a photo, available sizes of the photo
    public var photo: [TelegramPhotoSize]?

    /// Optional. Message is a sticker, information about the sticker
    public var sticker: TelegramSticker?

    /// Optional. Message is a video, information about the video
    public var video: TelegramVideo?

    public init(json: JSON) throws {
        // *** Primitive types ***
        self.messageId = try json.get(Keys.messageIdKey)
        self.date = try json.get(Keys.dateKey)

        self.forwardFromMessageId = json[Keys.forwardFromMessageIdKey]?.int
        self.forwardDate = json[Keys.forwardDateKey]?.int

        self.editDate = json[Keys.editDateKey]?.int

        self.text = json[Keys.textKey]?.string

        self.caption = json[Keys.captionKey]?.string

        self.newChatTitle = json[Keys.newChatTitleKey]?.string

        self.deleteChatPhoto = json[Keys.deleteChatPhotoKey]?.bool
        self.groupChatCreated = json[Keys.groupChatCreatedKey]?.bool
        self.supergroupChatCreated = json[Keys.supergroupChatCreatedKey]?.bool
        self.channelChatCreated = json[Keys.channelChatCreatedKey]?.bool

        // This one should be a Int64 to explicitly support 32 bit platforms, but this is currently not possible
        // as discussed in https://github.com/vapor/node/issues/93
        self.migrateToChatId = json[Keys.migrateToChatIdKey]?.int
        self.migrateFromChatId = json[Keys.migrateFromChatIdKey]?.int
        // *** End Primitive types ***

        // *** Object types ***
        if let fromJson = json[Keys.fromKey] {
            self.from = try TelegramUser(json: fromJson)
        }

        self.chat = try TelegramChat(json: json.get(Keys.chatKey))

        if let forwardFromJson = json[Keys.forwardFromKey] {
            self.forwardFrom = try TelegramUser(json: forwardFromJson)
        }
        if let forwardFromChatJson = json[Keys.forwardFromChatKey] {
            self.forwardFromChat = try TelegramChat(json: forwardFromChatJson)
        }

        if let replyToMessageJson = json[Keys.replyToMessageKey] {
            self.replyToMessage = try TelegramMessage(json: replyToMessageJson)
        }

        self.entities = try json[Keys.entitiesKey]?.makeArray()

        if let audioJson = json[Keys.audioKey] {
            self.audio = try TelegramAudio(json: audioJson)
        }

        if let documentJson = json[Keys.documentKey] {
            self.document = try TelegramDocument(json: documentJson)
        }

        if let gameJson = json[Keys.gameKey] {
            self.game = try TelegramGame(json: gameJson)
        }

        self.photo = try json[Keys.photoKey]?.makeArray()

        if let stickerJson = json[Keys.stickerKey] {
            self.sticker = try TelegramSticker(json: stickerJson)
        }

        if let videoJson = json[Keys.videoKey] {
            self.video = try TelegramVideo(json: videoJson)
        }
        // *** End Object types ***
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        // *** Primitive types ***
        try json.set(Keys.messageIdKey, messageId)
        try json.set(Keys.dateKey, date)

        if let forwardFromMessageId = forwardFromMessageId {
            try json.set(Keys.forwardFromMessageIdKey, forwardFromMessageId)
        }
        if let forwardDate = forwardDate {
            try json.set(Keys.forwardDateKey, forwardDate)
        }

        if let editDate = editDate {
            try json.set(Keys.editDateKey, editDate)
        }

        if let text = text {
            try json.set(Keys.textKey, text)
        }

        if let caption = caption {
            try json.set(Keys.captionKey, caption)
        }

        if let newChatTitle = newChatTitle {
            try json.set(Keys.newChatTitleKey, newChatTitle)
        }

        if let deleteChatPhoto = deleteChatPhoto {
            try json.set(Keys.deleteChatPhotoKey, deleteChatPhoto)
        }
        if let groupChatCreated = groupChatCreated {
            try json.set(Keys.groupChatCreatedKey, groupChatCreated)
        }
        if let supergroupChatCreated = supergroupChatCreated {
            try json.set(Keys.supergroupChatCreatedKey, supergroupChatCreated)
        }
        if let channelChatCreated = channelChatCreated {
            try json.set(Keys.channelChatCreatedKey, channelChatCreated)
        }

        if let migrateToChatId = migrateToChatId {
            try json.set(Keys.migrateToChatIdKey, migrateToChatId)
        }
        if let migrateFromChatId = migrateFromChatId {
            try json.set(Keys.migrateFromChatIdKey, migrateFromChatId)
        }
        // *** End Primitive types ***

        // *** Object types ***
        if let from = from {
            try json.set(Keys.fromKey, from.makeJSON())
        }

        try json.set(Keys.chatKey, chat.makeJSON())

        if let forwardFrom = forwardFrom {
            try json.set(Keys.forwardFromKey, forwardFrom.makeJSON())
        }
        if let forwardFromChat = forwardFromChat {
            try json.set(Keys.forwardFromChatKey, forwardFromChat.makeJSON())
        }

        if let replyToMessage = replyToMessage {
            try json.set(Keys.replyToMessageKey, replyToMessage.makeJSON())
        }

        if let entities = entities {
            try json.set(Keys.entitiesKey, entities.jsonArrayElement())
        }

        if let audio = audio {
            try json.set(Keys.audioKey, audio.makeJSON())
        }

        if let document = document {
            try json.set(Keys.documentKey, document.makeJSON())
        }

        if let game = game {
            try json.set(Keys.gameKey, game.makeJSON())
        }

        if let photo = photo {
            try json.set(Keys.photoKey, photo.jsonArrayElement())
        }

        if let sticker = sticker {
            try json.set(Keys.stickerKey, sticker.makeJSON())
        }

        if let video = video {
            try json.set(Keys.videoKey, video.makeJSON())
        }
        // *** End Object types ***

        return json
    }
}
