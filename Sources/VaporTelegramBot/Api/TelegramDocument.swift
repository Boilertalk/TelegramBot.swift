//
// Created by Koray Koska on 14/08/2017.
//

import Foundation
import JSON

public final class TelegramDocument: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let fileIdKey = "file_id"

        public static let thumbKey = "thumb"
        public static let fileNameKey = "file_name"
        public static let mimeTypeKey = "mime_type"
        public static let fileSizeKey = "file_size"
    }

    // MARK: - Primitive types

    /// Unique file identifier
    public var fileId: String

    /// Optional. Original filename as defined by sender
    public var fileName: String?

    /// Optional. MIME type of the file as defined by sender
    public var mimeType: String?

    /// Optional. File size
    public var fileSize: Int?

    // MARK: - Object types

    /// Optional. Document thumbnail as defined by sender
    public var thumb: TelegramPhotoSize?

    public init(json: JSON) throws {
        self.fileId = try json.get(Keys.fileIdKey)

        self.fileName = json[Keys.fileNameKey]?.string
        self.mimeType = json[Keys.mimeTypeKey]?.string
        self.fileSize = json[Keys.fileSizeKey]?.int

        if let thumbJson = json[Keys.thumbKey] {
            self.thumb = try TelegramPhotoSize(json: thumbJson)
        }
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        try json.set(Keys.fileIdKey, fileId)

        if let fileName = fileName {
            try json.set(Keys.fileNameKey, fileName)
        }

        if let mimeType = mimeType {
            try json.set(Keys.mimeTypeKey, mimeType)
        }

        if let fileSize = fileSize {
            try json.set(Keys.fileSizeKey, fileSize)
        }

        if let thumb = thumb {
            try json.set(Keys.thumbKey, thumb.makeJSON())
        }

        return json
    }
}
