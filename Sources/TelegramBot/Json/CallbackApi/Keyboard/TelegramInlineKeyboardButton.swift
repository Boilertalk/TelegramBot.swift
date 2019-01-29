//
//  TelegramInlineKeyboardButton.swift
//  TelegramBot
//
//  Created by Koray Koska on 24.01.19.
//

import Foundation

/// This object represents one button of an inline keyboard. You must use exactly one of the optional fields.
public final class TelegramInlineKeyboardButton: Codable {

    // MARK: - Primitive types

    /// Label text on the button
    public var text: String

    /// Optional. HTTP or tg:// url to be opened when button is
    /// pressed
    public var url: String?

    /// Optional. Data to be sent in a callback query to the bot when
    /// button is pressed, 1-64 bytes
    public var callbackData: String?

    /// Optional. If set, pressing the button will prompt the user to
    /// select one of their chats, open that chat and insert the bot‘s
    /// username and the specified inline query in the input field. Can
    /// be empty, in which case just the bot’s username will be
    /// inserted.
    ///
    /// Note: This offers an easy way for users to start using your bot
    /// in [inline mode](https://core.telegram.org/bots/inline)
    /// when they are currently in a private chat with it.
    /// Especially useful when combined with
    /// [switch_pm…](https://core.telegram.org/bots/api#answerinlinequery)
    /// actions – in this case the user will be automatically returned to the chat
    /// they switched from, skipping the chat selection screen.
    public var switchInlineQuery: String?

    /// Optional. If set, pressing the button will insert the bot‘s
    /// username and the specified inline query in the current chat's
    /// input field. Can be empty, in which case only the bot’s
    /// username will be inserted.
    ///
    /// This offers a quick way for the user to open your bot in inline
    /// mode in the same chat – good for selecting something from
    /// multiple options.
    public var switchInlineQueryCurrentChat: String?

    /// Optional. Specify True, to send a Pay button.
    ///
    /// NOTE: This type of button must always be the first button in
    /// the first row.
    public var pay: Bool?

    // MARK: - Object types

    /// Optional. Description of the game that will be launched when
    /// the user presses the button.
    ///
    /// NOTE: This type of button must always be the first button in
    /// the first row.
    public var callbackGame: TelegramCallbackGame?

    // MARK: - Initialization

    public init(text: String, url: String) {
        self.text = text
        self.url = url
    }

    public init(text: String, callbackData: String) {
        self.text = text
        self.callbackData = callbackData
    }

    public init(text: String, switchInlineQuery: String) {
        self.text = text
        self.switchInlineQuery = switchInlineQuery
    }

    public init(text: String, switchInlineQueryCurrentChat: String) {
        self.text = text
        self.switchInlineQueryCurrentChat = switchInlineQueryCurrentChat
    }

    public init(text: String, pay: Bool) {
        self.text = text
        self.pay = pay
    }

    public init(text: String, callbackGame: TelegramCallbackGame) {
        self.text = text
        self.callbackGame = callbackGame
    }
}
