//
//  TDD_ToDoAppTests.swift
//  TDD_ToDoAppTests
//
//  Created by Maxim Mitin on 31.12.21.
//

import XCTest
@testable import TDD_ToDoApp

class TDD_ToDoAppTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testInitialVCIsTaskListVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let rootViewController = navigationController.viewControllers.first as! TaskListViewController
        
        XCTAssertTrue(rootViewController is TaskListViewController)
    }

}
