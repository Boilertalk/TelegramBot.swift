//
//  TelegramOrderInfo.swift
//  TelegramBot
//
//  Created by Koray Koska on 15.01.19.
//

import Foundation

public final class TelegramOrderInfo: Codable {

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

    // MARK: - Initialization

    public init(
        name: String?,
        phoneNumber: String?,
        email: String?,
        shippingAddress: TelegramShippingAddress?
    ) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.shippingAddress = shippingAddress
    }
}
