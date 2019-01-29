//
//  TelegramShippingQuery.swift
//  TelegramBot
//
//  Created by Koray Koska on 17.01.19.
//

import Foundation

public final class TelegramShippingQuery: Codable {

    // MARK: - Primitive types

    /// Unique query identifier
    public var id: String

    /// Bot specified invoice payload
    public var invoicePayload: String

    // MARK: - Object types

    /// User who sent the query
    public var from: TelegramUser

    /// User specified shipping address
    public var shippingAddress: TelegramShippingAddress

    // MARK: - Initialization

    public init(
        id: String,
        invoicePayload: String,
        from: TelegramUser,
        shippingAddress: TelegramShippingAddress
    ) {
        self.id = id
        self.invoicePayload = invoicePayload
        self.from = from
        self.shippingAddress = shippingAddress
    }
}
