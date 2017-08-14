//
// Created by Koray Koska on 14/08/2017.
//

import Foundation
import JSON

public final class TelegramSticker: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let fileIdKey = "file_id"
        public static let widthKey = "width"
        public static let heightKey = "height"

        public static let thumbKey = "thumb"
        public static let emojiKey = "emoji"
        public static let setNameKey = "set_name"
        public static let maskPositionKey = "mask_position"
        public static let fileSizeKey = "file_size"
    }

    // MARK: - Primitive types

    /// Unique identifier for this file
    public var fileId: String

    /// Sticker width
    public var width: Int

    /// Sticker height
    public var height: Int

    /// Optional. Emoji associated with the sticker
    public var emoji: String?

    /// Optional. Name of the sticker set to which the sticker belongs
    public var setName: String?

    /// Optional. File size
    public var fileSize: Int?

    // MARK: - Object types

    /// Optional. Sticker thumbnail in the .webp or .jpg format
    public var thumb: TelegramPhotoSize?

    /// Optional. For mask stickers, the position where the mask should be placed
    public var maskPosition: TelegramMaskPosition?

    public init(json: JSON) throws {
        self.fileId = try json.get(Keys.fileIdKey)
        self.width = try json.get(Keys.widthKey)
        self.height = try json.get(Keys.heightKey)

        self.emoji = json[Keys.emojiKey]?.string
        self.setName = json[Keys.setNameKey]?.string
        self.fileSize = json[Keys.fileSizeKey]?.int

        if let thumbJson = json[Keys.thumbKey] {
            self.thumb = try TelegramPhotoSize(json: thumbJson)
        }

        if let maskPositionJson = json[Keys.maskPositionKey] {
            self.maskPosition = try TelegramMaskPosition(json: maskPositionJson)
        }
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        try json.set(Keys.fileIdKey, fileId)
        try json.set(Keys.widthKey, width)
        try json.set(Keys.heightKey, height)

        if let emoji = emoji {
            try json.set(Keys.emojiKey, emoji)
        }

        if let setName = setName {
            try json.set(Keys.setNameKey, setName)
        }

        if let fileSize = fileSize {
            try json.set(Keys.fileSizeKey, fileSize)
        }

        if let thumb = thumb {
            try json.set(Keys.thumbKey, thumb.makeJSON())
        }

        if let maskPosition = maskPosition {
            try json.set(Keys.maskPositionKey, maskPosition.makeJSON())
        }

        return json
    }
}
