//
//  TelegramSuccessfulPayment.swift
//  TelegramBot
//
//  Created by Koray Koska on 15.01.19.
//

import Foundation

public final class TelegramSuccessfulPayment: Codable {

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

    // MARK: - Initialization

    public init(
        currency: String,
        totalAmount: Int,
        invoicePayload: String,
        shippingOptionId: String?,
        telegramPaymentChargeId: String,
        providerPaymentChargeId: String,
        orderInfo: TelegramOrderInfo?
    ) {
        self.currency = currency
        self.totalAmount = totalAmount
        self.invoicePayload = invoicePayload
        self.shippingOptionId = shippingOptionId
        self.telegramPaymentChargeId = telegramPaymentChargeId
        self.providerPaymentChargeId = providerPaymentChargeId
        self.orderInfo = orderInfo
    }
}
