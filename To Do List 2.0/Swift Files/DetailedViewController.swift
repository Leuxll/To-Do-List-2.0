//
//  DetailedViewController.swift
//  To Do List 2.0
//
//  Created by Yue Fung Lee on 7/1/2019.
//  Copyright © 2019 Yue Fung Lee. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var subtask1Img: UIImageView!
    @IBOutlet weak var subtask2Img: UIImageView!
    @IBOutlet weak var subtask3Img: UIImageView!
    @IBOutlet weak var subtask1: UILabel!
    @IBOutlet weak var subtask2: UILabel!
    @IBOutlet weak var subtask3: UILabel!
    @IBAction func backButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    var Date = ""
    var subTask1 = ""
    var subTask2 = ""
    var subTask3 = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        subtask1.text! = subTask1
        subtask2.text! = subTask2
        subtask3.text! = subTask3
        subtask1Img.layer.cornerRadius = 15
        subtask1Img.clipsToBounds = true
        subtask2Img.layer.cornerRadius = 15
        subtask2Img.clipsToBounds = true
        subtask3Img.layer.cornerRadius = 15
        subtask3Img.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
