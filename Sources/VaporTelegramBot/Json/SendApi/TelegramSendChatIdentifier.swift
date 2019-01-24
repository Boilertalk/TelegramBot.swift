//
//  TelegramSendChatIdentifier.swift
//  VaporTelegramBot
//
//  Created by Koray Koska on 24.01.19.
//

import Foundation

public enum TelegramSendChatIdentifier: Codable {

    /// The chat id as an int
    case int(id: Int)

    /// The chat id as a string
    case string(id: String)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let id = try? container.decode(Int.self) {
            self = .int(id: id)
        } else {
            self = .string(id: try container.decode(String.self))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case .int(let id):
            try container.encode(id)
        case .string(let id):
            try container.encode(id)
        }
    }
}
