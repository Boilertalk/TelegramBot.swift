//
//  TelegramMaskPosition.swift
//  TelegramBot
//
//  Created by Koray Koska on 14.01.19.
//

import Foundation

public final class TelegramMaskPosition: Codable {

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

    // MARK: - Initialization

    public init(
        point: TelegramMaskPositionPoint,
        xShift: Double,
        yShift: Double,
        scale: Double
    ) {
        self.point = point
        self.xShift = xShift
        self.yShift = yShift
        self.scale = scale
    }
}

public enum TelegramMaskPositionPoint: String, Codable {

    case forehead = "forehead"
    case eyes = "eyes"
    case mouth = "mouth"
    case chin = "chin"
}
