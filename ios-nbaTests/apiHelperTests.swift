
import XCTest
@testable import ios_nba

class apiHelperTests: XCTestCase {
    
    func testCreatePageParameter() {
        
        var expectedPageParams: [String] = []
        var actualPageParams: [String] = []
        
        for i in 0...33 {
            expectedPageParams.append("?page=\(i)&per_page=100")
            actualPageParams.append(APIHelper.createPageParameter(pageNumber: i))
            XCTAssertTrue(expectedPageParams[i] == actualPageParams[i])
        }
        
        XCTAssertTrue(expectedPageParams.count != 0)
        XCTAssertTrue(actualPageParams.count != 0)
        XCTAssertTrue(expectedPageParams.count == actualPageParams.count)
    }
    
}
