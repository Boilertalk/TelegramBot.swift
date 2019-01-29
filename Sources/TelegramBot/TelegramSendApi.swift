//
//  TelegramSendApi.swift
//  TelegramBot
//
//  Created by Koray Koska on 24.01.19.
//

import Foundation

public final class TelegramSendApi {

    public var baseUrl: String {
        return "https://api.telegram.org/bot\(token)"
    }

    public let token: String

    public init(token: String) {
        self.token = token
    }
}
