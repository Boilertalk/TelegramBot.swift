//
// Created by Koray Koska on 16/08/2017.
//

import Foundation
import JSON

public final class TelegramContact: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let phoneNumberKey = "phone_number"
        public static let firstNameKey = "first_name"

        public static let lastNameKey = "last_name"
        public static let userIdKey = "user_id"
    }

    // MARK: - Primitive types

    /// Contact's phone number
    public var phoneNumber: String

    /// Contact's first name
    public var firstName: String

    /// Optional. Contact's last name
    public var lastName: String?

    /// Optional. Contact's user identifier in Telegram
    public var userId: Int?

    public init(json: JSON) throws {
        self.phoneNumber = try json.get(Keys.phoneNumberKey)
        self.firstName = try json.get(Keys.firstNameKey)

        self.lastName = json[Keys.lastNameKey]?.string
        self.userId = json[Keys.userIdKey]?.int
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        try json.set(Keys.phoneNumberKey, phoneNumber)
        try json.set(Keys.firstNameKey, firstName)

        if let lastName = lastName {
            try json.set(Keys.lastNameKey, lastName)
        }

        if let userId = userId {
            try json.set(Keys.userIdKey, userId)
        }

        return json
    }
}
