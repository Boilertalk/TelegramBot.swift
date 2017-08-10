//
// Created by Koray Koska on 10/08/2017.
//

import Foundation
import JSON
import Vapor

public final class TelegramMessageEntity: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let typeKey = "type"
        public static let offsetKey = "offset"
        public static let lengthKey = "length"
        public static let urlKey = "url"
        public static let userKey = "user"
    }

    // MARK: - Primitive types

    /// Type of the entity. Can be mention (@username), hashtag, bot_command, url,
    /// email, bold (bold text), italic (italic text), code (monowidth string),
    /// pre (monowidth block), text_link (for clickable text URLs),
    /// text_mention (for users without usernames)
    public var type: TelegramMessageEntityType

    /// Offset in UTF-16 code units to the start of the entity
    public var offset: Int

    /// Length of the entity in UTF-16 code units
    public var length: Int

    /// Optional. For "text_link" only, url that will be opened after user taps on the text
    public var url: String?

    // MARK: - Object types

    /// Optional. For "text_mention" only, the mentioned user
    public var user: TelegramUser?

    public init(json: JSON) throws {
        // *** Primitive types ***
        if let type = TelegramMessageEntityType(rawValue: try json.get(Keys.typeKey)) {
            self.type = type
        } else {
            // TODO: Change to custom Error
            throw Abort(.badRequest, metadata: "type must be a valid value")
        }

        self.offset = try json.get(Keys.offsetKey)
        self.length = try json.get(Keys.lengthKey)

        self.url = json[Keys.urlKey]?.string
        // *** End Primitive types ***

        // *** Object types ***
        if let userJson = json[Keys.userKey] {
            self.user = try TelegramUser(json: userJson)
        }
        // *** End Object types ***
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        try json.set(Keys.typeKey, type.rawValue)
        try json.set(Keys.offsetKey, offset)
        try json.set(Keys.lengthKey, length)

        if let url = url {
            try json.set(Keys.urlKey, url)
        }
        if let user = user {
            try json.set(Keys.userKey, user.makeJSON())
        }

        return json
    }
}

public enum TelegramMessageEntityType: String {

    case mention = "mention"
    case hashtag = "hashtag"
    case botCommand = "bot_command"
    case url = "url"
    case email = "email"
    case bold = "bold"
    case italic = "italic"
    case code = "code"
    case pre = "pre"
    case textLink = "text_link"
    case textMention = "text_mention"
}
