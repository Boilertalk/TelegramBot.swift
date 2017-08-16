//
// Created by Koray Koska on 16/08/2017.
//

import Foundation
import JSON

public final class TelegramShippingAddress: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let countryCodeKey = "country_code"
        public static let stateKey = "state"
        public static let cityKey = "city"
        public static let streetLine1Key = "street_line1"
        public static let streetLine2Key = "street_line2"
        public static let postCodeKey = "post_code"
    }

    // MARK: - Primitive types

    /// ISO 3166-1 alpha-2 country code
    public var countryCode: String

    /// State, if applicable
    public var state: String

    /// City
    public var city: String

    /// First line for the address
    public var streetLine1: String

    /// Second line for the address
    public var streetLine2: String

    /// Address post code
    public var postCode: String

    public init(json: JSON) throws {
        self.countryCode = try json.get(Keys.countryCodeKey)
        self.state = try json.get(Keys.stateKey)
        self.city = try json.get(Keys.cityKey)
        self.streetLine1 = try json.get(Keys.streetLine1Key)
        self.streetLine2 = try json.get(Keys.streetLine2Key)
        self.postCode = try json.get(Keys.postCodeKey)
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        try json.set(Keys.countryCodeKey, countryCode)
        try json.set(Keys.stateKey, state)
        try json.set(Keys.cityKey, city)
        try json.set(Keys.streetLine1Key, streetLine1)
        try json.set(Keys.streetLine2Key, streetLine2)
        try json.set(Keys.postCodeKey, postCode)

        return json
    }
}
