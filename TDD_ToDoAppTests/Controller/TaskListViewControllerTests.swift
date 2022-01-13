//
//  TaskListViewControllerTests.swift
//  TDD_ToDoAppTests
//
//  Created by Maxim Mitin on 2.01.22.
//

import XCTest
@testable import TDD_ToDoApp

class TaskListViewControllerTests: XCTestCase {
    
    var sut: TaskListViewController!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: String(describing: TaskListViewController.self))
        sut = vc as? TaskListViewController
        
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTableViewNotNillWhenLoaded() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewLoadedDataProviderIsNotNill() {
        XCTAssertNotNil(sut.dataProvider)
    }
    
    func testWhenViewIsLoadedTableViewDelegateIsSet() {
        XCTAssertTrue(sut.tableView.delegate is DataProvider)
    }

    func testWhenViewIsLoadedTableViewDataSourcesSet() {
        XCTAssertTrue(sut.tableView.dataSource is DataProvider)
    }
    
    func testWhenViewIsLoadedTableDelegateEqualsDataSource() {
        XCTAssertEqual(sut.tableView.delegate as? DataProvider, sut.tableView.dataSource as? DataProvider)
    }
    
    func testTaskListVCHasAddBarButtonWithSelfAsTarget() {
        let target = sut.navigationItem.rightBarButtonItem?.target
        XCTAssertEqual(target as? TaskListViewController, sut)
    }
    
    func testAddNewtaskPresentsNewTaskVC() {
        XCTAssertNil(sut.presentedViewController)
        
        guard let newTaskButton = sut.navigationItem.rightBarButtonItem,
              let action = newTaskButton.action else {
            XCTFail()
            return
        }
        
        UIApplication.shared.keyWindow?.rootViewController = sut
        sut.performSelector(onMainThread: action, with: newTaskButton, waitUntilDone: true)
        XCTAssertNotNil(sut.presentedViewController)
        XCTAssertTrue(sut.presentedViewController is NewTaskViewController)
        
        let newTaskVC = sut.presentedViewController as! NewTaskViewController
        XCTAssertNotNil(newTaskVC.titleTextField)
    }
    
    func testSharesSameTaskManagerWithNewTaskVC() {
        XCTAssertNil(sut.presentedViewController)
        
        guard let newTaskButton = sut.navigationItem.rightBarButtonItem,
              let action = newTaskButton.action else {
            XCTFail()
            return
        }
        
        UIApplication.shared.keyWindow?.rootViewController = sut
        sut.performSelector(onMainThread: action, with: newTaskButton, waitUntilDone: true)
        XCTAssertNotNil(sut.presentedViewController)
        XCTAssertTrue(sut.presentedViewController is NewTaskViewController)
        
        let newTaskVC = sut.presentedViewController as! NewTaskViewController
        XCTAssertNotNil(sut.dataProvider.taskManager)
        XCTAssertTrue(newTaskVC.taskManager === sut.dataProvider.taskManager)
    }
}
