//
// Created by Koray Koska on 10/08/2017.
//

import Foundation
import JSON

public final class TelegramChat: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let idKey = "id"
        public static let typeKey = "type"
        public static let titleKey = "title"
        public static let usernameKey = "username"
        public static let firstNameKey = "first_name"
        public static let lastNameKey = "last_name"
        public static let allMembersAreAdministratorsKey = "all_members_are_administrators"
        public static let descriptionKey = "description"
        public static let inviteLinkKey = "invite_link"

        public static let photoKey = "photo"
    }

    // MARK: - Primitive types

    /// Unique identifier for this chat.
    /// This number may be greater than 32 bits and some programming languages
    /// may have difficulty/silent defects in interpreting it.
    /// But it is smaller than 52 bits, so a signed 64 bit integer
    /// or double-precision float type are safe for storing this identifier.
    public var id: Int

    /// Type of chat, can be either “private”, “group”, “supergroup” or “channel”
    public var type: TelegramChatType

    /// Optional. Title, for supergroups, channels and group chats
    public var title: String?

    /// Optional. Username, for private chats, supergroups and channels if available
    public var username: String?

    /// Optional. First name of the other party in a private chat
    public var firstName: String?

    /// Optional. Last name of the other party in a private chat
    public var lastName: String?

    /// Optional. True if a group has ‘All Members Are Admins’ enabled.
    public var allMembersAreAdministrators: Bool?

    /// Optional. Description, for supergroups and channel chats. Returned only in getChat.
    public var description: String?

    /// Optional. Chat invite link, for supergroups and channel chats. Returned only in getChat.
    public var inviteLink: String?

    // MARK: - Object types

    /// Optional. Chat photo. Returned only in getChat.
    public var photo: TelegramChatPhoto?

    public init(json: JSON) throws {
        // *** Primitive types ***
        self.id = try json.get(Keys.idKey)
        if let type = TelegramChatType(rawValue: try json.get(Keys.typeKey)) {
            self.type = type
        } else {
            throw VaporTelegramError.requiredParameterMissing(parameter: Keys.typeKey)
        }

        self.title = json[Keys.titleKey]?.string
        self.username = json[Keys.usernameKey]?.string

        self.firstName = json[Keys.firstNameKey]?.string
        self.lastName = json[Keys.lastNameKey]?.string

        self.allMembersAreAdministrators = json[Keys.allMembersAreAdministratorsKey]?.bool

        self.description = json[Keys.descriptionKey]?.string
        self.inviteLink = json[Keys.inviteLinkKey]?.string
        // *** End Primitive types ***

        // *** Object types ***
        if let photoJson = json[Keys.photoKey] {
            self.photo = try TelegramChatPhoto(json: photoJson)
        }
        // *** End Object types ***
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        try json.set(Keys.idKey, id)
        try json.set(Keys.typeKey, type.rawValue)

        if let title = title {
            try json.set(Keys.titleKey, title)
        }
        if let username = username {
            try json.set(Keys.usernameKey, username)
        }

        if let firstName = firstName {
            try json.set(Keys.firstNameKey, firstName)
        }
        if let lastName = lastName {
            try json.set(Keys.lastNameKey, lastName)
        }

        if let allMembersAreAdministrators = allMembersAreAdministrators {
            try json.set(Keys.allMembersAreAdministratorsKey, allMembersAreAdministrators)
        }

        if let description = description {
            try json.set(Keys.descriptionKey, description)
        }
        if let inviteLink = inviteLink {
            try json.set(Keys.inviteLinkKey, inviteLink)
        }

        if let photo = photo {
            try json.set(Keys.photoKey, photo.makeJSON())
        }

        return json
    }
}

public enum TelegramChatType: String {

    case privateChat = "private"
    case groupChat = "group"
    case supergroupChat = "supergroup"
    case channelChat = "channel"
}
