<a href="https://github.com/Boilertalk/VaporFacebookBot">
  <img src="https://storage.googleapis.com/boilertalk/logo.svg" width="100%" height="256">
</a>

<p align="center">
  <a href="https://travis-ci.org/Boilertalk/VaporFacebookBot">
    <img src="https://travis-ci.org/Boilertalk/VaporTelegramBot.svg?branch=master" alt="Build Status">
  </a>
  <a href="https://github.com/Boilertalk/VaporFacebookBot/blob/master/LICENSE">
    <img src="https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat" alt="license">
  </a>
  <a href="https://swift.org">
    <img src="https://img.shields.io/badge/swift-3.1-brightgreen.svg?style=flat" alt="swift">
  </a>
  <a href="https://github.com/vapor/vapor">
    <img src="https://img.shields.io/badge/vapor-2.0-blue.svg?style=flat" alt="vapor">
  </a>
</p>

# :alembic: VaporTelegramBot

This library provides helpers for [Vapor 2](https://github.com/vapor/vapor) to interact with the [Telegram bot api](https://core.telegram.org/bots/api). It simplifies the requests to the Telegram API as well as parses incoming [updates](https://core.telegram.org/bots/api#getting-updates) for you.

## :sparkles: Supported features

The following is a list with all features of the facebook Send API and webhooks as of May 2017 together with a note whether it is supported or not. If you find something that's not listed there please open an [issue](https://github.com/Boilertalk/VaporFacebookBot/issues).

### Webhooks

> TODO: Add supported Webhook / Update features

### Requests

> TODO: Add supported request features

## :package: Installation

This Swift package is intended to be used together with Vapor 2.0.    
Add the following line to your dependencies in the `Package.swift` file:

```Swift
.Package(url: "https://github.com/Boilertalk/VaporTelegramBot.git", majorVersion: 0)
```

Your `Package.swift` file should now look a little bit like the following:

```Swift
import PackageDescription

let package = Package(
    name: "MyAwesomeBot",
    targets: [
        Target(name: "App"),
        Target(name: "Run", dependencies: ["App"]),
    ],
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 2),
        .Package(url: "https://github.com/vapor/fluent-provider.git", majorVersion: 1),
        .Package(url: "https://github.com/Boilertalk/VaporTelegramBot.git", majorVersion: 0)
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
    ]
)
```

## :book: Documentation

### Webhooks

> TODO: Add documentation for Webhooks / Updates

### Requests

> TODO: Add documentation for requests...

## :rocket: Contributing

> TODO: Add information for contributors...
