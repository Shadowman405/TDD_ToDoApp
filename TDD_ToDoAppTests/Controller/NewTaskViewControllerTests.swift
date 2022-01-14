//
//  NewTaskViewControllerTests.swift
//  TDD_ToDoAppTests
//
//  Created by Maxim Mitin on 8.01.22.
//

import XCTest
@testable import TDD_ToDoApp
import MapKit

class NewTaskViewControllerTests: XCTestCase {
    
    var sut: NewTaskViewController!
    var placemark: MockCLPlacemark!

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
    
    func testHasLocationtextField() {
        XCTAssertTrue(sut.locationTextField.isDescendant(of: sut.view))
    }
    
    func testHasDatetextField() {
        XCTAssertTrue(sut.dateTextField.isDescendant(of: sut.view))
    }
    
    func testHasAddresstextField() {
        XCTAssertTrue(sut.addresstextField.isDescendant(of: sut.view))
    }
    
    func testHasDescriptionTextField() {
        XCTAssertTrue(sut.descriptionTextField.isDescendant(of: sut.view))
    }
    
    func testHasCancelButton() {
        XCTAssertTrue(sut.cancelButton.isDescendant(of: sut.view))
    }
    
    func testHasSaveButton() {
        XCTAssertTrue(sut.saveButton.isDescendant(of: sut.view))
    }
    
    func testSaveUsesGeocoderToConvertCoordinateFromAddress() {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        let date = df.date(from: "01.01.21")
        
        sut.titleTextField.text = "Foo"
        sut.locationTextField.text = "Bar"
        sut.dateTextField.text = "01.01.21"
        sut.addresstextField.text = "Minsk"
        sut.descriptionTextField.text = "Baz"
        
        sut.taskManager = TaskManager()
        let mockGeocoder = MockCLGEocoder()
        sut.geocoder = mockGeocoder
        sut.save()
        
        let coordinate = CLLocationCoordinate2D(latitude: 53.896196, longitude: 27.5503093)
        let location = Location(name: "Bar", coordinate: coordinate)
        let generatedTask = Task(title: "Foo", description: "Baz", location: location, date: date)
        
        placemark = MockCLPlacemark()
        placemark.mockCoordinate = coordinate
        mockGeocoder.completionHandler?([placemark], nil)
        
        let task = sut.taskManager.task(at: 0)
        
        XCTAssertEqual(task, generatedTask)
    }
    
    func testSaveButtonHasSaveMethod() {
        let saveButton = sut.saveButton
        
        guard let actions = saveButton?.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(actions.contains("save"))
    }
    
    func testGeocoderFetchesCoordinate() {
        let geocoderAnswer = expectation(description: "Geocoder answer")
        let adressString = "Minsk"
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(adressString) { (placemarks,error) in
            let placemark = placemarks?.first
            let location = placemark?.location
            
            guard let latitude = location?.coordinate.latitude,let longitude = location?.coordinate.longitude else {
                XCTFail()
                return
            }
            
            XCTAssertEqual(latitude, 53.896196)
            XCTAssertEqual(longitude, 27.5503093)
            geocoderAnswer.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testSaveButtonDismissedNewTaskVC() {
        let mockNewTaskVC = MockNewTaskViewController()
        mockNewTaskVC.titleTextField = UITextField()
        mockNewTaskVC.titleTextField.text = "Foo"
        mockNewTaskVC.descriptionTextField = UITextField()
        mockNewTaskVC.descriptionTextField.text = "Bar"
        mockNewTaskVC.locationTextField = UITextField()
        mockNewTaskVC.locationTextField.text = "Baz"
        mockNewTaskVC.addresstextField = UITextField()
        mockNewTaskVC.addresstextField.text = "Minsk"
        mockNewTaskVC.dateTextField = UITextField()
        mockNewTaskVC.dateTextField.text = "01.01.2022"
        
        mockNewTaskVC.save()
        
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.05) {
            XCTAssertTrue(mockNewTaskVC.isDismissed)
        }
    }    
}


extension NewTaskViewControllerTests {
    class MockCLGEocoder: CLGeocoder {
        var completionHandler: CLGeocodeCompletionHandler?
        
        override func geocodeAddressString(_ addressString: String, completionHandler: @escaping CLGeocodeCompletionHandler) {
            self.completionHandler = completionHandler
        }
    }
    
    class MockCLPlacemark: CLPlacemark {
        
        var mockCoordinate: CLLocationCoordinate2D!
        
        override var location: CLLocation? {
            return CLLocation(latitude: mockCoordinate.latitude, longitude: mockCoordinate.longitude)
        }
    }
}

extension NewTaskViewControllerTests {
    
    class MockNewTaskViewController: NewTaskViewController {
        var isDismissed = false
        
        override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
            isDismissed = true
        }
    }
}
