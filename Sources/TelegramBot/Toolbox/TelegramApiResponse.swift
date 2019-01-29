//
//  TelegramApiResponse.swift
//  TelegramBot
//
//  Created by Koray Koska on 29.01.19.
//

import Foundation

public struct TelegramApiResponse<Result: Codable>: Codable {

    public let ok: Bool

    public let description: String?

    public let result: Result?

    public var error: Error? {
        guard let description = description, !ok else {
            return nil
        }

        return Error(description: description)
    }

    public struct Error: Swift.Error {

        public let description: String

        public var localizedDescription: String {
            return "Telegram Error: \(description)"
        }
    }
}
