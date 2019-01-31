// MARK: - Default Vapor implementation

import TelegramBot
import Vapor

extension Router {

    public func telegramRegister(path: String, callback: @escaping (_ req: TelegramHTTPRequest, _ cb: @escaping (TelegramHTTPStatus) -> ()) -> ()) {
        post(path) { reqInternal -> Future<HTTPStatus> in
            let promiseStatus = reqInternal.eventLoop.newPromise(HTTPStatus.self)

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

            return promiseStatus.futureResult
        }
    }
}

extension Request: TelegramHTTPRequest {

    public func json<Type: Decodable>(_ type: Type.Type, decoder: JSONDecoder, callback: @escaping (Type) -> ()) throws {
        _ = try content.decode(json: Type.self, using: decoder).map { decoded -> () in
            callback(decoded)

            return ()
        }
    }
}
