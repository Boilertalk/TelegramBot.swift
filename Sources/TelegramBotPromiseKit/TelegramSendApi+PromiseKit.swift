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
}

fileprivate extension TelegramResponse {

    fileprivate func sealPromise(seal: Resolver<Result>) {
        seal.resolve(result, error)
    }
}
