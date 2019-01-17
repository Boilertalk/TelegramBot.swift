//
//  TelegramEncryptedPassportElement.swift
//  VaporTelegramBot
//
//  Created by Koray Koska on 17.01.19.
//

import Foundation

public final class TelegramEncryptedPassportElement: Codable {

    // MARK: - Primitive types

    /// Element type. One of “personal_details”, “passport”, “driver_license”,
    /// “identity_card”, “internal_passport”, “address”, “utility_bill”, “bank_statement”,
    /// “rental_agreement”, “passport_registration”, “temporary_registration”,
    /// “phone_number”, “email”.
    public var type: String

    /// Optional. Base64-encoded encrypted Telegram Passport element data provided by
    /// the user, available for “personal_details”, “passport”, “driver_license”,
    /// “identity_card”, “internal_passport” and “address” types. Can be decrypted and
    /// verified using the accompanying `TelegramEncryptedCredentials`.
    public var data: String?

    /// Optional. User's verified phone number, available only for “phone_number” type
    public var phoneNumber: String?

    /// Optional. User's verified email address, available only for “email” type
    public var email: String?

    /// Base64-encoded element hash for using in `TelegramPassportElementErrorUnspecified`
    public var hash: String

    // MARK: - Object types

    /// Optional. Array of encrypted files with documents provided by the user, available
    /// for “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration” and
    /// “temporary_registration” types. Files can be decrypted and verified using the
    /// accompanying `TelegramEncryptedCredentials`.
    public var files: [TelegramPassportFile]?

    /// Optional. Encrypted file with the front side of the document, provided by the user.
    /// Available for “passport”, “driver_license”, “identity_card” and “internal_passport”.
    /// The file can be decrypted and verified using the accompanying
    /// `TelegramEncryptedCredentials`.
    public var frontSide: TelegramPassportFile?

    /// Optional. Encrypted file with the reverse side of the document, provided by the
    /// user. Available for “driver_license” and “identity_card”. The file can be decrypted
    /// and verified using the accompanying `TelegramEncryptedCredentials`.
    public var reverseSide: TelegramPassportFile?

    /// Optional. Encrypted file with the selfie of the user holding a document, provided by
    /// the user; available for “passport”, “driver_license”, “identity_card” and
    /// “internal_passport”. The file can be decrypted and verified using the accompanying
    /// `TelegramEncryptedCredentials`.
    public var selfie: TelegramPassportFile?

    /// Optional. Array of encrypted files with translated versions of documents provided
    /// by the user. Available if requested for “passport”, “driver_license”, “identity_card”,
    /// “internal_passport”, “utility_bill”, “bank_statement”, “rental_agreement”,
    /// “passport_registration” and “temporary_registration” types. Files can be decrypted
    /// and verified using the accompanying `TelegramEncryptedCredentials`.
    public var translation: [TelegramPassportFile]?

    // MARK: - Initialization

    public init(
        type: String,
        data: String?,
        phoneNumber: String?,
        email: String?,
        hash: String,
        files: [TelegramPassportFile]?,
        frontSide: TelegramPassportFile?,
        reverseSide: TelegramPassportFile?,
        selfie: TelegramPassportFile?,
        translation: [TelegramPassportFile]?
    ) {
        self.type = type
        self.data = data
        self.phoneNumber = phoneNumber
        self.email = email
        self.hash = hash
        self.files = files
        self.frontSide = frontSide
        self.reverseSide = reverseSide
        self.selfie = selfie
        self.translation = translation
    }
}
