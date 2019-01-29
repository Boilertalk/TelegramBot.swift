//
//  TelegramInlineKeyboardMarkup.swift
//  TelegramBot
//
//  Created by Koray Koska on 24.01.19.
//

import Foundation

public final class TelegramInlineKeyboardMarkup: Codable {

    // MARK: - Object types

    /// Array of button rows, each represented by an Array of
    /// `TelegramInlineKeyboardButton` objects
    public var inlineKeyboard: [[TelegramInlineKeyboardButton]]

    // MARK: - Initialization

    public init(inlineKeyboard: [[TelegramInlineKeyboardButton]]) {
        self.inlineKeyboard = inlineKeyboard
    }
}
