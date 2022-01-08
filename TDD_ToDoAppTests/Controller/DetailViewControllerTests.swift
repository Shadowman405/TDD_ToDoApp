//
//  DetailViewControllerTests.swift
//  TDD_ToDoAppTests
//
//  Created by Maxim Mitin on 8.01.22.
//

import XCTest
@testable import TDD_ToDoApp

class DetailViewControllerTests: XCTestCase {
    
    var sut: DetailViewController!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier:String(describing: DetailViewController.self)) as! DetailViewController
        sut.loadViewIfNeeded()
        
    }

    override func tearDownWithError() throws {
    }
    
    func testDetailViewControllerHasTitleLabel() {
        
        XCTAssertNotNil(sut.titleLabel)
        XCTAssertTrue(sut.titleLabel.isDescendant(of: sut.view))
    }
    
    func testDetailViewControllerHasDescriptionLabel() {
        
        XCTAssertNotNil(sut.descriptionLabel)
        XCTAssertTrue(sut.descriptionLabel.isDescendant(of: sut.view))
    }
    
    func testDetailViewControllerHasDateLabel() {
        
        XCTAssertNotNil(sut.dateLabel)
        XCTAssertTrue(sut.dateLabel.isDescendant(of: sut.view))
    }
    
    func testHasMapView() {
        XCTAssertNotNil(sut.mapView)
        XCTAssertTrue(sut.mapView.isDescendant(of: sut.view))
    }
}
