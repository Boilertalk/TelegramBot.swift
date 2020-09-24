//
//  TelegramApiHttpProvider.swift
//  TelegramBot
//
//  Created by Koray Koska on 29.01.19.
//

import Foundation
import Dispatch
#if os(Linux)
import FoundationNetworking
#endif

public struct TelegramApiHttpProvider: TelegramApiProvider {

    let encoder: JSONEncoder
    let decoder: JSONDecoder

    let queue: DispatchQueue

    let session: URLSession

    static let headers = [
        "Accept": "application/json",
        "Content-Type": "application/json"
    ]

    public let url: String

    public init(url: String, session: URLSession = URLSession(configuration: .default)) {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        self.encoder = encoder
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        self.decoder = decoder

        self.url = url
        self.session = session

        // Concurrent queue for faster concurrent requests
        self.queue = DispatchQueue(label: "TelegramApiHttpProvider", attributes: .concurrent)
    }

    public func send<Params: Codable, Result>(method: String, request: Params, response: @escaping TelegramApiResponseCompletion<Result>) {
        queue.async {

            let body: Data
            do {
                body = try self.encoder.encode(request)
            } catch {
                let err = TelegramResponse<Result>(error: .requestFailed(error))
                response(err)
                return
            }

            guard let url = URL(string: "\(self.url)/\(method)") else {
                let err = TelegramResponse<Result>(error: .requestFailed(nil))
                response(err)
                return
            }

            var req = URLRequest(url: url)
            req.httpMethod = "POST"
            req.httpBody = body
            for (k, v) in type(of: self).headers {
                req.addValue(v, forHTTPHeaderField: k)
            }

            let task = self.session.dataTask(with: req) { data, urlResponse, error in
                guard let urlResponse = urlResponse as? HTTPURLResponse, let data = data, error == nil else {
                    let err = TelegramResponse<Result>(error: .serverError(error))
                    response(err)
                    return
                }

                let status = urlResponse.statusCode
                guard status >= 200 && status < 300 else {
                    // This is a non typical error response and should be considered a server error.
                    let err = TelegramResponse<Result>(error: .serverError(nil))
                    response(err)
                    return
                }

                do {
                    let decoded = try self.decoder.decode(TelegramApiResponse<Result>.self, from: data)
                    // We got the Result object
                    let res = TelegramResponse(response: decoded)
                    response(res)
                } catch {
                    // We don't have the response we expected...
                    let err = TelegramResponse<Result>(error: .decodingError(error))
                    response(err)
                }
            }
            task.resume()
        }
    }
}
