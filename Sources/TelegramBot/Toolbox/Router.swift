//
//  Router.swift
//  TelegramBot
//
//  Created by Koray Koska on 28.01.19.
//

import Foundation

public protocol TelegramHTTPRouter {

    func telegramRegister(path: String, callback: @escaping (_ req: TelegramHTTPRequest, _ cb: @escaping (TelegramHTTPStatus) -> ()) -> ())
}

public protocol TelegramHTTPRequest {

    func json<Type: Decodable>(_ type: Type.Type, decoder: JSONDecoder, callback: @escaping (_ json: Type?, Error?) -> ())
}

public enum TelegramHTTPStatus {

    case ok
    case badRequest
    case internalServerError
}
