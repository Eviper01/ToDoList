//
//  EditViewController.swift
//  Working App
//
//  Created by John Wallis on 12/09/2016.
//  Copyright © 2016 John Wallis. All rights reserved.
//
import UIKit

class EditViewController: UIViewController {
    
    
   
    @IBOutlet var todoItem: UILabel!
    @IBOutlet var todoDescription: UILabel!
    @IBOutlet var dueDatePicker: UILabel!
    
    
    var todoRow:Int = 0
    //This
    var TodoEdit: ToDos!

    var dueDate:NSDate = NSDate()
    
    
    
    func formatDate(date:NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd/MMM"
        return dateFormatter.stringFromDate(date)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
       
        todoItem.text = String(format: "%@", TodoEdit.todoItem!)
        todoDescription.text = String(format: "%@", TodoEdit.todoDescription!)
        dueDatePicker.text = formatDate(dueDate)
            


    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
