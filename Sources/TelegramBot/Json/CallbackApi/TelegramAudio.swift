//
//  TelegramAudio.swift
//  TelegramBot
//
//  Created by Koray Koska on 14.01.19.
//

import Foundation

public final class TelegramAudio: Codable {

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

    /// Optional. Thumbnail of the album cover to which the music file belongs
    public var thumb: TelegramPhotoSize?

    // MARK: - Initialization

    public init(
        fileId: String,
        duration: Int,
        performer: String?,
        title: String?,
        mimeType: String?,
        fileSize: Int?,
        thumb: TelegramPhotoSize?
    ) {
        self.fileId = fileId
        self.duration = duration
        self.performer = performer
        self.title = title
        self.mimeType = mimeType
        self.fileSize = fileSize
        self.thumb = thumb
    }
}
