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
    
    func userLogin() {
        sut.urlSession = mockURLSession
        let completionHandler = {(token: String?,error: Error?) in}
        sut.login(withName: "name", password: "%qwerty", completionHandler: completionHandler)
    }
    
    func testLoginUsersCorrectHost() {
        userLogin()
        
        XCTAssertEqual(mockURLSession.urlComponents?.host, "todoapp.com")
    }
    
    func testLoginUssersCorrectHost() {
        userLogin()
        
        XCTAssertEqual(mockURLSession.urlComponents?.path, "/login")
    }
    
    func testLoginUsesExpectedQueryParameters() {
        userLogin()
        
        guard let queryItmes = mockURLSession.urlComponents?.queryItems else {
            XCTFail()
            return
        }
        let urlQuetyItemName = URLQueryItem(name: "name", value: "name")
        let urlQuetyItemPassword = URLQueryItem(name: "password", value: "%qwerty")
        
        XCTAssertTrue(queryItmes.contains(urlQuetyItemName))
        XCTAssertTrue(queryItmes.contains(urlQuetyItemPassword))
    }
    
    
    
}


extension APIClientTests {
    class MockURLSession: URLSessionProtocol {
        var url: URL?
        
        var urlComponents: URLComponents? {
            guard let url = url else {
                return nil
            }
            return URLComponents(url: url, resolvingAgainstBaseURL: true)
        }
        
        func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            self.url = url
            return URLSession.shared.dataTask(with: url)
        }
    }
}
