import PackageDescription

let package = Package(
    name: "VaporTelegramBot",
    targets: [
        Target(name: "VaporTelegramBot")
    ],
    dependencies: [
        .Package(url: "https://github.com/vapor/engine.git", majorVersion: 2),
        .Package(url: "https://github.com/vapor/json.git", majorVersion: 2)
    ],
    exclude: []
)
