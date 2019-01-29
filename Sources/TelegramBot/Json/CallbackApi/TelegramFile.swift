//
//  TelegramFile.swift
//  TelegramBot
//
//  Created by Koray Koska on 17.01.19.
//

import Foundation

public final class TelegramFile: Codable {

    // MARK: - Primitive types

    /// Unique identifier for this file
    public var fileId: String

    /// Optional. File size, if known
    public var fileSize: Int?

    /// Optional. File path. Use https://api.telegram.org/file/bot<token>/<file_path> to get the
    /// file.
    public var filePath: String?

    // MARK: - Initialization

    public init(
        fileId: String,
        fileSize: Int?,
        filePath: String?
    ) {
        self.fileId = fileId
        self.fileSize = fileSize
        self.filePath = filePath
    }
}
