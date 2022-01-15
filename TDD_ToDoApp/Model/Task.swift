//
//  Task.swift
//  TDD_ToDoApp
//
//  Created by Maxim Mitin on 31.12.21.
//

import Foundation

struct Task {
    let title: String
    let description: String?
    let location: Location?
    let date: Date
    
    
    init(title: String, description: String? = nil, location: Location? = nil, date: Date? = nil) {
        self.title = title
        self.description = description
        self.date = date ?? Date()
        self.location = location
    }
    
}


extension Task {
    typealias PlistDictionary = [String:Any]
    init?(dict: PlistDictionary) {
        self.title = dict["title"] as! String
        self.description = dict["description"] as? String
        self.date = dict["date"] as? Date ?? Date()
        //self.location = dict["location"] as? Location
        if let locationDictionary = dict["location"] as? [String:Any] {
            self.location = Location(dict: locationDictionary)
        } else {
            self.location = nil
        }
    }
}

extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        if lhs.title == rhs.title, lhs.description == rhs.description, lhs.location == rhs.location {
            return true
        }
        return false
    }
}
