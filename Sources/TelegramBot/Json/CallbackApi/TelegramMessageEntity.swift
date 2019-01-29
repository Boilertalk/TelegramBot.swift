//
//  TelegramMessageEntity.swift
//  TelegramBot
//
//  Created by Koray Koska on 14.01.19.
//

import Foundation

public final class TelegramMessageEntity: Codable {

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

    // MARK: - Initialization

    public init(type: TelegramMessageEntityType, offset: Int, length: Int, url: String?, user: TelegramUser?) {
        self.type = type
        self.offset = offset
        self.length = length
        self.url = url
        self.user = user
    }
}

public enum TelegramMessageEntityType: String, Codable {

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
