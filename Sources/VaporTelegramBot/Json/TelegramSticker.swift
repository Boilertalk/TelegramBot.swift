//
//  TelegramSticker.swift
//  VaporTelegramBot
//
//  Created by Koray Koska on 14.01.19.
//

import Foundation

public final class TelegramSticker: Codable {

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

    // MARK: - Initialization

    public init(
        fileId: String,
        width: Int,
        height: Int,
        emoji: String?,
        setName: String?,
        fileSize: Int?,
        thumb: TelegramPhotoSize?,
        maskPosition: TelegramMaskPosition?
    ) {
        self.fileId = fileId
        self.width = width
        self.height = height
        self.emoji = emoji
        self.setName = setName
        self.fileSize = fileSize
        self.thumb = thumb
        self.maskPosition = maskPosition
    }
}
