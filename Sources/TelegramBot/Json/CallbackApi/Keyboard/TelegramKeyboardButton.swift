//
//  TelegramKeyboardButton.swift
//  TelegramBot
//
//  Created by Koray Koska on 24.01.19.
//

import Foundation

/// This object represents one button of the reply keyboard. For simple text buttons String can be used
/// instead of this object to specify text of the button. Optional fields are mutually exclusive.
///
/// Note: request_contact and request_location options will only work in Telegram versions released
/// after 9 April, 2016. Older clients will ignore them.
public final class TelegramKeyboardButton: Codable {

    // MARK: - Primitive types

    /// Text of the button. If none of the optional fields are used, it will be sent as a message
    /// when the button is pressed
    public var text: String

    /// Optional. If True, the user's phone number will be sent as a contact when the button
    /// is pressed. Available in private chats only
    public var requestContact: Bool?

    /// Optional. If True, the user's current location will be sent when the button is pressed.
    /// Available in private chats only
    public var requestLocation: Bool?

    // MARK: - Initialization

    public init(text: String, requestContact: Bool? = nil, requestLocation: Bool? = nil) {
        self.text = text
        self.requestContact = requestContact
        self.requestLocation = requestLocation
    }
}
