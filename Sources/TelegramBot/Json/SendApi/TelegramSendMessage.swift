//
//  TelegramSendMessage.swift
//  TelegramBot
//
//  Created by Koray Koska on 24.01.19.
//

import Foundation

public final class TelegramSendMessage: Codable {

    // MARK: - Primitive types

    /// Unique identifier for the target chat or
    /// username of the target channel (in the
    /// format @channelusername)
    public var chatId: TelegramSendChatIdentifier

    /// Text of the message to be sent
    public var text: String

    /// Send [Markdown](https://core.telegram.org/bots/api#markdown-style)
    /// or [HTML](https://core.telegram.org/bots/api#html-style), if you want
    /// Telegram apps to show [bold, italic, fixed-
    /// width text or inline URLs](https://core.telegram.org/bots/api#formatting-options)
    /// in your bot's message.
    public var parseMode: ParseMode?

    /// Disables link previews for links in this
    /// message
    public var disableWebPagePreview: Bool?

    /// Sends the message [silently](https://telegram.org/blog/channels-2-0#silent-messages).
    /// Users will receive a notification with no sound.
    public var disableNotification: Bool?

    /// If the message is a reply, ID of the original
    /// message
    public var replyToMessageId: Int?

    // MARK: - Object types

    /// Additional interface options. A JSON-
    /// serialized object for an inline keyboard,
    /// custom reply keyboard, instructions to
    /// remove reply keyboard or to force a reply
    /// from the user.
    public var replyMarkup: ReplyMarkup?

    // MARK: - Custom types

    public enum ParseMode: String, Codable {

        /// Markdown parse mode
        case markdown = "Markdown"

        /// HTML parse mode
        case html = "HTML"
    }

    public enum ReplyMarkup: Codable {

        case inlineKeyboardMarkup(keyboard: TelegramInlineKeyboardMarkup)

        case replyKeyboardMarkup(keyboard: TelegramReplyKeyboardMarkup)

        case replyKeyboardRemove(keyboard: TelegramReplyKeyboardRemove)

        case forceReply(keyboard: TelegramForceReply)

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()

            if let k = try? container.decode(TelegramInlineKeyboardMarkup.self) {
                self = .inlineKeyboardMarkup(keyboard: k)
            } else if let k = try? container.decode(TelegramReplyKeyboardMarkup.self) {
                self = .replyKeyboardMarkup(keyboard: k)
            } else if let k = try? container.decode(TelegramReplyKeyboardRemove.self) {
                self = .replyKeyboardRemove(keyboard: k)
            } else {
                self = .forceReply(keyboard: try container.decode(TelegramForceReply.self))
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()

            switch self {
            case .inlineKeyboardMarkup(let keyboard):
                try container.encode(keyboard)
            case .replyKeyboardMarkup(let keyboard):
                try container.encode(keyboard)
            case .replyKeyboardRemove(let keyboard):
                try container.encode(keyboard)
            case .forceReply(let keyboard):
                try container.encode(keyboard)
            }
        }
    }

    // MARK: - Initialization

    public init(
        chatId: TelegramSendChatIdentifier,
        text: String,
        parseMode: ParseMode? = nil,
        disableNotification: Bool? = nil,
        disableWebPagePreview: Bool? = nil,
        replyToMessageId: Int? = nil,
        replyMarkup: ReplyMarkup? = nil
    ) {
        self.chatId = chatId
        self.text = text
        self.parseMode = parseMode
        self.disableNotification = disableNotification
        self.disableWebPagePreview = disableWebPagePreview
        self.replyToMessageId = replyToMessageId
        self.replyMarkup = replyMarkup
    }

    public convenience init(
        chatId: Int,
        text: String,
        parseMode: ParseMode? = nil,
        disableNotification: Bool? = nil,
        disableWebPagePreview: Bool? = nil,
        replyToMessageId: Int? = nil,
        replyMarkup: ReplyMarkup? = nil
    ) {
        self.init(
            chatId: .int(id: chatId),
            text: text,
            parseMode: parseMode,
            disableNotification: disableNotification,
            disableWebPagePreview: disableWebPagePreview,
            replyToMessageId: replyToMessageId,
            replyMarkup: replyMarkup
        )
    }

    public convenience init(
        chatId: String,
        text: String,
        parseMode: ParseMode? = nil,
        disableNotification: Bool? = nil,
        disableWebPagePreview: Bool? = nil,
        replyToMessageId: Int? = nil,
        replyMarkup: ReplyMarkup? = nil
    ) {
        self.init(
            chatId: .string(id: chatId),
            text: text,
            parseMode: parseMode,
            disableNotification: disableNotification,
            disableWebPagePreview: disableWebPagePreview,
            replyToMessageId: replyToMessageId,
            replyMarkup: replyMarkup
        )
    }
}
