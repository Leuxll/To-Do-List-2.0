//
//  TableViewCell.swift
//  To Do List 2.0
//
//  Created by Yue Fung Lee on 3/1/2019.
//  Copyright © 2019 Yue Fung Lee. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBAction func checkBoxTapped(_ sender: UIButton) {
        
        
        
        if sender.isSelected {
            
            sender.isSelected = false
            
        }else{
            
            sender.isSelected = true
            
        }
        
        
    }
    
    
    
}
