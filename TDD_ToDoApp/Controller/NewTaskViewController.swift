//
//  NewTaskViewController.swift
//  TDD_ToDoApp
//
//  Created by Maxim Mitin on 8.01.22.
//

import UIKit
import CoreLocation

class NewTaskViewController: UIViewController {
    
    var taskManager: TaskManager!
    var geocoder = CLGeocoder()
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var addresstextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var dateFormater: DateFormatter{
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }
    
    func save() {
        let titleString = titleTextField.text
        let locationString = locationTextField.text
        let date = dateFormater.date(from: dateTextField.text!)
        let descriptionString = descriptionTextField.text
        let addressString = addresstextField.text
        geocoder.geocodeAddressString(addressString!) {[unowned self] (placemarks,error) in
            let placemark = placemarks?.first
            let coordinate = placemark?.location?.coordinate
            let location = Location(name: locationString!, coordinate: coordinate)
            let task = Task(title: titleString!, description: descriptionString, location: location, date: date)
            self.taskManager.add(task: task)
        }
    }
}
