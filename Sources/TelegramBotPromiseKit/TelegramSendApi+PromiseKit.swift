import Foundation
import TelegramBot
import PromiseKit

public extension TelegramSendApi {

    func getMe() -> Promise<TelegramUser> {
        return Promise { seal in
            self.getMe { response in
                response.sealPromise(seal: seal)
            }
        }
    }

    func sendMessage(message: TelegramSendMessage) -> Promise<TelegramMessage> {
        return Promise { seal in
            self.sendMessage(message: message) { response in
                response.sealPromise(seal: seal)
            }
        }
    }

    func forwardMessage(message: TelegramSendForwardMessage) -> Promise<TelegramMessage> {
        return Promise { seal in
            self.forwardMessage(message: message) { response in
                response.sealPromise(seal: seal)
            }
        }
    }

    func sendPhoto(photo: TelegramSendPhoto) -> Promise<TelegramMessage> {
        return Promise { seal in
            self.sendPhoto(photo: photo) { response in
                response.sealPromise(seal: seal)
            }
        }
    }

    func getFile(fileId: String) -> Promise<TelegramFile> {
        return Promise { seal in
            self.getFile(fileId: fileId) { response in
                response.sealPromise(seal: seal)
            }
        }
    }

    func answerCallbackQuery(answerCallbackQuery: TelegramSendAnswerCallbackQuery) -> Promise<Bool> {
        return Promise { seal in
            self.answerCallbackQuery(answerCallbackQuery: answerCallbackQuery) { response in
                response.sealPromise(seal: seal)
            }
        }
    }

    func editMessageReplyMarkup(editMessageReplyMarkup: TelegramSendEditMessageReplyMarkup) -> Promise<TelegramMessage> {
        return Promise { seal in
            self.editMessageReplyMarkup(editMessageReplyMarkup: editMessageReplyMarkup) { response in
                response.sealPromise(seal: seal)
            }
        }
    }

    func getChatMember(chatId: TelegramSendChatIdentifier, userId: Int) -> Promise<TelegramChatMember> {
        return Promise { seal in
            self.getChatMember(chatId: chatId, userId: userId) { response in
                response.sealPromise(seal: seal)
            }
        }
    }

    func deleteMessage(chatId: TelegramSendChatIdentifier, messageId: Int) -> Promise<Bool> {
        return Promise { seal in
            self.deleteMessage(chatId: chatId, messageId: messageId) { response in
                response.sealPromise(seal: seal)
            }
        }
    }
}

fileprivate extension TelegramResponse {

    func sealPromise(seal: Resolver<Result>) {
        seal.resolve(result, error)
    }
}
