//
//  TelegramDocument.swift
//  TelegramBot
//
//  Created by Koray Koska on 14.01.19.
//

import Foundation

public final class TelegramDocument: Codable {

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

    // MARK: - Initialization

    public init(
        fileId: String,
        fileName: String?,
        mimeType: String?,
        fileSize: Int?,
        thumb: TelegramPhotoSize?
    ) {
        self.fileId = fileId
        self.fileName = fileName
        self.mimeType = mimeType
        self.fileSize = fileSize
        self.thumb = thumb
    }
}
