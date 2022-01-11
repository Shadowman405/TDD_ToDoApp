//
//  APIClientTests.swift
//  TDD_ToDoAppTests
//
//  Created by Maxim Mitin on 11.01.22.
//

import XCTest
@testable import TDD_ToDoApp


class APIClientTests: XCTestCase {
    
    var sut = APIClient()
    var mockURLSession = MockURLSession()

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testLoginUsersCorrectHost() {
        sut.urlSession = mockURLSession
        
        let completionHandler = {(token: String?,error: Error?) in}
        sut.login(withName: "name", password: "123456", completionHandler: completionHandler)
        
        guard let url = mockURLSession.url else {
            XCTFail()
            return
        }
        
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        XCTAssertEqual(urlComponents?.host, "todoapp.com")
        XCTAssertEqual(urlComponents?.path, "/login")
    }
    
    func testLoginUssersCorrectHost() {
        sut.urlSession = mockURLSession
        
        let completionHandler = {(token: String?,error: Error?) in}
        sut.login(withName: "name", password: "123456", completionHandler: completionHandler)
        
        guard let url = mockURLSession.url else {
            XCTFail()
            return
        }
        
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        XCTAssertEqual(urlComponents?.path, "/login")
    }
}


extension APIClientTests {
    class MockURLSession: URLSessionProtocol {
        var url: URL?
        func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            self.url = url
            return URLSession.shared.dataTask(with: url)
        }
    }
}
