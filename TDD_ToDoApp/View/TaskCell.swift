//
//  TaskCell.swift
//  TDD_ToDoApp
//
//  Created by Maxim Mitin on 2.01.22.
//

import UIKit

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    private var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }
    
    func configure(withTask task:Task, done: Bool = false){

        if done {
            let attributedString = NSAttributedString(string: task.title, attributes: [NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue])
            titleLabel.attributedText = attributedString
            dateLabel = nil
            locationLabel = nil
        } else {
            self.titleLabel.text = task.title
            self.locationLabel.text = task.location?.name
            let dateString = dateFormatter.string(from: task.date)
            dateLabel.text = dateString
            
        }
    }
}
