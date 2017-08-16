//
// Created by Koray Koska on 16/08/2017.
//

import Foundation
import JSON

public final class TelegramCallbackQuery: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let idKey = "id"
        public static let inlineMessageIdKey = "inline_message_id"
        public static let chatInstanceKey = "chat_instance"
        public static let dataKey = "data"
        public static let gameShortNameKey = "game_short_name"

        public static let fromKey = "from"
        public static let messageKey = "message"
    }

    // MARK: - Primitive types

    /// Unique identifier for this query
    public var id: String

    /// Optional. Identifier of the message sent via the bot in inline mode,
    /// that originated the query.
    public var inlineMessageId: String?

    /// Global identifier, uniquely corresponding to the chat to which
    /// the message with the callback button was sent.
    /// Useful for high scores in games.
    public var chatInstance: String

    /// Optional. Data associated with the callback button.
    /// Be aware that a bad client can send arbitrary data in this field.
    public var data: String?

    /// Optional. Short name of a Game to be returned, serves as the unique identifier for the game
    public var gameShortName: String?

    // MARK: - Object types

    /// Sender
    public var from: TelegramUser

    /// Optional. Message with the callback button that originated the query.
    /// Note that message content and message date will not be available if the message is too old
    public var message: TelegramMessage?

    public init(json: JSON) throws {
        self.id = try json.get(Keys.idKey)
        self.chatInstance = try json.get(Keys.chatInstanceKey)

        self.inlineMessageId = json[Keys.inlineMessageIdKey]?.string
        self.data = json[Keys.dataKey]?.string
        self.gameShortName = json[Keys.gameShortNameKey]?.string

        self.from = try TelegramUser(json: json.get(Keys.fromKey))

        if let messageJson = json[Keys.messageKey] {
            self.message = try TelegramMessage(json: messageJson)
        }
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        try json.set(Keys.idKey, id)
        try json.set(Keys.chatInstanceKey, chatInstance)

        if let inlineMessageId = inlineMessageId {
            try json.set(Keys.inlineMessageIdKey, inlineMessageId)
        }

        if let data = data {
            try json.set(Keys.dataKey, data)
        }

        if let gameShortName = gameShortName {
            try json.set(Keys.gameShortNameKey, gameShortName)
        }

        try json.set(Keys.fromKey, from.makeJSON())

        if let message = message {
            try json.set(Keys.messageKey, message.makeJSON())
        }

        return json
    }
}
