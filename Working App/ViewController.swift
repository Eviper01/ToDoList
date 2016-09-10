//
//  ViewController.swift
//  Working App
//
//  Created by John Wallis on 9/09/2016.
//  Copyright © 2016 John Wallis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var mainTable: UITableView!
    
    var todos:[ToDos] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        refreshData()
        
    }
    
    func refreshData() {
        todos = CoreDataManager.getData("ToDos") as! [ToDos]
        mainTable.reloadData()
    }

    //MARK: Table Fucntions
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        let todo = todos[indexPath.row]
        cell.todoItem.text = String(format: "%@: %@: %@", todo.todoItem!, todo.todoDescription!, todo.dueDate!)
        cell.Checkbox.text = "◻️"
        if (todo.complete == true) {
            cell.Checkbox.text = "✅"
        }
        return cell
    }
    
    
    
}
