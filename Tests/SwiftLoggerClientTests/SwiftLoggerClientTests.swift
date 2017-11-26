import XCTest
@testable import SwiftLoggerClient

class SwiftLoggerClientTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftLoggerClient().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
