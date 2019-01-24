//
//  TelegramGame.swift
//  VaporTelegramBot
//
//  Created by Koray Koska on 14.01.19.
//

import Foundation

public final class TelegramGame: Codable {

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

    // MARK: - Initialization

    public init(
        title: String,
        description: String,
        text: String?,
        photo: [TelegramPhotoSize],
        textEntities: [TelegramMessageEntity]?,
        animation: TelegramAnimation?
    ) {
        self.title = title
        self.description = description
        self.text = text
        self.photo = photo
        self.textEntities = textEntities
        self.animation = animation
    }
}
