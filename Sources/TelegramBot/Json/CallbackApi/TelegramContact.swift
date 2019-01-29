//
//  TelegramContact.swift
//  TelegramBot
//
//  Created by Koray Koska on 15.01.19.
//

import Foundation

public final class TelegramContact: Codable {

    // MARK: - Primitive types

    /// Contact's phone number
    public var phoneNumber: String

    /// Contact's first name
    public var firstName: String

    /// Optional. Contact's last name
    public var lastName: String?

    /// Optional. Contact's user identifier in Telegram
    public var userId: Int?

    /// Optional. Additional data about the contact in the form of a [vCard](https://en.wikipedia.org/wiki/VCard)
    public var vcard: String?

    // MARK: - Initialization

    public init(
        phoneNumber: String,
        firstName: String,
        lastName: String?,
        userId: Int?,
        vcard: String?
    ) {
        self.phoneNumber = phoneNumber
        self.firstName = firstName
        self.lastName = lastName
        self.userId = userId
        self.vcard = vcard
    }
}
