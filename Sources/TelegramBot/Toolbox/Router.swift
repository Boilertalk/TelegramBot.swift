//
//  Router.swift
//  TelegramBot
//
//  Created by Koray Koska on 28.01.19.
//

import Foundation

public protocol TelegramHTTPRouter {

    func register(path: String, callback: @escaping (_ req: TelegramHTTPRequest, _ cb: @escaping (TelegramHTTPStatus) -> ()) throws -> ())
}

public protocol TelegramHTTPRequest {

    func json<Type: Decodable>(_ type: Type.Type, decoder: JSONDecoder, callback: @escaping (_ json: Type) -> ()) throws
}

public enum TelegramHTTPStatus {

    case ok
    case badRequest
    case internalServerError
}

// MARK: - Default Vapor implementation

#if canImport(Vapor)

import Vapor

extension Router {

    public func register(path: String, callback: @escaping (_ req: TelegramHTTPRequest, _ cb: @escaping (TelegramHTTPStatus) -> ()) throws -> ()) {
        post(path) { reqInternal -> Future<HTTPStatus> in
            let promiseStatus = reqInternal.eventLoop.newPromise(HTTPStatus.self)

            try callback(reqInternal) { status in
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

#endif
