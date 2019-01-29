//
//  TelegramUser.swift
//  TelegramBot
//
//  Created by Koray Koska on 14.01.19.
//

import Foundation

public final class TelegramUser: Codable {

    // MARK: - Primitive types

    /// Unique identifier for this user or bot
    public var id: Int

    /// True, if this user is a bot
    public var isBot: Bool

    /// User‘s or bot’s first name
    public var firstName: String

    /// Optional. User‘s or bot's last name
    public var lastName: String?

    /// Optional. User‘s or bot’s username
    public var username: String?

    /// Optional. IETF language tag of the user's language
    /// (more info: https://en.wikipedia.org/wiki/IETF_language_tag)
    public var languageCode: String?

    // MARK: - Initialization

    public init(
        id: Int,
        isBot: Bool,
        firstName: String,
        lastName: String?,
        username: String?,
        languageCode: String?
    ) {
        self.id = id
        self.isBot = isBot
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.languageCode = languageCode
    }
}
