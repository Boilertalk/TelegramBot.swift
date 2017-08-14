//
// Created by Koray Koska on 14/08/2017.
//

import Foundation
import JSON

public final class TelegramVideo: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let fileIdKey = "file_id"
        public static let widthKey = "width"
        public static let heightKey = "height"
        public static let durationKey = "duration"

        public static let thumbKey = "thumb"
        public static let mimeTypeKey = "mime_type"
        public static let fileSizeKey = "file_size"
    }

    // MARK: - Primitive types

    /// Unique identifier for this file
    public var fileId: String

    /// Video width as defined by sender
    public var width: Int

    /// Video height as defined by sender
    public var height: Int

    /// Duration of the video in seconds as defined by sender
    public var duration: Int

    /// Optional. Mime type of a file as defined by sender
    public var mimeType: String?

    /// Optional. File size
    public var fileSize: Int?

    // MARK: - Object types

    /// Optional. Video thumbnail
    public var thumb: TelegramPhotoSize?

    public init(json: JSON) throws {
        self.fileId = try json.get(Keys.fileIdKey)
        self.width = try json.get(Keys.widthKey)
        self.height = try json.get(Keys.heightKey)
        self.duration = try json.get(Keys.durationKey)

        self.mimeType = json[Keys.mimeTypeKey]?.string
        self.fileSize = json[Keys.fileSizeKey]?.int

        if let thumbJson = json[Keys.thumbKey] {
            self.thumb = try TelegramPhotoSize(json: thumbJson)
        }
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        try json.set(Keys.fileIdKey, fileId)
        try json.set(Keys.widthKey, width)
        try json.set(Keys.heightKey, height)
        try json.set(Keys.durationKey, duration)

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
