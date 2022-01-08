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
    let date: Date?
    
    
    init(title: String, description: String? = nil, location: Location? = nil, date: Date? = nil) {
        self.title = title
        self.description = description
        self.date = date ?? Date()
        self.location = location
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
