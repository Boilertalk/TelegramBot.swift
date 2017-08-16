//
// Created by Koray Koska on 16/08/2017.
//

import Foundation
import JSON

public final class TelegramInvoice: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let titleKey = "title"
        public static let descriptionKey = "description"
        public static let startParameterKey = "start_parameter"
        public static let currencyKey = "currency"
        public static let totalAmountKey = "total_amount"
    }

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

    public init(json: JSON) throws {
        self.title = try json.get(Keys.titleKey)
        self.description = try json.get(Keys.descriptionKey)
        self.startParameter = try json.get(Keys.startParameterKey)
        self.currency = try json.get(Keys.currencyKey)
        self.totalAmount = try json.get(Keys.totalAmountKey)
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        try json.set(Keys.titleKey, title)
        try json.set(Keys.descriptionKey, description)
        try json.set(Keys.startParameterKey, startParameter)
        try json.set(Keys.currencyKey, currency)
        try json.set(Keys.totalAmountKey, totalAmount)

        return json
    }
}
