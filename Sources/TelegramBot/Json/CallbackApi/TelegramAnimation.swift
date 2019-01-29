//
//  TelegramAnimation.swift
//  TelegramBot
//
//  Created by Koray Koska on 14.01.19.
//

import Foundation

public final class TelegramAnimation: Codable {

    // MARK: - Primitive types

    /// Unique file identifier
    public var fileId: String

    /// Video width as defined by sender
    public var width: Int

    /// Video height as defined by sender
    public var height: Int

    /// Duration of the video in seconds as defined by sender
    public var duration: Int

    /// Optional. Original animation filename as defined by sender
    public var fileName: String?

    /// Optional. MIME type of the file as defined by sender
    public var mimeType: String?

    /// Optional. File size
    public var fileSize: Int?

    // MARK: - Object types

    /// Optional. Animation thumbnail as defined by sender
    public var thumb: TelegramPhotoSize?

    // MARK: - Initialization

    public init(
        fileId: String,
        width: Int,
        height: Int,
        duration: Int,
        fileName: String?,
        mimeType: String?,
        fileSize: Int?,
        thumb: TelegramPhotoSize?
    ) {
        self.fileId = fileId
        self.width = width
        self.height = height
        self.duration = duration
        self.fileName = fileName
        self.mimeType = mimeType
        self.fileSize = fileSize
        self.thumb = thumb
    }
}
