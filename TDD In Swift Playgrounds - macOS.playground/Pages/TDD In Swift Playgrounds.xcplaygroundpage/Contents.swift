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

//: ### Failure Is Not An Option
//:
//: Call the runTests() function, passing in the test class you wish to run (in this case, 'My Tests'. If you wish to see the code for the TestRunner, it's in the Playground Sources directory

TestRunner().runTests(testClass: MyTests.self)

//: [Next](@next)
