//
//  EditViewController.swift
//  Working App
//
//  Created by John Wallis on 12/09/2016.
//  Copyright © 2016 John Wallis. All rights reserved.
//
import UIKit

class EditViewController: UIViewController {
    
    
   

    
     var TodoEdit:ToDos!
 
    @IBOutlet var todoItemLabel: UILabel!
    
    @IBOutlet var todoDescriptionLabel: UITextView!

    
    @IBOutlet var dueDateLabel: UILabel!
    
    func formatDate(date:NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd/MMM"
        return dateFormatter.stringFromDate(date)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        todoItemLabel.numberOfLines = 0
        dueDateLabel.numberOfLines = 0
        
        todoItemLabel.text = String(format: "%@", TodoEdit.todoItem!)
        todoDescriptionLabel.text = String(format: "%@", TodoEdit.todoDescription!)
        dueDateLabel.text = formatDate(TodoEdit.dueDate!)
        


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
