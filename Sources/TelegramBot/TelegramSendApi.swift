//
//  TelegramSendApi.swift
//  TelegramBot
//
//  Created by Koray Koska on 24.01.19.
//

import Foundation

public final class TelegramSendApi {

    public typealias TelegramResponseCompletion<Result: Codable> = (_ resp: TelegramResponse<Result>) -> Void

    public let token: String

    public let provider: TelegramApiProvider

    public init(token: String, provider: TelegramApiProvider) {
        self.token = token
        self.provider = provider
    }

    // MARK: - Methods

    public func getMe(response: @escaping TelegramResponseCompletion<TelegramUser>) {
        let req = EmptyRequest()

        provider.send(method: "getMe", request: req, response: response)
    }

    public func sendMessage(message: TelegramSendMessage, response: @escaping TelegramResponseCompletion<TelegramMessage>) {
        provider.send(method: "sendMessage", request: message, response: response)
    }

    public func forwardMessage(message: TelegramSendForwardMessage, response: @escaping TelegramResponseCompletion<TelegramMessage>) {
        provider.send(method: "forwardMessage", request: message, response: response)
    }

    public func sendPhoto(photo: TelegramSendPhoto, response: @escaping TelegramResponseCompletion<TelegramMessage>) {
        provider.send(method: "sendPhoto", request: photo, response: response)
    }

    public func getFile(fileId: String, response: @escaping TelegramResponseCompletion<TelegramFile>) {
        struct FileRequest: Codable {
            let fileId: String
        }
        let fileRequest = FileRequest(fileId: fileId)
        provider.send(method: "getFile", request: fileRequest, response: response)
    }

    public func answerCallbackQuery(answerCallbackQuery: TelegramSendAnswerCallbackQuery, response: @escaping TelegramResponseCompletion<Bool>) {
        provider.send(method: "answerCallbackQuery", request: answerCallbackQuery, response: response)
    }

    public func editMessageReplyMarkup(editMessageReplyMarkup: TelegramSendEditMessageReplyMarkup, response: @escaping TelegramResponseCompletion<TelegramMessage>) {
        provider.send(method: "editMessageReplyMarkup", request: editMessageReplyMarkup, response: response)
    }

    public func getChatMember(chatId: TelegramSendChatIdentifier, userId: Int, response: @escaping TelegramResponseCompletion<TelegramChatMember>) {
        struct CMRequest: Codable {
            let chatId: TelegramSendChatIdentifier
            let userId: Int
        }
        let cmRequest = CMRequest(chatId: chatId, userId: userId)
        provider.send(method: "getChatMember", request: cmRequest, response: response)
    }

    public func deleteMessage(chatId: TelegramSendChatIdentifier, messageId: Int, response: @escaping TelegramResponseCompletion<Bool>) {
        struct DMRequest: Codable {
            let chatId: TelegramSendChatIdentifier
            let messageId: Int
        }
        let dmRequest = DMRequest(chatId: chatId, messageId: messageId)
        provider.send(method: "deleteMessage", request: dmRequest, response: response)
    }
}

private struct EmptyRequest: Codable {
}
