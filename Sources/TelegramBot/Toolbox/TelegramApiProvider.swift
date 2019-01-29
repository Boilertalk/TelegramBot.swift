//
//  TelegramApiProvider.swift
//  TelegramBot
//
//  Created by Koray Koska on 29.01.19.
//

import Foundation

public protocol TelegramApiProvider {

    typealias TelegramApiResponseCompletion<Result: Codable> = (_ resp: TelegramResponse<Result>) -> Void

    func send<Params: Codable, Result: Codable>(method: String, request: Params, response: @escaping TelegramApiResponseCompletion<Result>)
}

public struct TelegramResponse<Result: Codable> {

    public enum Error: Swift.Error {
        case emptyResponse
        case requestFailed(Swift.Error?)
        case connectionFailed(Swift.Error?)
        case serverError(Swift.Error?)
        case decodingError(Swift.Error?)
    }

    public enum Status<Result> {
        case success(Result)
        case failure(Swift.Error)
    }

    public let status: Status<Result>

    public var result: Result? {
        return status.result
    }

    public var error: Swift.Error? {
        return status.error
    }

    // MARK: - Initialization

    public init(status: Status<Result>) {
        self.status = status
    }

    /// Initialize with any Error object
    public init(error: Swift.Error) {
        self.status = .failure(error)
    }

    /// Initialize with a response
    public init(response: TelegramApiResponse<Result>) {
        if let result = response.result {
            self.status = .success(result)
        } else if let error = response.error {
            self.status = .failure(error)
        } else {
            self.status = .failure(Error.emptyResponse)
        }
    }

    /// For convenience, initialize with one of the common errors
    public init(error: Error) {
        self.status = .failure(error)
    }
}

/// Convenience properties
extension TelegramResponse.Status {
    public var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }

    public var isFailure: Bool {
        return !isSuccess
    }

    public var result: Result? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }

    public var error: Error? {
        switch self {
        case .failure(let error):
            return error
        case .success:
            return nil
        }
    }
}

extension TelegramResponse.Status: CustomStringConvertible {
    public var description: String {
        switch self {
        case .success:
            return "SUCCESS"
        case .failure:
            return "FAILURE"
        }
    }
}

extension TelegramResponse.Status: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .success(let value):
            return "SUCCESS: \(value)"
        case .failure(let error):
            return "FAILURE: \(error)"
        }
    }
}
