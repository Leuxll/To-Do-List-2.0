//
//  SaveViewController.swift
//  To Do List 2.0
//
//  Created by John Stringer on 9/2/2018.
//  Copyright © 2018 Yue Fung Lee. All rights reserved.
//

import UIKit

class SaveViewController: UIViewController {

//Outlets
    @IBOutlet weak var itemToAdd: UITextField!
    @IBOutlet weak var addDate: UITextField!
    @IBAction func saveItem(_ sender: UIButton) {
        
        Global.toDoListArray.append(itemToAdd.text!)
        
        Global.date.append(addDate.text!)
        
    }
//Outlets
//Code
    
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(SaveViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        addDate.inputView = datePicker

        var toolbar = UIToolbar()
        toolbar.sizeToFit()
        
       var doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(doneClicked))
        
            toolbar.setItems([doneButton], animated: false)
            
        itemToAdd.inputAccessoryView = toolbar
        addDate.inputAccessoryView = toolbar
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        addDate.text = dateFormatter.string(from: datePicker.date)
        
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
