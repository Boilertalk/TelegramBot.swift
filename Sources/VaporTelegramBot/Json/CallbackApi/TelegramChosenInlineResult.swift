//
//  TelegramChosenInlineResult.swift
//  VaporTelegramBot
//
//  Created by Koray Koska on 17.01.19.
//

import Foundation

public final class TelegramChosenInlineResult: Codable {

    // MARK: - Primitive types

    /// The unique identifier for the result that was chosen
    public var resultId: String

    /// Optional. Identifier of the sent inline message. Available only if there is an
    /// inline keyboard attached to the message. Will be also received in callback queries
    /// and can be used to edit the message
    public var inlineMessageId: String?

    /// The query that was used to obtain the result
    public var query: String

    // MARK: - Object types

    /// The user that chose the result
    public var from: TelegramUser

    /// Optional. Sender location, only for bots that require user location
    public var location: TelegramLocation?

    // MARK: - Initialization

    public init(
        resultId: String,
        inlineMessageId: String,
        query: String,
        from: TelegramUser,
        location: TelegramLocation?
    ) {
        self.resultId = resultId
        self.inlineMessageId = inlineMessageId
        self.query = query
        self.from = from
        self.location = location
    }
}
