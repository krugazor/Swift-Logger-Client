//
//  SwiftLoggerClient.swift
//  Swift Logger Client Class
//
//  Created by Mladen Kobiljski · https://www.linkedin.com/in/mladen-kobiljski/
//  Copyright © 2017 Craftwell · http://www.craftwell.io
//  MIT License · http://choosealicense.com/licenses/mit/
//


import Foundation
import KituraNet
import SwiftyJSON



//
// http post function that sends the log message to a listening server
//

// public variables
public let SWIFT_LOGGER_backEndSchema = "http"
public let SWIFT_LOGGER_backEndPort: Int16 = 80


public func sendLog(target: String, appName: String, messageType: String, source: String, line: Int, function: String,  message: String?, server: String) {

    let data: [String: Any] = [
        "appName": appName,
        "logType": messageType,
        "logTarget": target,
        "sourceFile": source,
        "lineNumber": line,
        "function": function,
        "logText": message ?? ""
    ]

    // default backend parameters dependant of Swift Logger Server deployment and configuration
    let backEndHost = server
    let method = "POST"
    let path = "/logger"

    var requestOptions: [ClientRequest.Options] = []
        requestOptions.append(.schema("\(SWIFT_LOGGER_backEndSchema)://"))
        requestOptions.append(.hostname(backEndHost))
        requestOptions.append(.port(SWIFT_LOGGER_backEndPort))
        requestOptions.append(.method(method))
        requestOptions.append(.path(path))

    let headers = ["Content-Type": "application/json"]
    requestOptions.append(.headers(headers))

    let req = HTTP.request(requestOptions) { response in
        if let response = response {
            guard response.statusCode == .OK else { return }
            print(response)
        }
    }

    let dataAsString = JSON(data).rawString() ?? ""
    req.end(dataAsString)       // req.end initiates request and passes data as body of request

}

//
// define Logger class
//
public class Logger {

    // State enum is used to enable/disable logger output
    public enum State {
        case enabled
        case disabled
    }

    // Target enum defines weather logger output will be directed to file
    // or terminal only. *in case of file, terminal output won't be disabled
    public enum Target {
        case file
        case terminal
    }

    // define instance variables
    private var applicationName: String
    private var state: String
    private var target: String
    private var server: String


    public init(applicationName: String, target: Target, onServer: String, state: State) {
        self.applicationName = applicationName
        self.server = onServer

        switch target {
        case .file:
            self.target = "file"
        case .terminal:
            self.target = "terminal"
        }

        switch state {
        case .enabled:
            self.state = "enabled"
        case .disabled:
            self.state = "disabled"
        }
    }


    //
    // class methods for different types of log messages
    //
    public func debug(source: String = #file, line: Int = #line, function: String = #function, message: String? = nil) {
        if state == "enabled" {
            sendLog(target: target, appName: self.applicationName, messageType: "DEBUG", source: source, line: line, function: function, message: message, server: self.server)
        }
    }

    public func info(source: String = #file, line: Int = #line, function: String = #function, message: String? = nil) {
        if state == "enabled" {
            sendLog(target: target, appName: self.applicationName, messageType: "INFO", source: source, line: line, function: function, message: message, server: self.server)
        }
    }

    public func warning(source: String = #file, line: Int = #line, function: String = #function, message: String? = nil) {
        if state == "enabled" {
            sendLog(target: target, appName: self.applicationName, messageType: "WARNING", source: source, line: line, function: function, message: message, server: self.server)
        }
    }

    public func error(source: String = #file, line: Int = #line, function: String = #function, message: String? = nil) {
        if state == "enabled" {
            sendLog(target: target, appName: self.applicationName, messageType: "ERROR", source: source, line: line, function: function, message: message, server: self.server)
        }
    }
}
