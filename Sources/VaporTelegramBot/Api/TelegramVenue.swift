//
// Created by Koray Koska on 16/08/2017.
//

import Foundation
import JSON

public final class TelegramVenue: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let titleKey = "title"
        public static let addressKey = "address"
        public static let foursquareIdKey = "foursquare_id"

        public static let locationKey = "location"
    }

    // MARK: - Primitive types

    /// Name of the venue
    public var title: String

    /// Address of the venue
    public var address: String

    /// Optional. Foursquare identifier of the venue
    public var foursquareId: String?

    // MARK: - Object types

    /// Venue location
    public var location: TelegramLocation

    public init(json: JSON) throws {
        self.title = try json.get(Keys.titleKey)
        self.address = try json.get(Keys.addressKey)

        self.foursquareId = json[Keys.foursquareIdKey]?.string

        self.location = try TelegramLocation(json: try json.get(Keys.locationKey))
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        try json.set(Keys.titleKey, title)
        try json.set(Keys.addressKey, address)

        if let foursquareId = foursquareId {
            try json.set(Keys.foursquareIdKey, foursquareId)
        }

        try json.set(Keys.locationKey, location.makeJSON())

        return json
    }
}
