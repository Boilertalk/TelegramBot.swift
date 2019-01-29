//
//  TelegramInlineQuery.swift
//  TelegramBot
//
//  Created by Koray Koska on 17.01.19.
//

import Foundation

public final class TelegramInlineQuery: Codable {

    // MARK: - Primitive types

    /// Unique identifier for this query
    public var id: String

    /// Text of the query (up to 512 characters)
    public var query: String

    /// Offset of the results to be returned, can be controlled by the bot
    public var offset: String

    // MARK: - Object types

    /// Sender
    public var from: TelegramUser

    /// Optional. Sender location, only for bots that request user location
    public var location: TelegramLocation?

    // MARK: - Initialization

    public init(
        id: String,
        query: String,
        offset: String,
        from: TelegramUser,
        location: TelegramLocation?
    ) {
        self.id = id
        self.query = query
        self.offset = offset
        self.from = from
        self.location = location
    }
}
