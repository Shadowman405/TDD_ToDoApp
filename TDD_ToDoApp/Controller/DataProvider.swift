//
//  DataProvider.swift
//  TDD_ToDoApp
//
//  Created by Maxim Mitin on 2.01.22.
//

import Foundation
import UIKit

class DataProvider: NSObject {
    
}


extension DataProvider: UITableViewDelegate {
    
}

extension DataProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
