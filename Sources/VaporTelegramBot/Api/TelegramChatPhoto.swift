//
// Created by Koray Koska on 10/08/2017.
//

import Foundation
import JSON

public final class TelegramChatPhoto: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let smallFileIdKey = "small_file_id"
        public static let bigFileIdKey = "big_file_id"
    }

    // MARK: - Primitive types

    /// Unique file identifier of small (160x160) chat photo. This file_id can be used only for photo download.
    public var smallFileId: String

    /// Unique file identifier of big (640x640) chat photo. This file_id can be used only for photo download.
    public var bigFileId: String

    public init(json: JSON) throws {
        self.smallFileId = try json.get(Keys.smallFileIdKey)
        self.bigFileId = try json.get(Keys.bigFileIdKey)
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        try json.set(Keys.smallFileIdKey, smallFileId)
        try json.set(Keys.bigFileIdKey, bigFileId)

        return json
    }
}
