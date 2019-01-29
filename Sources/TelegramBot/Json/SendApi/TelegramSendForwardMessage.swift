//
//  TelegramSendForwardMessage.swift
//  TelegramBot
//
//  Created by Koray Koska on 29.01.19.
//

import Foundation

public final class TelegramSendForwardMessage: Codable {

    // MARK: - Primitive types

    /// Unique identifier for the target chat or
    /// username of the target channel (in the
    /// format @channelusername)
    public var chatId: TelegramSendChatIdentifier

    /// Unique identifier for the chat where the original message was sent (or
    /// channel username in the format @channelusername)
    public var fromChatId: TelegramSendChatIdentifier

    /// Sends the message silently. Users will receive a notification with no
    /// sound.
    public var disableNotification: Bool?

    /// Message identifier in the chat specified in fromChatId
    public var messageId: Int

    // MARK: - Initialization

    public init(chatId: TelegramSendChatIdentifier, fromChatId: TelegramSendChatIdentifier, disableNotification: Bool? = nil, messageId: Int) {
        self.chatId = chatId
        self.fromChatId = fromChatId
        self.disableNotification = disableNotification
        self.messageId = messageId
    }
}
