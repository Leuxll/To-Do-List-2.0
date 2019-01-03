//
//  ViewController.swift
//  To Do List 2.0
//
//  Created by Yue Fung Lee on 9/2/2018.
//  Copyright © 2018 Yue Fung Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

//Outlets
    @IBOutlet weak var toDoList: UITableView!
//Outlets
//Code

    override func viewDidLoad() {
        super.viewDidLoad()
     
        toDoList.register(UINib.init(nibName: "CheckMarkCell", bundle: nil), forCellReuseIdentifier: "CheckListIdentifier")
        toDoList.dataSource = self
        toDoList.delegate = self
        
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
        return 44.0
    }
    
    @objc func checkMarkButtonClicked ( sender: UIButton) {
        
        if sender.isSelected {
            sender.isSelected = false
            
        }else{
            
            sender.isSelected = true
            
        }
        toDoList.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        toDoList.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//Code
