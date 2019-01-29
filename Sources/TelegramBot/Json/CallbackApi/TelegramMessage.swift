//
//  TelegramMessage.swift
//  TelegramBot
//
//  Created by Koray Koska on 14.01.19.
//

import Foundation

public final class TelegramMessage: Codable {

    // MARK: - Primitive types

    /// Unique message identifier inside this chat
    public var messageId: Int

    /// Date the message was sent in Unix time
    public var date: Int

    /// Optional. For forwarded channel posts, identifier of the original message in the channel
    public var forwardFromMessageId: Int?

    /// Optional. For messages forwarded from channels, signature of the post author if present
    public var forwardSignature: String?

    /// Optional. For forwarded messages, date the original message was sent in Unix time
    public var forwardDate: Int?

    /// Optional. Date the message was last edited in Unix time
    public var editDate: Int?

    /// Optional. The unique identifier of a media message group this message belongs to
    public var mediaGroupId: String?

    /// Optional. Signature of the post author for messages in channels
    public var authorSignature: String?

    /// Optional. For text messages, the actual UTF-8 text of the message, 0-4096 characters.
    public var text: String?

    /// Optional. Caption for the document, photo or video, 0-200 characters
    public var caption: String?

    /// Optional. A chat title was changed to this value
    public var newChatTitle: String?

    /// Optional. Service message: the chat photo was deleted. Either nil or true
    public var deleteChatPhoto: Bool?

    /// Optional. Service message: the group has been created. Either nil or true
    public var groupChatCreated: Bool?

    /// Optional. Service message: the supergroup has been created.
    /// This field can‘t be received in a message coming through updates,
    /// because bot can’t be a member of a supergroup when it is created.
    /// It can only be found in reply_to_message if someone replies to a
    /// very first message in a directly created supergroup.
    /// Either nil or true
    public var supergroupChatCreated: Bool?

    /// Optional. Service message: the channel has been created.
    /// This field can‘t be received in a message coming through updates,
    /// because bot can’t be a member of a channel when it is created.
    /// It can only be found in reply_to_message if someone replies to a
    /// very first message in a channel.
    /// Either nil or true
    public var channelChatCreated: Bool?

    /// Optional. The group has been migrated to a supergroup with the specified identifier.
    /// This number may be greater than 32 bits and some programming languages may have
    /// difficulty/silent defects in interpreting it. But it is smaller than 52 bits,
    /// so a signed 64 bit integer or double-precision float type are safe for
    /// storing this identifier.
    public var migrateToChatId: Int?

    /// Optional. The supergroup has been migrated from a group with the specified identifier.
    /// This number may be greater than 32 bits and some programming languages may have
    /// difficulty/silent defects in interpreting it. But it is smaller than 52 bits,
    /// so a signed 64 bit integer or double-precision float type are safe for
    /// storing this identifier.
    public var migrateFromChatId: Int?

    /// Optional. The domain name of the website on which the user has logged in.
    /// [More about Telegram Login »](https://core.telegram.org/widgets/login)
    public var connectedWebsite: String?

    // MARK: - Object types

    /// Optional. Sender, can be empty for messages sent to channels
    public var from: TelegramUser?

    /// Conversation the message belongs to
    public var chat: TelegramChat

    /// Optional. For forwarded messages, sender of the original message
    public var forwardFrom: TelegramUser?

    /// Optional. For messages forwarded from a channel, information about the original channel
    public var forwardFromChat: TelegramChat?

    /// Optional. For replies, the original message.
    /// Note that the Message object in this field will not contain further
    /// reply_to_message fields even if it itself is a reply.
    public var replyToMessage: TelegramMessage?

    /// Optional. For text messages, special entities like usernames, URLs, bot commands, etc.
    /// that appear in the text
    public var entities: [TelegramMessageEntity]?

    /// Optional. For messages with a caption, special entities like usernames, URLs, bot commands, etc.
    /// that appear in the caption
    public var captionEntities: [TelegramMessageEntity]?

    /// Optional. Message is an audio file, information about the file
    public var audio: TelegramAudio?

    /// Optional. Message is a general file, information about the file
    public var document: TelegramDocument?

    /// Optional. Message is an animation, information about the animation.
    /// For backward compatibility, when this field is set, the document field will also be set
    public var animation: TelegramAnimation?

    /// Optional. Message is a game, information about the game.
    /// More about games » https://core.telegram.org/bots/api#games
    public var game: TelegramGame?

    /// Optional. Message is a photo, available sizes of the photo
    public var photo: [TelegramPhotoSize]?

    /// Optional. Message is a sticker, information about the sticker
    public var sticker: TelegramSticker?

    /// Optional. Message is a video, information about the video
    public var video: TelegramVideo?

    /// Optional. Message is a voice message, information about the file
    public var voice: TelegramVoice?

    /// Optional. Message is a video note, information about the video message
    public var videoNote: TelegramVideoNote?

    /// Optional. Message is a shared contact, information about the contact
    public var contact: TelegramContact?

    /// Optional. Message is a shared location, information about the location
    public var location: TelegramLocation?

    /// Optional. Message is a venue, information about the venue
    public var venue: TelegramVenue?

    /// Optional. New members that were added to the group or supergroup and information about them
    /// (the bot itself may be one of these members)
    public var newChatMembers: [TelegramUser]?

    /// Optional. A new member was added to the group, information about them
    /// (this member may be the bot itself)
    public var newChatMember: TelegramUser?

    /// Optional. A member was removed from the group, information about them
    /// (this member may be the bot itself)
    public var leftChatMember: TelegramUser?

    /// Optional. A chat photo was change to this value
    public var newChatPhoto: [TelegramPhotoSize]?

    /// Optional. Specified message was pinned. Note that the Message object in this field will not
    /// contain further reply_to_message fields even if it is itself a reply.
    public var pinnedMessage: TelegramMessage?

    /// Optional. Message is an invoice for a payment, information about the invoice.
    /// More about payments » https://core.telegram.org/bots/api#payments
    public var invoice: TelegramInvoice?

    /// Optional. Message is a service message about a successful payment, information about the payment.
    /// More about payments » https://core.telegram.org/bots/api#payments
    public var successfulPayment: TelegramSuccessfulPayment?

    /// Optional. Telegram Passport data
    public var passportData: TelegramPassportData?

    // MARK: - Initialization

    public init(
        messageId: Int,
        date: Int,
        forwardFromMessageId: Int?,
        forwardSignature: String?,
        forwardDate: Int?,
        editDate: Int?,
        mediaGroupId: String?,
        authorSignature: String?,
        text: String?,
        caption: String?,
        newChatTitle: String?,
        deleteChatPhoto: Bool?,
        groupChatCreated: Bool?,
        supergroupChatCreated: Bool?,
        channelChatCreated: Bool?,
        migrateToChatId: Int?,
        migrateFromChatId: Int?,
        connectedWebsite: String?,
        from: TelegramUser?,
        chat: TelegramChat,
        forwardFrom: TelegramUser?,
        forwardFromChat: TelegramChat?,
        replyToMessage: TelegramMessage?,
        entities: [TelegramMessageEntity]?,
        captionEntities: [TelegramMessageEntity]?,
        audio: TelegramAudio?,
        document: TelegramDocument?,
        animation: TelegramAnimation?,
        game: TelegramGame?,
        photo: [TelegramPhotoSize]?,
        sticker: TelegramSticker?,
        video: TelegramVideo?,
        voice: TelegramVoice?,
        videoNote: TelegramVideoNote?,
        contact: TelegramContact?,
        location: TelegramLocation?,
        venue: TelegramVenue?,
        newChatMembers: [TelegramUser]?,
        newChatMember: TelegramUser?,
        leftChatMember: TelegramUser?,
        newChatPhoto: [TelegramPhotoSize]?,
        pinnedMessage: TelegramMessage?,
        invoice: TelegramInvoice?,
        successfulPayment: TelegramSuccessfulPayment?,
        passportData: TelegramPassportData?
    ) {
        self.messageId = messageId
        self.date = date
        self.forwardFromMessageId = forwardFromMessageId
        self.forwardSignature = forwardSignature
        self.forwardDate = forwardDate
        self.editDate = editDate
        self.mediaGroupId = mediaGroupId
        self.authorSignature = authorSignature
        self.text = text
        self.caption = caption
        self.newChatTitle = newChatTitle
        self.deleteChatPhoto = deleteChatPhoto
        self.groupChatCreated = groupChatCreated
        self.supergroupChatCreated = supergroupChatCreated
        self.channelChatCreated = channelChatCreated
        self.migrateToChatId = migrateToChatId
        self.migrateFromChatId = migrateFromChatId
        self.connectedWebsite = connectedWebsite
        self.from = from
        self.chat = chat
        self.forwardFrom = forwardFrom
        self.forwardFromChat = forwardFromChat
        self.replyToMessage = replyToMessage
        self.entities = entities
        self.captionEntities = captionEntities
        self.audio = audio
        self.document = document
        self.animation = animation
        self.game = game
        self.photo = photo
        self.sticker = sticker
        self.video = video
        self.voice = voice
        self.videoNote = videoNote
        self.contact = contact
        self.location = location
        self.venue = venue
        self.newChatMembers = newChatMembers
        self.newChatMember = newChatMember
        self.leftChatMember = leftChatMember
        self.newChatPhoto = newChatPhoto
        self.pinnedMessage = pinnedMessage
        self.invoice = invoice
        self.successfulPayment = successfulPayment
        self.passportData = passportData
    }
}
