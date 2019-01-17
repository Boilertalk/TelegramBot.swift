//
//  TelegramPhotoSize.swift
//  VaporTelegramBot
//
//  Created by Koray Koska on 14.01.19.
//

import Foundation

public final class TelegramPhotoSize: Codable {

    // MARK: - Primitive types

    /// Unique identifier for this file
    public var fileId: String

    /// Photo width
    public var width: Int

    /// Photo height
    public var height: Int

    /// Optional. File size
    public var fileSize: Int?

    // MARK: - Initialization

    public init(
        fileId: String,
        width: Int,
        height: Int,
        fileSize: Int?
    ) {
        self.fileId = fileId
        self.width = width
        self.height = height
        self.fileSize = fileSize
    }
}
