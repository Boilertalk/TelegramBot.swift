// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "TelegramBot",
     platforms: [
         .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "TelegramBot",
            targets: ["TelegramBot"]),
        .library(
            name: "TelegramBotVapor",
            targets: ["TelegramBotVapor"]),
        .library(
            name: "TelegramBotPromiseKit",
            targets: ["TelegramBotPromiseKit"]),
    ],
    dependencies: [
        // Test dependencies
        .package(url: "https://github.com/Quick/Quick.git", from: "3.0.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "8.0.0"),

        // Vapor for vapor related requests, optional.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),

        // PromiseKit dependency, optional.
        .package(url: "https://github.com/mxcl/PromiseKit.git", from: "6.0.0"),
    ],
    targets: [
        .target(name: "TelegramBot", dependencies: []),
        .target(name: "TelegramBotVapor", dependencies: ["TelegramBot", .product(name: "Vapor", package: "vapor")]),
        .target(name: "TelegramBotPromiseKit", dependencies: ["TelegramBot", "PromiseKit"]),
        .testTarget(name: "TelegramBotTests", dependencies: ["TelegramBot", "Quick", "Nimble"])
    ]
)
