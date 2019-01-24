//
//  TelegramShippingAddress.swift
//  VaporTelegramBot
//
//  Created by Koray Koska on 15.01.19.
//

import Foundation

public final class TelegramShippingAddress: Codable {

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

    // MARK: - Initialization

    public init(countryCode: String, state: String, city: String, streetLine1: String, streetLine2: String, postCode: String) {
        self.countryCode = countryCode
        self.state = state
        self.city = city
        self.streetLine1 = streetLine1
        self.streetLine2 = streetLine2
        self.postCode = postCode
    }
}
