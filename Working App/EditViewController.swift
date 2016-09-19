//
//  EditViewController.swift
//  Working App
//
//  Created by John Wallis on 12/09/2016.
//  Copyright © 2016 John Wallis. All rights reserved.
//
import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {
    
    
   
    @IBOutlet var todoItem: UITextField!
    @IBOutlet var todoDescription: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    
    var TodoEdit: ToDos!

    var dueDate:NSDate = NSDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if (TodoEdit !== nil) {
        todoItem.text = String(format: "%@", TodoEdit.todoItem!)
        todoDescription.text = String(format: "%@", TodoEdit.todoDescription!)
        dueDatePicker.date = TodoEdit.dueDate!
            
            
            
        }
        
//        else {
//            performSegueWithIdentifier("editDone", sender: self)
//        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButton_clicked(sender: AnyObject) {
        
        //this needs to actually manipulate the cordata - .save() will have to be changed or a new func created ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//        Important
        
        CoreDataManager.save(todoItem.text!, todoDescription: todoDescription.text, dueDate: dueDate, complete: false)
        
        
    }
    
    
    
    // Add the func deleteButton_clicked {it deletes things}
    
    
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    
    
    @IBAction func datePicker_Changed(sender: UIDatePicker) {
        dueDate = sender.date
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
