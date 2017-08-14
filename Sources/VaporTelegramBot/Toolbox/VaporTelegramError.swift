//
// Created by Koray Koska on 10/08/2017.
//

import Foundation

public enum VaporTelegramError: Error {

    case requiredParameterMissing(parameter: String)
    case requiredParameterHasWrongType(parameter: String, neededType: String)
}
