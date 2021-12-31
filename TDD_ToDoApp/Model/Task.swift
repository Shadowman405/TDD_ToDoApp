//
//  Task.swift
//  TDD_ToDoApp
//
//  Created by Maxim Mitin on 31.12.21.
//

import Foundation

struct Task {
    var title: String
    var description: String?
    private(set) var date: Date?
    
    init(title: String, description: String? = nil) {
        self.title = title
        self.description = description
        self.date = Date()
    }
}
