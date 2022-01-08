//
//  NewTaskViewControllerTests.swift
//  TDD_ToDoAppTests
//
//  Created by Maxim Mitin on 8.01.22.
//

import XCTest
@testable import TDD_ToDoApp

class NewTaskViewControllerTests: XCTestCase {
    
    var sut: NewTaskViewController!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: NewTaskViewController.self)) as? NewTaskViewController
        sut.loadViewIfNeeded()
        
    }

    override func tearDownWithError() throws {
    }
    
    func testHasTitletextField() {
        XCTAssertTrue(sut.titleTextField.isDescendant(of: sut.view))
    }
}
