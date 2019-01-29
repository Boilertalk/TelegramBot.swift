//
//  TelegramCallbackQuery.swift
//  TelegramBot
//
//  Created by Koray Koska on 15.01.19.
//

import Foundation

public final class TelegramCallbackQuery: Codable {

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

    // MARK: - Initialization

    public init(
        id: String,
        inlineMessageId: String?,
        chatInstance: String,
        data: String?,
        gameShortName: String?,
        from: TelegramUser,
        message: TelegramMessage?
    ) {
        self.id = id
        self.inlineMessageId = inlineMessageId
        self.chatInstance = chatInstance
        self.data = data
        self.gameShortName = gameShortName
        self.from = from
        self.message = message
    }
}
