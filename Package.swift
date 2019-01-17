// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "VaporTelegramBot",
    products: [
        .library(
            name: "VaporTelegramBot",
            targets: ["VaporTelegramBot"]),
    ],
    dependencies: [
        // Vapor for vapor related requests
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),

        // Test dependencies
        .package(url: "https://github.com/Quick/Quick.git", from: "1.2.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "7.0.3")
    ],
    targets: [
        .target(name: "VaporTelegramBot", dependencies: ["Vapor"]),
        .testTarget(name: "VaporTelegramBotTests", dependencies: ["VaporTelegramBot", "Quick", "Nimble"])
    ]
)
