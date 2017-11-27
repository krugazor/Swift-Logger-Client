![](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat)
![macOS](https://img.shields.io/badge/os-macOS-green.svg?style=flat)
![iOS](https://img.shields.io/badge/os-iOS-green.svg?style=flat)
![Linux](https://img.shields.io/badge/os-linux-green.svg?style=flat)
![license](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat)


# Swift Logger Client

Swift Logger Class for Usage With [Swift Logger Server](https://github.com/Mladen-K/Swift-Logger-Server) Application

Simple Logger class used for sending Debug, Info, Warning and Error log messages to the logger API.


## Prerequisites

### Swift
* Open Source Swift 4.0.0 or higher

### macOS
* macOS Sierra 10.12.6 or higher
* Xcode Version 9.0 (9A325) or higher

### iOS
* iOS 10.0 or higher

### Linux
* Ubuntu 16.04 & 16.10 (only tested on 16.04)


## Getting started

```swift
import SwiftLoggerClient
```


## API

### Public variables & default values
The following public variables should be set to your desired values.
```swift
public let SWIFT_LOGGER_backEndSchema = "http"
public let SWIFT_LOGGER_backEndPort: Int16 = 80
```

### Logger class initialization
```swift
let log = Logger(applicationName: String, target: Target, onServer: String, state: State)
```

### Target enum
```swift
public enum Target {
    case file
    case terminal
}
```

### State enum
```swift
public enum State {
    case enabled
    case disabled
}
```

### Exampe usage with viable data:
```swift
let log = Logger(applicationName: "MyApplication", target: .file, onServer: "logging.craftwell.io", state: .enabled)

log.debug(message: "This is a debug message.")
log.info(message: "This is an info message.")
log.warning(message: "This is a warning message.")
log.error(message: "An error has occurred.")

// Event can also be logged without passing message parameter:
log.debug()
log.info()
log.warning()
log.error()
```

More information about server API configuration is to be found on: [Logging Events Using Swift Cloud Logger](http://craftwell.io/logging-events-using-swift-cloud-logger/)

## License
[MIT Licence](https://github.com/Mladen-K/Swift-Logger-Client/blob/master/LICENSE)
