//
//  CheckMarkCell.swift
//  To Do List 2.0
//
//  Created by Yue Fung Lee on 3/1/2019.
//  Copyright © 2019 Yue Fung Lee. All rights reserved.
//

import UIKit

class CheckMarkCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnCheckMark: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
