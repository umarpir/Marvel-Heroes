//
//  Marvel_HeroesTests.swift
//  Marvel HeroesTests
//
//  Created by Umar Pirmahomed on 27/03/2023.
//
@testable import Marvel_Heroes
import XCTest

final class Marvel_HeroesTests: XCTestCase {
    let HeroesVC = MarvelHeroesViewModel()
    var samplehero : MarvelResult = MarvelResult(id: 10000, name: "spiderman", description: "test description", modified: "", thumbnail: Thumbnail(path: "", thumbnailExtension: .jpg), resourceURI: "", comics: nil, series: nil, stories: nil, events: nil, urls: nil)
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

    }
    
    func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    

    func testdescription() throws {
        
        
        let descriptionTest = HeroesVC.returnDescription(hero: samplehero)
        XCTAssertEqual(descriptionTest, "Description: test description")
        
    }
    
    func testMd5() throws {
        
        
        let md5test = HeroesVC.md5Generator(pubKey: "0c863702b0b77a585e4071cbc3593dea", timeStamp: 1, privKey: "ff73168904c789744eca56e7c8dbca159776416c")
        XCTAssertEqual(md5test, "86d684bb2fb91e73c81cb7fc6b69d967")
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testurlBuilder() throws {
        
        let apiUrl = HeroesVC.urlRequest(time: 1)
        XCTAssertEqual(apiUrl, URL(string: "https://gateway.marvel.com:443/v1/public/characters?limit=50&ts=1&apikey=0c863702b0b77a585e4071cbc3593dea&hash=86d684bb2fb91e73c81cb7fc6b69d967"))
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testTimestamp() throws {
        
        let timestampTest = HeroesVC.timeStamp()
        XCTAssertEqual(timestampTest, Int(Date().timeIntervalSince1970))
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
