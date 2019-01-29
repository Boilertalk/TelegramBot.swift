//
//  TelegramPassportFile.swift
//  TelegramBot
//
//  Created by Koray Koska on 17.01.19.
//

import Foundation

public final class TelegramPassportFile: Codable {

    // MARK: - Primitive types

    /// Unique identifier for this file
    public var fileId: String

    /// File size
    public var fileSize: Int

    /// Unix time when the file was uploaded
    public var fileDate: Int

    // MARK: - Initialization

    public init(
        fileId: String,
        fileSize: Int,
        fileDate: Int
    ) {
        self.fileId = fileId
        self.fileSize = fileSize
        self.fileDate = fileDate
    }
}
