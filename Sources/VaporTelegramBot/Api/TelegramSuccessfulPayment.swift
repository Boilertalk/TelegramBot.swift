//
// Created by Koray Koska on 16/08/2017.
//

import Foundation
import JSON

public final class TelegramSuccessfulPayment: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let currencyKey = "currency"
        public static let totalAmountKey = "total_amount"
        public static let invoicePayloadKey = "invoice_payload"
        public static let shippingOptionIdKey = "shipping_option_id"
        public static let telegramPaymentChargeIdKey = "telegram_payment_charge_id"
        public static let providerPaymentChargeIdKey = "provider_payment_charge_id"

        public static let orderInfoKey = "order_info"
    }

    // MARK: - Primitive types

    /// Three-letter ISO 4217 currency code
    /// Supported currencies: https://core.telegram.org/bots/payments#supported-currencies
    public var currency: String

    /// Total price in the smallest units of the currency (integer, not float/double).
    /// For example, for a price of US$ 1.45 pass amount = 145.
    /// See the exp parameter in currencies.json, it shows the number of digits past
    /// the decimal point for each currency (2 for the majority of currencies).
    /// currencies.json: https://core.telegram.org/bots/payments/currencies.json
    public var totalAmount: Int

    /// Bot specified invoice payload
    public var invoicePayload: String

    /// Optional. Identifier of the shipping option chosen by the user
    public var shippingOptionId: String?

    /// Telegram payment identifier
    public var telegramPaymentChargeId: String

    /// Provider payment identifier
    public var providerPaymentChargeId: String

    // MARK: - Object types

    /// Optional. Order info provided by the user
    public var orderInfo: TelegramOrderInfo?

    public init(json: JSON) throws {
        self.currency = try json.get(Keys.currencyKey)
        self.totalAmount = try json.get(Keys.totalAmountKey)
        self.invoicePayload = try json.get(Keys.invoicePayloadKey)
        self.telegramPaymentChargeId = try json.get(Keys.telegramPaymentChargeIdKey)
        self.providerPaymentChargeId = try json.get(Keys.providerPaymentChargeIdKey)

        self.shippingOptionId = json[Keys.shippingOptionIdKey]?.string

        if let orderInfoJson = json[Keys.orderInfoKey] {
            self.orderInfo = try TelegramOrderInfo(json: orderInfoJson)
        }
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        try json.set(Keys.currencyKey, currency)
        try json.set(Keys.totalAmountKey, totalAmount)
        try json.set(Keys.invoicePayloadKey, invoicePayload)
        try json.set(Keys.telegramPaymentChargeIdKey, telegramPaymentChargeId)
        try json.set(Keys.providerPaymentChargeIdKey, providerPaymentChargeId)

        if let shippingOptionId = shippingOptionId {
            try json.set(Keys.shippingOptionIdKey, shippingOptionId)
        }

        if let orderInfo = orderInfo {
            try json.set(Keys.orderInfoKey, orderInfo.makeJSON())
        }

        return json
    }
}
