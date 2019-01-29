//
//  TelegramVideoNote.swift
//  TelegramBot
//
//  Created by Koray Koska on 15.01.19.
//

import Foundation

public final class TelegramVideoNote: Codable {

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

    // MARK: - Initialization

    public init(
        fileId: String,
        length: Int,
        duration: Int,
        fileSize: Int?,
        thumb: TelegramPhotoSize?
    ) {
        self.fileId = fileId
        self.length = length
        self.duration = duration
        self.fileSize = fileSize
        self.thumb = thumb
    }
}
