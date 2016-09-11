//
//  AddViewController.swift
//  Working App
//
//  Created by John Wallis on 10/09/2016.
//  Copyright © 2016 John Wallis. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    

//These Break the app
    @IBOutlet var todoItem: UITextField!
    @IBOutlet var todoDescription: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
//They need to be fixed ^
    
    
    
    
    var dueDate:NSDate = NSDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButton_clicked(sender: AnyObject) {
    
        CoreDataManager.save(todoItem.text!, todoDescription: todoDescription.text, dueDate: dueDate, complete: false)
        todoItem.text = "Task Name"
        todoDescription.text = "Description"
        
        //some animation mumbo jumbo wil go here
    }
    
    
 
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
 
 
    
    @IBAction func datePicker_Changed(sender: AnyObject) {
    dueDate = dueDatePicker.date
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
