//
// Created by Koray Koska on 15/08/2017.
//

import Foundation
import JSON

public final class TelegramVideoNote: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let fileIdKey = "file_id"
        public static let lengthKey = "length"
        public static let durationKey = "duration"

        public static let thumbKey = "thumb"
        public static let fileSizeKey = "file_size"
    }

    // MARK: - Primitive types

    /// Unique identifier for this file
    public var fileId: String

    /// Video width and height as defined by sender
    public var length: Int

    /// Duration of the video in seconds as defined by sender
    public var duration: Int

    /// Optional. File size
    public var fileSize: Int?

    // MARK: -- Object types

    /// Optional. Video thumbnail
    public var thumb: TelegramPhotoSize?

    public init(json: JSON) throws {
        self.fileId = try json.get(Keys.fileIdKey)
        self.length = try json.get(Keys.lengthKey)
        self.duration = try json.get(Keys.durationKey)

        self.fileSize = json[Keys.fileSizeKey]?.int

        if let thumbJson = json[Keys.thumbKey] {
            self.thumb = try TelegramPhotoSize(json: thumbJson)
        }
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        try json.set(Keys.fileIdKey, fileId)
        try json.set(Keys.lengthKey, length)
        try json.set(Keys.durationKey, duration)


        if let fileSize = fileSize {
            try json.set(Keys.fileSizeKey, fileSize)
        }

        if let thumb = thumb {
            try json.set(Keys.thumbKey, thumb.makeJSON())
        }

        return json
    }
}
