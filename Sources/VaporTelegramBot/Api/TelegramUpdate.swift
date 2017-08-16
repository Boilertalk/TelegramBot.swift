//
//  TelegramUpdate.swift
//  VaporTelegramBot
//
//  Created by Koray Koska on 08/08/2017.
//
//

import Foundation
import JSON

public final class TelegramUpdate: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let updateIdKey = "update_id"
        public static let messageKey = "message"
        public static let editedMessageKey = "edited_message"
        public static let channelPostKey = "channel_post"
        public static let editedChannelPostKey = "channel_post"
    }

    // MARK: - Primitive types

    /// The update‘s unique identifier. Update identifiers start from a certain positive number
    /// and increase sequentially. This ID becomes especially handy if you’re using Webhooks,
    /// since it allows you to ignore repeated updates or to restore the correct update sequence,
    /// should they get out of order.
    public var updateId: Int

    /// Optional. New incoming message of any kind — text, photo, sticker, etc.
    public var message: TelegramMessage?

    /// Optional. New version of a message that is known to the bot and was edited
    public var editedMessage: TelegramMessage?

    /// Optional. New incoming channel post of any kind — text, photo, sticker, etc.
    public var channelPost: TelegramMessage?

    /// Optional. New version of a channel post that is known to the bot and was edited
    public var editedChannelPost: TelegramMessage?

    public init(json: JSON) throws {
        self.updateId = try json.get(Keys.updateIdKey)

        if let messageJson = json[Keys.messageKey] {
            self.message = try TelegramMessage(json: messageJson)
        }

        if let editedMessageJson = json[Keys.editedMessageKey] {
            self.editedMessage = try TelegramMessage(json: editedMessageJson)
        }

        if let channelPostJson = json[Keys.channelPostKey] {
            self.channelPost = try TelegramMessage(json: channelPostJson)
        }

        if let editedChannelPostJson = json[Keys.editedChannelPostKey] {
            self.editedChannelPost = try TelegramMessage(json: editedChannelPostJson)
        }
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        try json.set(Keys.updateIdKey, updateId)

        if let message = message {
            try json.set(Keys.messageKey, message)
        }

        if let editedMessage = editedMessage {
            try json.set(Keys.editedMessageKey, editedMessage)
        }

        if let channelPost = channelPost {
            try json.set(Keys.channelPostKey, channelPost)
        }

        if let editedChannelPost = editedChannelPost {
            try json.set(Keys.editedChannelPostKey, editedChannelPost)
        }

        return json
    }
}
