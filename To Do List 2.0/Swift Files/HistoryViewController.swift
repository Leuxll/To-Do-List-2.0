//
//  HistoryViewController.swift
//  To Do List 2.0
//
//  Created by Yue Fung Lee on 12/1/2019.
//  Copyright © 2019 Yue Fung Lee. All rights reserved.
//

import UIKit
import Firebase

class HistoryViewController: UIViewController {


    @IBOutlet weak var purpleImg: UIImageView!
    @IBOutlet weak var totalTasks: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let numberTasks = Database.database().reference().child("tasks")
        numberTasks.observe(.value) { (snapshot) in
            self.totalTasks.text = String(snapshot.childrenCount)
    
        }
        
        purpleImg.layer.cornerRadius = 20
        purpleImg.clipsToBounds = true
        
        }

        // Do any additional setup after loading the view.
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


