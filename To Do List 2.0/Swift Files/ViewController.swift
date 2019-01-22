//
//  ViewController.swift
//  To Do List 2.0
//
//  Created by Yue Fung Lee on 9/2/2018.
//  Copyright © 2018 Yue Fung Lee. All rights reserved.
//

import UIKit
import FirebaseDatabase

struct tasks {

    var task: String!
    var dueDate: String?
    var subtask1: String?
    var subtask2: String?
    var subtask3: String?
    var id: String?

}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

//Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var toDoList: UITableView!
//Outlets
//Code
    
    var task = [tasks]()
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?


    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        listtask()
        imageView.roundCorners(cornerRadius: 20)
        imageView.clipsToBounds = true
        
      toDoList.register(UINib.init(nibName: "CheckMarkCell", bundle: nil), forCellReuseIdentifier: "CheckListIdentifier")
        
    }
    
    func listtask() {
        ref = Database.database().reference()
        databaseHandle = ref?.child("tasks").queryOrdered(byChild: "tasks").observe(.childAdded, with: { snapshot in
        
            let value = snapshot.value as? NSMutableDictionary
            
            let dueDate = value?["dueDate"] as? String
            let subtask1 = value?["subtask1"] as? String
            let subtask2 = value?["subtask2"] as? String
            let subtask3 = value?["subtask3"] as? String
            let task = value?["task"] as? String
            let id = value?["id"] as? String
            
            self.task.append(tasks(task: task, dueDate: dueDate, subtask1: subtask1, subtask2: subtask2, subtask3: subtask3, id: id))
        self.toDoList.reloadData()
    })
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListIdentifier") as! CheckMarkCell
        cell.lblTitle.text = task[indexPath.row].task
        cell.dueDate.text = task[indexPath.row].dueDate
        cell.selectionStyle = .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailedViewController = storyboard.instantiateViewController(withIdentifier: "DetailedViewController") as! DetailedViewController
        
        detailedViewController.title = task[indexPath.row].task!
        detailedViewController.Date = task[indexPath.row].dueDate!
        detailedViewController.subTask1 = task[indexPath.row].subtask1!
        detailedViewController.subTask2 = task[indexPath.row].subtask2!
        detailedViewController.subTask3 = task[indexPath.row].subtask3!
        
        showDetailViewController(detailedViewController, sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let task = self.task[indexPath.row]
                let alertController = UIAlertController(title:task.task, message: "Delete this task?", preferredStyle: .alert)
        

                let deleteAction = UIAlertAction(title: "Delete", style: .destructive){(_) in
        
                    self.deleteTask(id: task.id!)
                    self.toDoList.reloadData()
                    self.task.remove(at: indexPath.row)
                    self.toDoList.deleteRows(at: [indexPath], with: .fade)
                    
                }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default){(_) in
            
            alertController.dismiss(animated: true, completion: nil)
            
        }
        

                alertController.addAction(deleteAction)
                alertController.addAction(cancelAction)
                present(alertController, animated: true, completion: nil)
        toDoList.reloadData()
    }
    
    func deleteTask(id:String) {

        Database.database().reference(withPath: "tasks").child(id).removeValue()
    }
        


}

extension UIView {
    func roundCorners(cornerRadius: Double) {
        // apply corner radius to the cards
        layer.cornerRadius = CGFloat(cornerRadius)
        clipsToBounds = true
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
}

//Code
