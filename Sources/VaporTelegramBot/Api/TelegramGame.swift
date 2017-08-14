//
// Created by Koray Koska on 14/08/2017.
//

import Foundation
import JSON

public final class TelegramGame: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let titleKey = "title"
        public static let descriptionKey = "description"
        public static let photoKey = "photo"

        public static let textKey = "text"
        public static let textEntitiesKey = "text_entities"
        public static let animationKey = "animation"
    }

    // MARK: - Primitive types

    /// Title of the game
    public var title: String

    /// Description of the game
    public var description: String

    /// Optional. Brief description of the game or high scores included in the game message.
    /// Can be automatically edited to include current high scores for the game when the bot
    /// calls setGameScore, or manually edited using editMessageText. 0-4096 characters.
    public var text: String?

    // MARK: - Object types

    /// Photo that will be displayed in the game message in chats.
    public var photo: [TelegramPhotoSize]

    /// Optional. Special entities that appear in text, such as usernames, URLs, bot commands, etc.
    public var textEntities: [TelegramMessageEntity]?

    /// Optional. Animation that will be displayed in the game message in chats.
    /// Upload via BotFather
    public var animation: TelegramAnimation?

    public init(json: JSON) throws {
        self.title = try json.get(Keys.titleKey)
        self.description = try json.get(Keys.descriptionKey)

        self.text = json[Keys.textKey]?.string

        if let photo: [TelegramPhotoSize] = try json[Keys.photoKey]?.makeArray() {
            self.photo = photo
        } else {
            throw VaporTelegramError.requiredParameterHasWrongType(
                    parameter: Keys.photoKey,
                    neededType: "Array of PhotoSize"
            )
        }

        self.textEntities = try json[Keys.textEntitiesKey]?.makeArray()

        if let animationJson = json[Keys.animationKey] {
            self.animation = try TelegramAnimation(json: animationJson)
        }
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        try json.set(Keys.titleKey, title)
        try json.set(Keys.descriptionKey, description)

        try json.set(Keys.textKey, text)

        try json.set(Keys.photoKey, photo.jsonArrayElement())

        if let textEntities = textEntities {
            try json.set(Keys.textEntitiesKey, textEntities.jsonArrayElement())
        }

        if let animation = animation {
            try json.set(Keys.animationKey, animation)
        }

        return json
    }
}
