//
//  TelegramUpdate.swift
//  VaporTelegramBot
//
//  Created by Koray Koska on 14.01.19.
//

import Foundation

public final class TelegramUpdate: Codable {

    // MARK: - Primitive types

    /// The update‘s unique identifier. Update identifiers start from a certain positive number
    /// and increase sequentially. This ID becomes especially handy if you’re using Webhooks,
    /// since it allows you to ignore repeated updates or to restore the correct update sequence,
    /// should they get out of order.
    public var updateId: Int

    /// Optional. New incoming message of any kind — text, photo, sticker, etc.
    public var message: TelegramMessage?

    /// Optional. New version of a message that is known to the bot and was edited
    public var editedMessage: TelegramMessage?

    /// Optional. New incoming channel post of any kind — text, photo, sticker, etc.
    public var channelPost: TelegramMessage?

    /// Optional. New version of a channel post that is known to the bot and was edited
    public var editedChannelPost: TelegramMessage?

    /// Optional. New incoming inline query
    public var inlineQuery: TelegramInlineQuery?

    /// Optional. The result of an inline query that was chosen by a user and sent to their chat partner.
    /// Please see our documentation on the feedback collecting for details on how to enable these updates
    /// for your bot.
    public var chosenInlineResult: TelegramChosenInlineResult?

    /// Optional. New incoming callback query
    public var callbackQuery: TelegramCallbackQuery?

    /// Optional. New incoming shipping query. Only for invoices with flexible price
    public var shippingQuery: TelegramShippingQuery?

    /// Optional. New incoming pre-checkout query. Contains full information about checkout
    public var preCheckoutQuery: TelegramPreCheckoutQuery?

    // MARK: - Initialization

    public init(
        updateId: Int,
        message: TelegramMessage?,
        editedMessage: TelegramMessage?,
        channelPost: TelegramMessage?,
        editedChannelPost: TelegramMessage?,
        inlineQuery: TelegramInlineQuery?,
        chosenInlineResult: TelegramChosenInlineResult?,
        callbackQuery: TelegramCallbackQuery?,
        shippingQuery: TelegramShippingQuery?,
        preCheckoutQuery: TelegramPreCheckoutQuery?
    ) {
        self.updateId = updateId
        self.message = message
        self.editedMessage = editedMessage
        self.channelPost = channelPost
        self.editedChannelPost = editedChannelPost
        self.inlineQuery = inlineQuery
        self.chosenInlineResult = chosenInlineResult
        self.callbackQuery = callbackQuery
        self.shippingQuery = shippingQuery
        self.preCheckoutQuery = preCheckoutQuery
    }
}
