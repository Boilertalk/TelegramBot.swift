//
//  TelegramSendEditMessageReplyMarkup.swift
//  TelegramBot
//
//  Created by Koray Koska on 31.01.19.
//

import Foundation

public final class TelegramSendEditMessageReplyMarkup: Codable {

    // MARK: - Primitive types

    /// Required if inline_message_id is not specified. Unique
    /// identifier for the target chat or username of the target
    /// channel (in the format @channelusername)
    public var chatId: TelegramSendChatIdentifier?

    /// Required if inline_message_id is not specified. Identifier
    /// of the sent message
    public var messageId: Int?

    /// Required if chat_id and message_id are not specified.
    /// Identifier of the inline message
    public var inlineMessageId: String?

    /// A JSON-serialized object for an inline keyboard.
    public var replyMarkup: TelegramInlineKeyboardMarkup?

    // MARK: - Initialization

    public init(
        chatId: TelegramSendChatIdentifier,
        messageId: Int,
        replyMarkup: TelegramInlineKeyboardMarkup? = nil
    ) {
        self.chatId = chatId
        self.messageId = messageId
        self.replyMarkup = replyMarkup

        self.inlineMessageId = nil
    }

    public init(
        inlineMessageId: String,
        replyMarkup: TelegramInlineKeyboardMarkup? = nil
    ) {
        self.inlineMessageId = inlineMessageId
        self.replyMarkup = replyMarkup

        self.chatId = nil
        self.messageId = nil
    }
}
