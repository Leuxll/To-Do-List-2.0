//
//  ViewController.swift
//  To Do List 2.0
//
//  Created by Yue Fung Lee on 9/2/2018.
//  Copyright © 2018 Yue Fung Lee. All rights reserved.
//

import UIKit

//struct CellData {
//    var opened = Bool()
//    var title : [String] = [""]
//    var sectionData : ([String] , [String], [String])
//}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

//Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var toDoList: UITableView!
//Outlets
//Code
    
    //var tableViewData = [CellData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableViewData = [CellData(opened: false, title: Global.toDoListArray, sectionData: Global.subTasks1, Global.subTasks2)]
        
      toDoList.register(UINib.init(nibName: "CheckMarkCell", bundle: nil), forCellReuseIdentifier: "CheckListIdentifier")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Global.toDoListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListIdentifier") as! CheckMarkCell
        cell.lblTitle.text = Global.toDoListArray[indexPath.row]
        cell.selectionStyle = .none
        cell.btnCheckMark.addTarget(self, action: #selector(checkMarkButtonClicked(sender:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
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
    
//    @objc func handleOpenClose() {
//
//        print("Trying to expand and close")
//        for row in Global.toDoListArray[0].indices {
//
//            print(0, row)
//
//        }
    
      //  toDoList.deleteRows(at: <#T##[IndexPath]#>, with: <#T##UITableViewRowAnimation#>)
//    }

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
