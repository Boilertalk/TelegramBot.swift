//
//  TelegramLocation.swift
//  TelegramBot
//
//  Created by Koray Koska on 15.01.19.
//

import Foundation

public final class TelegramLocation: Codable {

    // MARK: - Primitive types

    /// Longitude as defined by sender
    public var longitude: Double

    /// Latitude as defined by sender
    public var latitude: Double

    // MARK: - Initialization

    public init(latitude: Double, longitude: Double) {
        self.longitude = longitude
        self.latitude = latitude
    }
}
