//: ## TDD In Swift Playgrounds
//:
//: Wouldn’t it be really cool if somehow you could write your code in a Playground alongside the unit tests which validate the code. That way, once you’ve finished your class you could move the code and the tests back into your app, and get the best of both worlds!

//: First: make sure you import XCTest:
import XCTest

//: The actual unit tests look an awful lot like, well, unit tests. For instance, a standard XCTestCase subclass which contains a failing test:

class MyTests : XCTestCase {
    func testShouldFail() {
        XCTFail("You must fail to succeed!")
    }
    func testShouldPass() {
        XCTAssertEqual(2+2, 4)
    }
}

//: ### Observe & Report
//:
//: In order to report filing tests, we also need to add a test observer, conforming to XCTestObservation, which will be notified whenever a test fails and print the failure to the console. The observer is then added to the XCTestObservationCenter to allow the system to notify the observer of test failures:

class PlaygroundTestObserver : NSObject, XCTestObservation {
    @objc func testCase(_ testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: UInt) {
        print("Test failed on line \(lineNumber): \(testCase.name), \(description)")
    }
}

let observer = PlaygroundTestObserver()
let center = XCTestObservationCenter.shared()
center.addTestObserver(observer)


//: ### The Running Man
//:
//: After this is the TestRunner, which runs the tests from an XCTestCase and reports on the results. This is done using the same XCTestSuite mechanism which Xcode uses to run unit tests. At the end of the run, a message is printed to the console, telling you how many tests were run, how long it took, and how many of the tests failed.

struct TestRunner {
    
    func runTests(testClass:AnyClass) {
        print("Running test suite \(testClass)")
        let tests = testClass as! XCTestCase.Type
        let testSuite = tests.defaultTestSuite()
        testSuite.run()
        let run = testSuite.testRun as! XCTestSuiteRun
        
        print("Ran \(run.executionCount) tests in \(run.testDuration)s with \(run.totalFailureCount) failures")
    }
    
}

//: ### Failure Is Not An Option
//:
//: Lastly, call the runTests() function, passing in the test class you wish to run (in this case, 'My Tests'

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
