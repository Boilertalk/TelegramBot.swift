//
//  Array+JSONArrayCreator.swift
//  VaporFacebookBot
//
//  Created by Koray Koska on 25/05/2017.
//
//

import Foundation
import JSON

extension Array where Element: JSONRepresentable {

    func jsonArray() throws -> [JSON] {
        return try map { try $0.makeJSON() }
    }
}
