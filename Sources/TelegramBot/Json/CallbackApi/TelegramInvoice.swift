//
//  TelegramInvoice.swift
//  TelegramBot
//
//  Created by Koray Koska on 15.01.19.
//

import Foundation

public final class TelegramInvoice: Codable {

    // MARK: - Primitive types

    /// Product name
    public var title: String

    /// Product description
    public var description: String

    /// Unique bot deep-linking parameter that can be used to generate this invoice
    public var startParameter: String

    /// Three-letter ISO 4217 currency code
    /// Reference: https://core.telegram.org/bots/payments#supported-currencies
    public var currency: String

    /// Total price in the smallest units of the currency (integer, not float/double).
    /// For example, for a price of US$ 1.45 pass amount = 145.
    /// See the exp parameter in currencies.json, it shows the number of digits past
    /// the decimal point for each currency (2 for the majority of currencies).
    /// currencies.json: https://core.telegram.org/bots/payments/currencies.json
    public var totalAmount: Int

    // MARK: - Initialization

    public init(
        title: String,
        description: String,
        startParameter: String,
        currency: String,
        totalAmount: Int
    ) {
        self.title = title
        self.description = description
        self.startParameter = startParameter
        self.currency = currency
        self.totalAmount = totalAmount
    }
}
