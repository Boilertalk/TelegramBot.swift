//
// Created by Koray Koska on 10/08/2017.
//

import Foundation
import JSON

/// Internal helper which converts json arrays to the specified type
extension JSONRepresentable {

    func makeArray<T: JSONInitializable>() throws -> [T]? {
        guard let elements = try makeJSON().array else {
            return nil
        }

        var selfArray = [T]()
        for e in elements {
            selfArray.append(try T.init(json: e))
        }

        return selfArray
    }
}
