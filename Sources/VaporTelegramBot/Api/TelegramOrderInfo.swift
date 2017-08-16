//
// Created by Koray Koska on 16/08/2017.
//

import Foundation
import JSON

public final class TelegramOrderInfo: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let nameKey = "name"
        public static let phoneNumberKey = "phone_number"
        public static let emailKey = "email"

        public static let shippingAddressKey = "shipping_address"
    }

    // MARK: - Primitive types

    /// Optional. User name
    public var name: String?

    /// Optional. User's phone number
    public var phoneNumber: String?

    /// Optional. User email
    public var email: String?

    // MARK: - Object types

    /// Optional. Order info provided by the user
    public var shippingAddress: TelegramShippingAddress?

    public init(json: JSON) throws {
        self.name = json[Keys.nameKey]?.string
        self.phoneNumber = json[Keys.phoneNumberKey]?.string
        self.email = json[Keys.emailKey]?.string

        if let shippingAddressJson = json[Keys.shippingAddressKey] {
            self.shippingAddress = try TelegramShippingAddress(json: shippingAddressJson)
        }
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        if let name = name {
            try json.set(Keys.nameKey, name)
        }

        if let phoneNumber = phoneNumber {
            try json.set(Keys.phoneNumberKey, phoneNumber)
        }

        if let email = email {
            try json.set(Keys.emailKey, email)
        }

        if let shippingAddress = shippingAddress {
            try json.set(Keys.shippingAddressKey, shippingAddress.makeJSON())
        }

        return json
    }
}
