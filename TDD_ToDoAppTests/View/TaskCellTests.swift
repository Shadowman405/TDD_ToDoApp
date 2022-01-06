//
//  TaskCellTests.swift
//  TDD_ToDoAppTests
//
//  Created by Maxim Mitin on 6.01.22.
//

import XCTest
@testable import TDD_ToDoApp

class TaskCellTests: XCTestCase {
    
    var cell : TaskCell!

    override func setUpWithError() throws {
        let stroryboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = stroryboard.instantiateViewController(identifier: String(describing:TaskListViewController.self)) as! TaskListViewController
        controller.loadViewIfNeeded()
        
        let tableView = controller.tableView
        let dataSource = FakeDataSource()
        tableView?.dataSource = dataSource
        
        cell = tableView?.dequeueReusableCell(withIdentifier: String(describing: TaskCell.self), for: IndexPath(row: 0, section: 0)) as? TaskCell
    }

    override func tearDownWithError() throws {
    }
    
    func testCellHasTitleLabel() {
        XCTAssertNotNil(cell.titleLabel)
    }
    
    func testCellHasTitlelabelInContentView() {
        XCTAssertTrue(cell.titleLabel.isDescendant(of: cell.contentView))
    }
}


extension TaskCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
