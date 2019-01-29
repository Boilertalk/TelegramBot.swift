//
//  TelegramForceReply.swift
//  TelegramBot
//
//  Created by Koray Koska on 24.01.19.
//

import Foundation

public final class TelegramForceReply: Codable {

    // MARK: - Primitive types

    /// Shows reply interface to the user, as if they manually selected the bot‘s message and
    /// tapped ’Reply'
    public let forceReply: Bool

    /// Optional. Use this parameter if you want to force reply from specific users only. Targets: 1)
    /// users that are @mentioned in the text of the `TelegramMessage` object; 2) if the bot's message is a
    /// reply (has reply_to_message_id), sender of the original message.
    public var selective: Bool?

    // MARK: - Initialization

    public init(selective: Bool? = nil) {
        self.forceReply = true
        self.selective = selective
    }
}
