import XCTest
import SwiftJSON

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
        
        let jsonstr = """
        {
        "result": 1.23,
        "dog": {
            "name": "dog dog",
            "aa": {
                "a": 123,
                "b": "ccc",
                "arr": [11,22,33]
            }
        }
        }
        """

        let jsonstr2 = """
        [
        1,2,3
        ]
        """



        let json = JSONObject.make(jsonstr)
        print(json)
        print(json["dog"]["aa"]["arr"][1].stringValue)
        print(json["result"].stringValue)
        let json2 = JSONObject.make(jsonstr2)
        print(json2[1].stringValue)

        var dic = [String: Any]()
        dic["aa"] = 1
        dic["bb"] = 1.235
        dic["cc"] = "ccccc"
        dic["dd"] = [1,2,3]
        dic["ee"] = ["e1":222,"e2":"eee222"]
        print(JSONObject.make(dic))


    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
