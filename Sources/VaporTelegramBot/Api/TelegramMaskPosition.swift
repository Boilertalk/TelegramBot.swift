//
// Created by Koray Koska on 14/08/2017.
//

import Foundation
import JSON

public final class TelegramMaskPosition: TelegramJSONConvertible {

    // MARK: - Keys

    public struct Keys: TelegramJSONConvertibleKeys {

        public static let pointKey = "point"
        public static let xShiftKey = "x_shift"
        public static let yShiftKey = "y_shift"
        public static let scaleKey = "scale"
    }

    // MARK: - Primitive types

    /// The part of the face relative to which the mask should be placed.
    /// One of “forehead”, “eyes”, “mouth”, or “chin”.
    public var point: TelegramMaskPositionPoint

    /// Shift by X-axis measured in widths of the mask scaled to the face size, from left to right.
    /// For example, choosing -1.0 will place mask just to the left of the default mask position.
    public var xShift: Double

    /// Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom.
    /// For example, 1.0 will place the mask just below the default mask position.
    public var yShift: Double

    /// Mask scaling coefficient. For example, 2.0 means double size.
    public var scale: Double

    public init(json: JSON) throws {
        if let point = TelegramMaskPositionPoint(rawValue: try json.get(Keys.pointKey)) {
            self.point = point
        } else {
            throw VaporTelegramError.requiredParameterMissing(parameter: Keys.pointKey)
        }

        self.xShift = try json.get(Keys.xShiftKey)
        self.yShift = try json.get(Keys.yShiftKey)
        self.scale = try json.get(Keys.scaleKey)
    }

    public func makeJSON() throws -> JSON {
        var json = JSON()

        try json.set(Keys.pointKey, point.rawValue)
        try json.set(Keys.xShiftKey, xShift)
        try json.set(Keys.yShiftKey, yShift)
        try json.set(Keys.scaleKey, scale)

        return json
    }
}

public enum TelegramMaskPositionPoint: String {

    case forehead = "forehead"
    case eyes = "eyes"
    case mouth = "mouth"
    case chin = "chin"
}
