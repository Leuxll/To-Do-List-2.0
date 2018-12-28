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
    //Checklist
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Global.toDoListArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Global.toDoListArray[indexPath.row]
        return cell
    }
    
    //Checklist
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
