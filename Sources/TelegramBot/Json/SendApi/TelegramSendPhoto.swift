//
//  TelegramSendPhoto.swift
//  TelegramBot
//
//  Created by Koray Koska on 29.01.19.
//

import Foundation

public final class TelegramSendPhoto: Codable {

    // MARK: - Primitive types

    /// Unique identifier for the target chat or
    /// username of the target channel (in the
    /// format @channelusername)
    public var chatId: TelegramSendChatIdentifier

    /// Photo to send. Pass a file_id as String to send a photo
    /// that exists on the Telegram servers (recommended),
    /// pass an HTTP URL as a String for Telegram to get a
    /// photo from the Internet
    public var photo: String

    /// Photo caption (may also be used when resending
    /// photos by file_id), 0-1024 characters
    public var caption: String?

    /// Send Markdown or HTML, if you want Telegram apps
    /// to show bold, italic, fixed-width text or inline URLs in
    /// the media caption.
    public var parseMode: TelegramSendMessage.ParseMode?

    /// Sends the message silently. Users will receive a
    /// notification with no sound.
    public var disableNotification: Bool?

    /// If the message is a reply, ID of the original message
    public var replyToMessageId: Int?

    /// Additional interface options. A JSON-serialized object
    /// for an inline keyboard, custom reply keyboard,
    /// instructions to remove reply keyboard or to force a
    /// reply from the user.
    public var replyMarkup: TelegramSendMessage.ReplyMarkup?

    // MARK: - Initialization

    public init(
        chatId: TelegramSendChatIdentifier,
        photo: String,
        caption: String? = nil,
        parseMode: TelegramSendMessage.ParseMode? = nil,
        disableNotification: Bool? = nil,
        replyToMessageId: Int? = nil,
        replyMarkup: TelegramSendMessage.ReplyMarkup? = nil
    ) {
        self.chatId = chatId
        self.photo = photo
        self.caption = caption
        self.parseMode = parseMode
        self.disableNotification = disableNotification
        self.replyToMessageId = replyToMessageId
        self.replyMarkup = replyMarkup
    }
}
