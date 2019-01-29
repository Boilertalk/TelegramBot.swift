// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "TelegramBot",
    products: [
        .library(
            name: "TelegramBot",
            targets: ["TelegramBot"]),
    ],
    dependencies: [
        // Test dependencies
        .package(url: "https://github.com/Quick/Quick.git", from: "1.2.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "7.0.3")
    ],
    targets: [
        .target(name: "TelegramBot", dependencies: []),
        .testTarget(name: "TelegramBotTests", dependencies: ["TelegramBot", "Quick", "Nimble"])
    ]
)
