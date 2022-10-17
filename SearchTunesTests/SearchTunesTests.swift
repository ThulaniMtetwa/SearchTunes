//
//  SearchTunesTests.swift
//  SearchTunesTests
//
//  Created by Thulani Mtetwa on 2022/10/16.
//

import XCTest
@testable import SearchTunes

class SearchTunesTests: XCTestCase {

    let httpClient = MockHTTPClientImplementation()
    var sut: MusicService!
    struct DummyError: Error {}
    
    override func setUpWithError() throws {
        sut = MusicService(httpClient: httpClient)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testSearchForTerm() {
        sut.search("A") { _ in }
        
        XCTAssertTrue(httpClient.executeCalled)
        XCTAssertEqual(httpClient.inputRequest, .search(term: "A"))
    }
    
    func testSearchWithSuccessResponse() throws {
        let expectedTracks = [Track(trackName: "A", artistName: "B")]
        let response = try JSONEncoder().encode(SearchMediaResponse(results: expectedTracks))

        httpClient.result = .success(response)

        sut = MusicService(httpClient: httpClient)

        var result: Result<[Track], Error>?

        sut.search("A") { result = $0 }

        XCTAssertEqual(result?.value, expectedTracks)
    }
    
    func testSearchWithFailureResponse() throws {
        httpClient.result = .failure(DummyError())

        let sut = MusicService(httpClient: httpClient)

        var result: Result<[Track], Error>?

        sut.search("A") { result = $0 }

        XCTAssertTrue(result?.error is DummyError)
    }
    
    func testSearchBefore() {
        
        sut.search("A") { _ in }
        
        XCTAssertEqual(URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=A")!, URLRequest.search(term: "A").url)
    }

    func testSearchAfterWithSuccess() throws {
        let expectedTracks = [Track(trackName: "A", artistName: "B")]
        let response = try JSONEncoder().encode(SearchMediaResponse(results: expectedTracks))
        
        let expectedResult: Result<Data, Error> = .success(response)
        
        let result = sut.parse(expectedResult)
        
        XCTAssertEqual(result.value, expectedTracks)
    }
    
    func testSearchAfterWithFailure() {
        let expectedResult: Result<Data, Error> = .failure(DummyError())
        
        let result = sut.parse(expectedResult)
        
        XCTAssertTrue(result.error is DummyError)
    }

}
