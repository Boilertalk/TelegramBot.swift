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
}

private struct EmptyRequest: Codable {
}
