//
//  TaskManager.swift
//  TDD_ToDoApp
//
//  Created by Maxim Mitin on 1.01.22.
//

import Foundation


class TaskManager {
    var tasksCount = 0
    var doneTasksCount = 0
    
    private var tasks: [Task] = []
    
    func add(task: Task) {
        tasksCount += 1
        tasks.append(task)
    }
    
    func task(at index: Int) -> Task {
        return tasks[index]
    }
}
