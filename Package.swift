// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "TelegramBot",
    products: [
        .library(
            name: "TelegramBot",
            targets: ["TelegramBot"]),
        .library(
            name: "TelegramBotVapor",
            targets: ["TelegramBotVapor"]),
    ],
    dependencies: [
        // Test dependencies
        .package(url: "https://github.com/Quick/Quick.git", from: "1.2.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "7.0.3"),

        // Vapor for vapor related requests, optional.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
    ],
    targets: [
        .target(name: "TelegramBot", dependencies: []),
        .target(name: "TelegramBotVapor", dependencies: ["TelegramBot", "Vapor"]),
        .testTarget(name: "TelegramBotTests", dependencies: ["TelegramBot", "Quick", "Nimble"])
    ]
)
