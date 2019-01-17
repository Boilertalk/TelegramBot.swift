//
//  TelegramEncryptedCredentials.swift
//  VaporTelegramBot
//
//  Created by Koray Koska on 17.01.19.
//

import Foundation

public final class TelegramEncryptedCredentials: Codable {

    // MARK: - Primitive types

    /// Base64-encoded encrypted JSON-serialized data with unique user's payload, data hashes and
    /// secrets required for `TelegramEncryptedPassportElement` decryption and authentication
    public var data: String

    /// Base64-encoded data hash for data authentication
    public var hash: Int

    /// Base64-encoded secret, encrypted with the bot's public RSA key, required for data decryption
    public var secret: Int

    // MARK: - Initialization

    public init(
        data: String,
        hash: Int,
        secret: Int
    ) {
        self.data = data
        self.hash = hash
        self.secret = secret
    }
}
