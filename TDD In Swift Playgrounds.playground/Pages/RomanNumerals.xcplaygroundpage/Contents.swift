//: [Previous](@previous)

//: ## Roman Numerals Kata
//: Kata Description from [Agile Katas](http://agilekatas.co.uk/katas/RomanNumerals-Kata)
//:
//: The Romans wrote their numbers using letters; specifically the letters 'I' meaning '1', 'V' meaning '5', 'X' meaning '10', 'L' meaning '50', 'C' meaning '100', 'D' meaning '500', and 'M' meaning '1000'. There were certain rules that the numerals followed which should be observed.
//:
//: The symbols 'I', 'X', 'C', and 'M' can be repeated at most 3 times in a row. The symbols 'V', 'L', and 'D' can never be repeated. The '1' symbols ('I', 'X', and 'C') can only be subtracted from the 2 next highest values ('IV' and 'IX', 'XL' and 'XC', 'CD' and 'CM'). Only one subtraction can be made per numeral ('XC' is allowed, 'XXC' is not). The '5' symbols ('V', 'L', and 'D') can never be subtracted.
//:
//: ### Examples
//:
//: A correct implementation should produce the following roman numerals output for the given arabic inputs:
//:
//: * 1 = I
//: * 5 = V
//: * 9 = IX
//: * 10 = X
//: * 50 = L
//: * 90 = XC
//: * 100 = C
//: * 500 = D
//: * 1000 = M
//: * 2499 = MMCDXCIX
//: * 3949 = MMMCMXLIX

import XCTest

//: ### Implementation
//: Write your implementation of the roman numeral converter below. You can use classes, structs, enums or any other types.


//: ### Tests
//: Fill in the unit test class to verfiy the functionality of your implementation:

class RomanNumeralConverterTests: XCTestCase {
    override func setUp() {
    }
    
    override func tearDown() {
    }
    
}


class PlaygroundTestObserver : NSObject, XCTestObservation {
    @objc func testCase(_ testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: UInt) {
        print("Test failed on line \(lineNumber): \(testCase.name), \(description)")
    }
}

let observer = PlaygroundTestObserver()
let center = XCTestObservationCenter.shared()
center.addTestObserver(observer)



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

TestRunner().runTests(testClass: RomanNumeralConverterTests.self)

//: [Next](@next)
