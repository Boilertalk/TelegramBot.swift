//
//  TelegramPreCheckoutQuery.swift
//  VaporTelegramBot
//
//  Created by Koray Koska on 17.01.19.
//

import Foundation

public final class TelegramPreCheckoutQuery: Codable {

    // MARK: - Primitive types

    /// Unique query identifier
    public var id: String

    /// Three-letter ISO 4217 [currency](https://core.telegram.org/bots/payments#supported-currencies) code
    public var currency: String

    /// Total price in the smallest units of the currency (integer, not float/double). For example, for a price
    /// of US$ 1.45 pass amount = 145. See the exp parameter in
    /// [currencies.json](https://core.telegram.org/bots/payments/currencies.json), it shows the number of digits
    /// past the decimal point for each currency (2 for the majority of currencies).
    public var totalAmount: Int

    /// Bot specified invoice payload
    public var invoicePayload: String

    /// Optional. Identifier of the shipping option chosen by the user
    public var shippingOptionId: String?

    // MARK: - Object types

    /// User who sent the query
    public var from: TelegramUser

    /// Optional. Order info provided by the user
    public var orderInfo: TelegramOrderInfo?

    // MARK: - Initialization

    public init(
        id: String,
        currency: String,
        totalAmount: Int,
        invoicePayload: String,
        shippingOptionId: String?,
        from: TelegramUser,
        orderInfo: TelegramOrderInfo?
    ) {
        self.id = id
        self.currency = currency
        self.totalAmount = totalAmount
        self.invoicePayload = invoicePayload
        self.shippingOptionId = shippingOptionId
        self.from = from
        self.orderInfo = orderInfo
    }
}
