//
//  ViewController.swift
//  TDD_ToDoApp
//
//  Created by Maxim Mitin on 31.12.21.
//

import UIKit

class TaskListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var dataProvider: DataProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

