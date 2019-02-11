import Foundation
import TelegramBot
import PromiseKit

public extension TelegramSendApi {

    public func getMe() -> Promise<TelegramUser> {
        return Promise { seal in
            self.getMe { response in
                response.sealPromise(seal: seal)
            }
        }
    }

    public func sendMessage(message: TelegramSendMessage) -> Promise<TelegramMessage> {
        return Promise { seal in
            self.sendMessage(message: message) { response in
                response.sealPromise(seal: seal)
            }
        }
    }

    public func forwardMessage(message: TelegramSendForwardMessage) -> Promise<TelegramMessage> {
        return Promise { seal in
            self.forwardMessage(message: message) { response in
                response.sealPromise(seal: seal)
            }
        }
    }

    public func sendPhoto(photo: TelegramSendPhoto) -> Promise<TelegramMessage> {
        return Promise { seal in
            self.sendPhoto(photo: photo) { response in
                response.sealPromise(seal: seal)
            }
        }
    }

    public func getFile(fileId: String) -> Promise<TelegramFile> {
        return Promise { seal in
            self.getFile(fileId: fileId) { response in
                response.sealPromise(seal: seal)
            }
        }
    }

    public func answerCallbackQuery(answerCallbackQuery: TelegramSendAnswerCallbackQuery) -> Promise<Bool> {
        return Promise { seal in
            self.answerCallbackQuery(answerCallbackQuery: answerCallbackQuery) { response in
                response.sealPromise(seal: seal)
            }
        }
    }

    public func editMessageReplyMarkup(editMessageReplyMarkup: TelegramSendEditMessageReplyMarkup) -> Promise<TelegramMessage> {
        return Promise { seal in
            self.editMessageReplyMarkup(editMessageReplyMarkup: editMessageReplyMarkup) { response in
                response.sealPromise(seal: seal)
            }
        }
    }

    public func getChatMember(chatId: TelegramSendChatIdentifier, userId: Int) -> Promise<TelegramChatMember> {
        return Promise { seal in
            self.getChatMember(chatId: chatId, userId: userId) { response in
                response.sealPromise(seal: seal)
            }
        }
    }

    public func deleteMessage(chatId: TelegramSendChatIdentifier, messageId: Int) -> Promise<Bool> {
        return Promise { seal in
            self.deleteMessage(chatId: chatId, messageId: messageId) { response in
                response.sealPromise(seal: seal)
            }
        }
    }
}

fileprivate extension TelegramResponse {

    fileprivate func sealPromise(seal: Resolver<Result>) {
        seal.resolve(result, error)
    }
}
