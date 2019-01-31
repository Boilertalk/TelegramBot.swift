// MARK: - Default Vapor implementation

import TelegramBot
import Vapor
import Dispatch

extension Router {

    public func telegramRegister(path: String, callback: @escaping (_ req: TelegramHTTPRequest, _ cb: @escaping (TelegramHTTPStatus) -> ()) -> ()) {
        post(path) { reqInternal -> Future<HTTPStatus> in
            let promiseStatus = reqInternal.eventLoop.newPromise(HTTPStatus.self)

            let queue = DispatchQueue(label: "TelegramRegister")
            queue.async {
                callback(reqInternal) { status in
                    switch status {
                    case .ok:
                        promiseStatus.succeed(result: .ok)
                    case .badRequest:
                        promiseStatus.succeed(result: .badRequest)
                    case .internalServerError:
                        promiseStatus.succeed(result: .internalServerError)
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
            try content.decode(json: Type.self, using: decoder).map { decoded -> () in
                callback(decoded, nil)

                return ()
                }.catch { error in
                    callback(nil, error)
            }
        } catch {
            callback(nil, error)
        }
    }
}
