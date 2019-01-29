//
//  TelegramVideo.swift
//  TelegramBot
//
//  Created by Koray Koska on 15.01.19.
//

import Foundation

public final class TelegramVideo: Codable {

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

    // MARK: - Initialization

    public init(
        fileId: String,
        width: Int,
        height: Int,
        duration: Int,
        mimeType: String?,
        fileSize: Int?,
        thumb: TelegramPhotoSize?
    ) {
        self.fileId = fileId
        self.width = width
        self.height = height
        self.duration = duration
        self.mimeType = mimeType
        self.fileSize = fileSize
        self.thumb = thumb
    }
}
