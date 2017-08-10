//
//  TelegramUpdate.swift
//  VaporTelegramBot
//
//  Created by Koray Koska on 08/08/2017.
//
//

import Foundation
import JSON

public final class TelegramUpdate: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let updateIdKey = "update_id"
    }

    // MARK: - Primitive types

    public var updateId: Int

    public init(json: JSON) throws {
        self.updateId = try json.get(Keys.updateIdKey)
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        try json.set(Keys.updateIdKey, updateId)

        return json
    }
}
