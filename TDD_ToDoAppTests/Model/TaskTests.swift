//
//  TaskTests.swift
//  TDD_ToDoAppTests
//
//  Created by Maxim Mitin on 31.12.21.
//

import XCTest
@testable import TDD_ToDoApp

class TaskTests: XCTestCase {
    
    func testInitTaskWithTitle() {
        let task = Task(title: "Foo")
        
        XCTAssertNotNil(task)
    }
    
    func testInitTaskWithTitleAndDesc() {
        let task = Task(title: "Foo", description: "Bar")
        
        XCTAssertNotNil(task)
    }
    
    func testWhenGivenTitleSetsTitle() {
        let task = Task(title: "Foo")
        
        XCTAssertEqual(task.title, "Foo")
    }
    
    func testWhenGivenDescSetsDesc() {
        let task = Task(title: "Foo", description: "Bar")
        
        XCTAssertEqual(task.description, "Bar")
    }
    
    func testTasksInitsWithDate() {
        let task = Task(title: "Foo", description: "Bar")
        
        XCTAssertNotNil(task.date)
    }
    
    func testWhenGivenLocationSetsLocation() {
        let location = Location(name: "Foo")
        
        let task = Task(title: "Bar", description: "Baz", location: location)
        
        XCTAssertEqual(location, task.location)
    }
    
    func testCanBeCreatedFromPlistDictionary() {
        let date = Date(timeIntervalSince1970: 10)
        let location = Location(name: "Baz")
        let task = Task(title: "Foo", description: "Bar", location: location, date: date)
        
        let locationDictionary: [String:Any] = ["name":"Baz"]
        let dictionary: [String : Any] = [
            "title":"Foo",
            "description":"Bar",
            "date":date,
            "location": locationDictionary
        ]
        
        let createdTask = Task(dict: dictionary)
        
        XCTAssertEqual(task, createdTask)
    }
    
    func testCanBeSerializedIntoDictionary() {
        let date = Date(timeIntervalSince1970: 10)
        let location = Location(name: "Baz")
        let task = Task(title: "Foo", description: "Bar", location: location, date: date)
        
        let generatedTask = Task(dict: task.dict)
        
        XCTAssertEqual(task, generatedTask)
    }
    
}
