import Foundation
import XCTest


//:
//: This is the TestRunner, which runs the tests from an XCTestCase and reports on the 
//: results. This is done using the same XCTestSuite mechanism which Xcode uses to run 
//: unit tests. At the end of the run, a message is printed to the console, telling you 
//: how many tests were run, how long it took, and how many of the tests failed.
//:

public struct TestRunner {
    public init() { }
    
    public func runTests(testClass:AnyClass) {
        let tests = testClass as! XCTestCase.Type
        let testSuite = tests.defaultTestSuite()
        testSuite.run()
        _ = testSuite.testRun as! XCTestSuiteRun
    }
    
}
