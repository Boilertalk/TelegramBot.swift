// MARK: - Default Vapor implementation

import TelegramBot
import Vapor
import Dispatch

extension Application {

    public func telegramRegister(path: String, callback: @escaping (_ req: TelegramHTTPRequest, _ cb: @escaping (TelegramHTTPStatus) -> ()) -> ()) {
        post("\(path)") { request -> EventLoopFuture<HTTPStatus> in
            let promiseStatus = request.eventLoop.makePromise(of: HTTPStatus.self)

            let queue = DispatchQueue(label: "TelegramRegister")
            queue.async {
                callback(request) { status in
                    switch status {
                    case .ok:
                        promiseStatus.succeed(.ok)
                    case .badRequest:
                        promiseStatus.succeed(.badRequest)
                    case .internalServerError:
                        promiseStatus.succeed(.internalServerError)
                    }
                }
            }

            return promiseStatus.futureResult
        }
    }
}

extension Request: TelegramHTTPRequest {

    public func json<Type: Decodable>(_ type: Type.Type, decoder: JSONDecoder, callback: @escaping (Type?, Error?) -> ()) {
        do {
            try callback(content.decode(Type.self, using: decoder), nil)
        } catch {
            callback(nil, error)
        }
    }
}
