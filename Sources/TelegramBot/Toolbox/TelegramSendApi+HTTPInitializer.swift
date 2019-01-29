
//
//  TelegramSendApi+HTTPInitializer.swift
//  TelegramBot
//
//  Created by Koray Koska on 30.01.19.
//

import Foundation

public extension TelegramSendApi {

    /**
     * Initializes a new instance of `TelegramSendApi` with the default HTTP interface.
     *
     * - parameter token: The telegram bot token to be used in requests.
     */
    public convenience init(token: String) {
        let provider = TelegramApiHttpProvider(url: "https://api.telegram.org/bot\(token)")
        self.init(token: token, provider: provider)
    }
}
