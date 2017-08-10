//
// Created by Koray Koska on 10/08/2017.
//

import Foundation
import JSON

public final class TelegramUser: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let idKey = "id"
        public static let firstNameKey = "first_name"
        public static let lastNameKey = "last_name"
        public static let usernameKey = "username"
        public static let languageCodeKey = "language_code"
    }

    // MARK: - Primitive types

    /// Unique identifier for this user or bot
    public var id: Int

    /// User‘s or bot’s first name
    public var firstName: String

    /// Optional. User‘s or bot’s last name
    public var lastName: String?

    /// Optional. User‘s or bot’s username
    public var username: String?

    /// Optional. IETF language tag of the user's language
    /// (more info: https://en.wikipedia.org/wiki/IETF_language_tag)
    public var languageCode: String?

    public init(json: JSON) throws {
        self.id = try json.get(Keys.idKey)
        self.firstName = try json.get(Keys.firstNameKey)

        self.lastName = json[Keys.lastNameKey]?.string
        self.username = json[Keys.usernameKey]?.string
        self.languageCode = json[Keys.languageCodeKey]?.string
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        try json.set(Keys.idKey, id)
        try json.set(Keys.firstNameKey, firstName)

        if let lastName = lastName {
            try json.set(Keys.lastNameKey, lastName)
        }
        if let username = username {
            try json.set(Keys.usernameKey, username)
        }
        if let languageCode = languageCode {
            try json.set(Keys.languageCodeKey, languageCode)
        }

        return json
    }
}
