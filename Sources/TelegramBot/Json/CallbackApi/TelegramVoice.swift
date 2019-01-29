//
//  TelegramVoice.swift
//  TelegramBot
//
//  Created by Koray Koska on 15.01.19.
//

import Foundation

public final class TelegramVoice: Codable {

    // MARK: - Primitive types

    /// Unique identifier for this file
    public var fileId: String

    /// Duration of the audio in seconds as defined by sender
    public var duration: Int

    /// Optional. MIME type of the file as defined by sender
    public var mimeType: String?

    /// Optional. File size
    public var fileSize: Int?

    // MARK: - Initialization

    public init(fileId: String, duration: Int, mimeType: String?, fileSize: Int?) {
        self.fileId = fileId
        self.duration = duration
        self.mimeType = mimeType
        self.fileSize = fileSize
    }
}
