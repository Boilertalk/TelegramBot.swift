import PackageDescription

let package = Package(
    name: "VaporTelegramBot",
    targets: [
        Target(name: "VaporTelegramBot")
    ],
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 2)
    ],
    exclude: []
)
