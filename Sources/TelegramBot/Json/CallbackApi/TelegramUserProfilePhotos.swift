//
//  TelegramUserProfilePhotos.swift
//  TelegramBot
//
//  Created by Koray Koska on 17.01.19.
//

import Foundation

public final class TelegramUserProfilePhotos: Codable {

    // MARK: - Primitive types

    /// Total number of profile pictures the target user has
    public var totalCount: Int

    // MARK: - Object types

    /// Requested profile pictures (in up to 4 sizes each)
    public var photos: [[TelegramPhotoSize]]

    // MARK: - Initialization

    public init(
        totalCount: Int,
        photos: [[TelegramPhotoSize]]
    ) {
        self.totalCount = totalCount
        self.photos = photos
    }
}
