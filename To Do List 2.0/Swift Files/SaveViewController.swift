//
//  SaveViewController.swift
//  To Do List 2.0
//
//  Created by John Stringer on 9/2/2018.
//  Copyright © 2018 Yue Fung Lee. All rights reserved.
//

import UIKit
import FirebaseDatabase


class SaveViewController: UIViewController {

//Outlets
    @IBOutlet weak var itemToAdd: UITextField!
    @IBOutlet weak var addDate: UITextField!
    @IBOutlet weak var subtask1: UITextField!
    @IBOutlet weak var subtask2: UITextField!
    @IBOutlet weak var subtask3: UITextField!
    @IBAction func saveItem(_ sender: UIButton) {
        addTask()
        
    }
//Outlets
//Code
    
    var refTasks: DatabaseReference!
    
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        addDate.inputView = datePicker
        datePicker?.addTarget(self, action: #selector(SaveViewController.dateChanged(datePicker:)), for: .valueChanged)
        refTasks = Database.database().reference().child("tasks")
        

        var toolbar = UIToolbar()
        toolbar.sizeToFit()
        
       var doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(doneClicked))
        
            toolbar.setItems([doneButton], animated: false)
            
        itemToAdd.inputAccessoryView = toolbar
        addDate.inputAccessoryView = toolbar
        subtask1.inputAccessoryView = toolbar
        subtask2.inputAccessoryView = toolbar
        subtask3.inputAccessoryView = toolbar
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        addDate.text = dateFormatter.string(from: datePicker.date)
        
    }
    
    func addTask() {
        
        let key = refTasks.childByAutoId().key
        
        let task = ["id" : key,
                    "task": itemToAdd.text! as String,
                    "dueDate": addDate.text! as String,
                    "subtask1": subtask1.text! as String,
                    "subtask2": subtask2.text! as String,
                    "subtask3": subtask3.text! as String]
        
        refTasks.child(key!).setValue(task)
        
        
    }
    

    @objc func doneClicked() {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


//Code
