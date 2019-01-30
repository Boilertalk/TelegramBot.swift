//
//  TelegramSendAnswerCallbackQuery.swift
//  Async
//
//  Created by Koray Koska on 31.01.19.
//

import Foundation

public final class TelegramSendAnswerCallbackQuery: Codable {

    // MARK: - Primitive types

    /// Unique identifier for the query to be answered
    public var callbackQueryId: String

    /// Text of the notification. If not specified, nothing will be shown to the
    /// user, 0-200 characters
    public var text: String?

    /// If true, an alert will be shown by the client instead of a notification at the
    /// top of the chat screen. Defaults to false.
    public var showAlert: Bool?

    /// URL that will be opened by the user's client. If you have created a Game
    /// and accepted the conditions via @Botfather, specify the URL that opens
    /// your game – note that this will only work if the query comes from a
    /// callback_game button.
    ///
    /// Otherwise, you may use links like t.me/your_bot?start=XXXX that open
    /// your bot with a parameter.
    public var url: String?

    /// The maximum amount of time in seconds that the result of the callback
    /// query may be cached client-side. Telegram apps will support caching
    /// starting in version 3.14. Defaults to 0.
    public var cacheTime: Int?

    // MARK: - Initialization

    public init(
        callbackQueryId: String,
        text: String? = nil,
        showAlert: Bool? = nil,
        url: String? = nil,
        cacheTime: Int?
    ) {
        self.callbackQueryId = callbackQueryId
        self.text = text
        self.showAlert = showAlert
        self.url = url
        self.cacheTime = cacheTime
    }
}
