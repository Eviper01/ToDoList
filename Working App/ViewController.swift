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
    var editTodo:ToDos!
    var tasks = [ToDos]()
    var editTodoRow:Int = 0

    
    
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
    
    
    
    
    func formatDate(date:NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd/MMM"
        return dateFormatter.stringFromDate(date)
    }
    

    //MARK: Table Fucntions
    
    
    
    //Tabel UI Elements
    
//    cell.todoItem
//    cell.todoDescription
//    cell.dueDate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        let todo = todos[indexPath.row]
        
//        these are config
        
//        Wraps the description text
        cell.todoDescription.numberOfLines = 0
        
        
//        These Handle Updating the cell data

        cell.todoItem.text = String(format: "%@", todo.todoItem!)
        cell.todoDescription.text = String(format: "%@", todo.todoDescription!)
        cell.dueDate.text = String(format: "%@", formatDate(todo.dueDate!))

        
        cell.Checkbox.text = "◻️"
        if (todo.complete == true) {
            cell.Checkbox.text = "✅"
        }
        return cell
    }
    

    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if tableView.isEqual(mainTable) {
            let todo = todos[indexPath.row]
            editTodo = todo
            editTodoRow = indexPath.row
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! TableViewCell
            
            if (cell.Checkbox.text == "✅") {
                cell.Checkbox.text = "◻️"
                todo.complete = false
            }
            
            else {
                cell.Checkbox.text = "✅"
                todo.complete = true
                
            }
            CoreDataManager.update(todo)
            
        }
        return indexPath
    }
// This prepaers for the editing view
    
    @IBAction func editButton_Clicked() {
        
        if (editTodo !== nil) {
        performSegueWithIdentifier("editClicked", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "editClicked" {
            // add something to prevent this when it is clicked with no selection
            let otherViewController = segue.destinationViewController as! EditViewController
            otherViewController.TodoEdit = editTodo
            otherViewController.todoRow = editTodoRow
        }
    }
    
 
    
    // Deleting Items
    

    
    //this deletes from the uiview
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            todos.removeAtIndex(indexPath.row)
            CoreDataManager.removeTask(indexPath.row)
            mainTable.reloadData()

            
        }
}
    
    
    
}