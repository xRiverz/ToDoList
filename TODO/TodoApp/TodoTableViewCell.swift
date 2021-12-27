//
//  TodoTableViewCell.swift
//  TodoApp
//
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var todoTitle : UILabel!
    @IBOutlet weak var todoDueDate : UILabel!
    @IBOutlet weak var todoNotes : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
