//
// Created by Koray Koska on 10/08/2017.
//

import Foundation
import JSON

public protocol TelegramJSONConvertible: JSONConvertible {

    associatedtype Keys: TelegramJSONConvertibleKeys
}

public protocol TelegramJSONConvertibleKeys {}
