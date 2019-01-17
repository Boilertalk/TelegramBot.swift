//
//  TelegramChatPhoto.swift
//  VaporTelegramBot
//
//  Created by Koray Koska on 14.01.19.
//

import Foundation

public final class TelegramChatPhoto: Codable {

    // MARK: - Primitive types

    /// Unique file identifier of small (160x160) chat photo. This file_id can be used only for photo download.
    public var smallFileId: String

    /// Unique file identifier of big (640x640) chat photo. This file_id can be used only for photo download.
    public var bigFileId: String

    // MARK: - Initialization

    public init(smallFileId: String, bigFileId: String) {
        self.smallFileId = smallFileId
        self.bigFileId = bigFileId
    }
}
