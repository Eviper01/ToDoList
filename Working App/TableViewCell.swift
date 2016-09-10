//
//  TableViewCell.swift
//  Working App
//
//  Created by John Wallis on 10/09/2016.
//  Copyright © 2016 John Wallis. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var todoItem: UILabel!
    @IBOutlet var dueDate: UILabel!
    @IBOutlet var todoDescription: UILabel!
    @IBOutlet var Checkbox: UILabel!

    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
