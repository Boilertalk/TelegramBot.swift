//
//  TelegramPassportData.swift
//  TelegramBot
//
//  Created by Koray Koska on 17.01.19.
//

import Foundation

public final class TelegramPassportData: Codable {

    // MARK: - Primitive types

    // MARK: - Object types

    /// Array with information about documents and other Telegram Passport
    /// elements that was shared with the bot
    public var data: [TelegramEncryptedPassportElement]

    /// Encrypted credentials required to decrypt the data
    public var credentials: [TelegramEncryptedCredentials]

    // MARK: - Initialization

    public init(
        data: [TelegramEncryptedPassportElement],
        credentials: [TelegramEncryptedCredentials]
    ) {
        self.data = data
        self.credentials = credentials
    }
}
