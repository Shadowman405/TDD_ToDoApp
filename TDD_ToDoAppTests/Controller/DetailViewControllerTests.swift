//
//  DetailViewControllerTests.swift
//  TDD_ToDoAppTests
//
//  Created by Maxim Mitin on 8.01.22.
//

import XCTest
import MapKit
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
    
    func testDetailViewControllerHasLocationLabel() {
        XCTAssertNotNil(sut.locationLabel)
        XCTAssertTrue(sut.locationLabel.isDescendant(of: sut.view))
    }
    
    func testHasMapView() {
        XCTAssertNotNil(sut.mapView)
        XCTAssertTrue(sut.mapView.isDescendant(of: sut.view))
    }
    
    func setupTaskAndAppereance() {
        let coordinate = CLLocationCoordinate2D(latitude: 53.9024716, longitude: 27.5618225)
        let location = Location(name: "Baz", coordinate: coordinate)
        let date = Date(timeIntervalSince1970: 1641670602)
        let task = Task(title: "Foo", description: "Bar",location: location, date: date)
        sut.task = task
        
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
    }
    
    func testSettingTaskSetsTitleLabel() {
        setupTaskAndAppereance()
        
        XCTAssertEqual(sut.titleLabel.text, "Foo")
    }
    
    func testSettingTaskSetsDescriptionLabel() {
        setupTaskAndAppereance()
        
        XCTAssertEqual(sut.descriptionLabel.text, "Bar")
    }
    
    func testSettingTaskSetsLocationLabel() {
        setupTaskAndAppereance()
        
        XCTAssertEqual(sut.locationLabel.text, "Baz")
    }
}
