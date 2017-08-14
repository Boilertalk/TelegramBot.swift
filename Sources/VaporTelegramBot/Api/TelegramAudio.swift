//
// Created by Koray Koska on 14/08/2017.
//

import Foundation
import JSON

public final class TelegramAudio: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let fileIdKey = "file_id"
        public static let durationKey = "duration"

        public static let performerKey = "performer"
        public static let titleKey = "title"
        public static let mimeTypeKey = "mime_type"
        public static let fileSizeKey = "file_size"
    }

    // MARK: - Primitive types

    /// Unique identifier for this file
    public var fileId: String

    /// Duration of the audio in seconds as defined by sender
    public var duration: Int

    /// Optional. Performer of the audio as defined by sender or by audio tags
    public var performer: String?

    /// Optional. Title of the audio as defined by sender or by audio tags
    public var title: String?

    /// Optional. MIME type of the file as defined by sender
    public var mimeType: String?

    /// Optional. File size
    public var fileSize: Int?

    public init(json: JSON) throws {
        self.fileId = try json.get(Keys.fileIdKey)
        self.duration = try json.get(Keys.durationKey)

        self.performer = json[Keys.performerKey]?.string
        self.title = json[Keys.titleKey]?.string
        self.mimeType = json[Keys.mimeTypeKey]?.string
        self.fileSize = json[Keys.fileSizeKey]?.int
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        try json.set(Keys.fileIdKey, fileId)
        try json.set(Keys.durationKey, duration)

        if let performer = performer {
            try json.set(Keys.performerKey, performer)
        }

        if let title = title {
            try json.set(Keys.titleKey, title)
        }

        if let mimeType = mimeType {
            try json.set(Keys.mimeTypeKey, mimeType)
        }

        if let fileSize = fileSize {
            try json.set(Keys.fileSizeKey, fileSize)
        }

        return json
    }
}
