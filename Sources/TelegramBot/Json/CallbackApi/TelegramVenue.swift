//
//  TelegramVenue.swift
//  TelegramBot
//
//  Created by Koray Koska on 15.01.19.
//

import Foundation

public final class TelegramVenue: Codable {

    // MARK: - Primitive types

    /// Name of the venue
    public var title: String

    /// Address of the venue
    public var address: String

    /// Optional. Foursquare identifier of the venue
    public var foursquareId: String?

    /// Optional. Foursquare type of the venue.
    /// (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
    public var foursquareType: String?

    // MARK: - Object types

    /// Venue location
    public var location: TelegramLocation

    // MARK: - Initialization

    public init(
        title: String,
        address: String,
        foursquareId: String?,
        foursquareType: String?,
        location: TelegramLocation
    ) {
        self.title = title
        self.address = address
        self.foursquareId = foursquareId
        self.location = location
    }
}
