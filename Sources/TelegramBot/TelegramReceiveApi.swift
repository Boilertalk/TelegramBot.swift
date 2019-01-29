//
//  TelegramReceiveApi.swift
//  TelegramBot
//
//  Created by Koray Koska on 17.01.19.
//

import Foundation

public final class TelegramReceiveApi {

    public typealias Update<UpdateType> = (_ id: Int, _ update: UpdateType) -> ()

    // MARK: - Update Callbacks

    /// New incoming message of any kind — text, photo, sticker, etc.
    public var messageUpdate: Update<TelegramMessage>?

    /// New version of a message that is known to the bot and was edited
    public var editedMessageUpdate: Update<TelegramMessage>?

    /// New incoming channel post of any kind — text, photo, sticker, etc.
    public var channelPostUpdate: Update<TelegramMessage>?

    /// New version of a channel post that is known to the bot and was edited
    public var editedChannelPostUpdate: Update<TelegramMessage>?

    /// New incoming inline query
    public var inlineQueryUpdate: Update<TelegramInlineQuery>?

    /// The result of an inline query that was chosen by a user and
    /// sent to their chat partner. Please see our documentation on the
    /// feedback collecting for details on how to enable these updates for
    /// your bot.
    public var chosenInlineResultUpdate: Update<TelegramChosenInlineResult>?

    /// New incoming callback query
    public var callbackQueryUpdate: Update<TelegramCallbackQuery>?

    /// New incoming shipping query. Only for invoices with flexible price
    public var shippingQueryUpdate: Update<TelegramShippingQuery>?

    /// New incoming pre-checkout query. Contains full information about checkout
    public var preCheckoutQueryUpdate: Update<TelegramPreCheckoutQuery>?

    // MARK: - Constants

    /// The default encoder used in this library
    public let defaultEncoder: JSONEncoder

    /// The default decoder used in this library
    public let defaultDecoder: JSONDecoder

    public init() {
        defaultEncoder = JSONEncoder()
        defaultEncoder.keyEncodingStrategy = .convertToSnakeCase

        defaultDecoder = JSONDecoder()
        defaultDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }

    /**
     * Setup a Telegram bot webhook for the given path.
     * 
     * Updates will call their corresponding update callbacks
     * as defined in this instance of `TelegramReceiveApi`
     *
     * - parameter path: The path this webhook should be setup on.
     *                   May be something like the bot token as
     *                   defined in the best practices of the
     *                   official bot api.
     * - parameter router: The router to be used for setting
     *                     up the route.
     */
    public func setupWebhook(path: String, router: TelegramHTTPRouter) {
        setupWebhook(path: path, routerFunction: router.telegramRegister)
    }

    /**
     * Setup a Telegram bot webhook for the given path.
     *
     * Updates will call their corresponding update callbacks
     * as defined in this instance of `TelegramReceiveApi`
     *
     * - parameter path: The path this webhook should be setup on.
     *                   May be something like the bot token as
     *                   defined in the best practices of the
     *                   official bot api.
     * - parameter routerFunction: The router function to be used for setting
     *                     up the route.
     */
    public func setupWebhook(path: String, routerFunction: (_ path: String, _ callback: @escaping (_ req: TelegramHTTPRequest, _ cb: @escaping (TelegramHTTPStatus) -> ()) throws -> ()) -> ()) {
        routerFunction(path) { req, cb in
            try req.json(TelegramUpdate.self, decoder: self.defaultDecoder) { update in
                let updates: [Any?] = [
                    update.message,
                    update.editedMessage,
                    update.channelPost,
                    update.editedChannelPost,
                    update.inlineQuery,
                    update.chosenInlineResult,
                    update.callbackQuery,
                    update.shippingQuery,
                    update.preCheckoutQuery
                ]

                // At most one of the optional parameters can be present in any given update.
                // Return unsuccessful if more are present.
                if updates.filter({ $0 == nil }).count < updates.count - 1 {
                    cb(.badRequest)
                    return
                }

                if let messageUpdate = update.message {
                    self.messageUpdate?(update.updateId, messageUpdate)
                } else if let editedMessageUpdate = update.editedMessage {
                    self.editedMessageUpdate?(update.updateId, editedMessageUpdate)
                } else if let channelPostUpdate = update.channelPost {
                    self.channelPostUpdate?(update.updateId, channelPostUpdate)
                } else if let editedChannelPostUpdate = update.editedChannelPost {
                    self.editedChannelPostUpdate?(update.updateId, editedChannelPostUpdate)
                } else if let inlineQueryUpdate = update.inlineQuery {
                    self.inlineQueryUpdate?(update.updateId, inlineQueryUpdate)
                } else if let chosenInlineResultUpdate = update.chosenInlineResult {
                    self.chosenInlineResultUpdate?(update.updateId, chosenInlineResultUpdate)
                } else if let callbackQueryUpdate = update.callbackQuery {
                    self.callbackQueryUpdate?(update.updateId, callbackQueryUpdate)
                } else if let shippingQueryUpdate = update.shippingQuery {
                    self.shippingQueryUpdate?(update.updateId, shippingQueryUpdate)
                } else if let preCheckoutQueryUpdate = update.preCheckoutQuery {
                    self.preCheckoutQueryUpdate?(update.updateId, preCheckoutQueryUpdate)
                }

                // Callback and return ok
                cb(.ok)
            }
        }
    }
}
