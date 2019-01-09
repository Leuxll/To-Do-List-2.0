//
//  ViewController.swift
//  To Do List 2.0
//
//  Created by Yue Fung Lee on 9/2/2018.
//  Copyright © 2018 Yue Fung Lee. All rights reserved.
//

import UIKit

struct tasks {

    var task: String!
    var dueDate: String?
    var subtask1: String?
    var subtask2: String?
    var subtask3: String?

    init(task: String, dueDate: String, subtask1: String, subtask2: String, subtask3: String)
    {
        self.task = task
        self.dueDate = dueDate
        self.subtask1 = subtask1
        self.subtask2 = subtask2
        self.subtask3 = subtask3
    }

}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

//Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var toDoList: UITableView!
//Outlets
//Code
    
    var task = [tasks]()
    static var toDoListArray : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        
      toDoList.register(UINib.init(nibName: "CheckMarkCell", bundle: nil), forCellReuseIdentifier: "CheckListIdentifier")
        
    }
    
    func listtask() {
        
        
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListIdentifier") as! CheckMarkCell
        cell.lblTitle.text = Global.toDoListArray[indexPath.row]
        cell.selectionStyle = .none
        cell.btnCheckMark.addTarget(self, action: #selector(checkMarkButtonClicked(sender:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailedViewController = storyboard.instantiateViewController(withIdentifier: "DetailedViewController") as! DetailedViewController
        
        detailedViewController.Date = Global.date[indexPath.row]
        detailedViewController.subTask1 = Global.subTasks1[indexPath.row]
        detailedViewController.subTask2 = Global.subTasks2[indexPath.row]
        detailedViewController.subTask3 = Global.subTasks3[indexPath.row]
        
        
        show(detailedViewController, sender: self)
    }
    
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let button = UIButton(type: .system)
//        button.setTitle("Close", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.backgroundColor = .yellow
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//        button.addTarget(self, action: #selector(handleOpenClose), for: .touchUpInside)
//
//        return button
//    }
//
//    @objc func handleOpenClose() {
//
//        let section = 0
//
//        var indexPaths = [IndexPath]()
//
//        print("Trying to expand and close")
//        for row in Global.toDoListArray[section].indices {
//
//            print(0, row)
//
//            let indexPath = IndexPath(row: row, section: section)
//            indexPaths.append(indexPath)
//        }
//
//        toDoList.deleteRows(at: indexPaths, with: .fade)
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 44
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return Global.toDoListArray.count
//    }

    @objc func checkMarkButtonClicked ( sender: UIButton) {
        
        if sender.isSelected {
            sender.isSelected = false
            
        }else{
            
            sender.isSelected = true
            
        }
        toDoList.reloadData()
    }
    


}

//Code
