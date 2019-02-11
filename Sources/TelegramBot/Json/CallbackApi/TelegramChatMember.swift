//
//  TelegramChatMember.swift
//  TelegramBot
//
//  Created by Koray Koska on 11.02.19.
//

import Foundation

public final class TelegramChatMember: Codable {

    // MARK: - Primitive types

    /// The member's status in the chat. Can be “creator”, “administrator”,
    /// “member”, “restricted”, “left” or “kicked”
    public var status: Status

    /// Optional. Restricted and kicked only. Date when restrictions will be lifted
    /// for this user, unix time
    public var untilDate: Int?

    /// Optional. Administrators only. True, if the bot is allowed to edit
    /// administrator privileges of that user
    public var canBeEdited: Bool?

    /// Optional. Administrators only. True, if the administrator can change the
    /// chat title, photo and other settings
    public var canChangeInfo: Bool?

    /// Optional. Administrators only. True, if the administrator can post in the
    /// channel, channels only
    public var canPostMessages: Bool?

    /// Optional. Administrators only. True, if the administrator can edit
    /// messages of other users and can pin messages, channels only
    public var canEditMessages: Bool?

    /// Optional. Administrators only. True, if the administrator can delete
    /// messages of other users
    public var canDeleteMessages: Bool?

    /// Optional. Administrators only. True, if the administrator can invite new
    /// users to the chat
    public var canInviteUsers: Bool?

    /// Optional. Administrators only. True, if the administrator can restrict, ban
    /// or unban chat members
    public var canRestrictMembers: Bool?

    /// Optional. Administrators only. True, if the administrator can pin
    /// messages, supergroups only
    public var canPinMessages: Bool?

    /// Optional. Administrators only. True, if the administrator can add new
    /// administrators with a subset of his own privileges or demote
    /// administrators that he has promoted, directly or indirectly (promoted by
    /// administrators that were appointed by the user)
    public var canPromoteMembers: Bool?

    /// Optional. Restricted only. True, if the user can send text messages,
    /// contacts, locations and venues
    public var canSendMessages: Bool?

    /// Optional. Restricted only. True, if the user can send audios, documents,
    /// photos, videos, video notes and voice notes, implies can_send_messages
    public var canSendMediaMessages: Bool?

    /// Optional. Restricted only. True, if the user can send animations, games,
    /// stickers and use inline bots, implies can_send_media_messages
    public var canSendOtherMessages: Bool?

    /// Optional. Restricted only. True, if user may add web page previews to his
    /// messages, implies can_send_media_messages
    public var canAddWebPagePreviews: Bool?

    // MARK: - Object types

    /// Information about the user
    public var user: TelegramUser

    // MARK: - Initialization

    // MARK: - Custom Types

    public enum Status: String, Codable {

        case creator

        case administrator

        case member

        case restricted

        case left

        case kicked
    }
}
