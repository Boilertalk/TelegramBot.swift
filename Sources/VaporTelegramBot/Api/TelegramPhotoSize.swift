//
// Created by Koray Koska on 14/08/2017.
//

import Foundation
import JSON

public final class TelegramPhotoSize: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let fileIdKey = "file_id"
        public static let widthKey = "width"
        public static let heightKey = "height"

        public static let fileSizeKey = "file_size"
    }

    // MARK: - Primitive types

    /// Unique identifier for this file
    public var fileId: String

    /// Photo width
    public var width: Int

    /// Photo height
    public var height: Int

    /// Optional. File size
    public var fileSize: Int?

    public init(json: JSON) throws {
        self.fileId = try json.get(Keys.fileIdKey)
        self.width = try json.get(Keys.widthKey)
        self.height = try json.get(Keys.heightKey)

        self.fileSize = json[Keys.fileSizeKey]?.int
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        try json.set(Keys.fileIdKey, fileId)
        try json.set(Keys.widthKey, width)
        try json.set(Keys.heightKey, height)

        if let fileSize = fileSize {
            try json.set(Keys.fileSizeKey, fileSize)
        }

        return json
    }
}
