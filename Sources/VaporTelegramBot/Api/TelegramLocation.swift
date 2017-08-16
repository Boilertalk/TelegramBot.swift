//
// Created by Koray Koska on 16/08/2017.
//

import Foundation
import JSON

public final class TelegramLocation: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let longitudeKey = "longitude"
        public static let latitudeKey = "latitude"
    }

    // MARK: - Primitive types

    /// Longitude as defined by sender
    public var longitude: Double

    /// Latitude as defined by sender
    public var latitude: Double

    public init(json: JSON) throws {
        self.longitude = try json.get(Keys.longitudeKey)
        self.latitude = try json.get(Keys.latitudeKey)
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        try json.set(Keys.longitudeKey, longitude)
        try json.set(Keys.latitudeKey, latitude)

        return json
    }
}
