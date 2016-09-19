//
//  CoreDataManager.swift
//  Working App
//
//  Created by John Wallis on 10/09/2016.
//  Copyright © 2016 John Wallis. All rights reserved.
//

import UIKit
import CoreData






class CoreDataManager: NSObject {
    


    static func getManagedObject() -> NSManagedObjectContext {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.managedObjectContext
    }
    
    static func getData(entityName:String,predicate:NSPredicate?=nil) -> [NSManagedObject] {
        var resultsManagedObject: [NSManagedObject] = []
        do {
            let ManagedObject=getManagedObject()
            let request = NSFetchRequest(entityName: entityName)
            if predicate != nil{
                request.predicate = predicate
            }
            
            let results = try ManagedObject.executeFetchRequest(request)
            resultsManagedObject = results as! [NSManagedObject]
        }
            
        catch {
            
            print ("getData: Error Retriving Data")
            
        }
        return resultsManagedObject
    }
    
    
    static func save(todoItem:String, todoDescription:String, dueDate:NSDate, complete:Bool){
        let ManagedObject=getManagedObject()
        let todo = NSEntityDescription.insertNewObjectForEntityForName("ToDos", inManagedObjectContext: ManagedObject) as! ToDos
        todo.complete = complete
        todo.dueDate = dueDate
        todo.todoItem = todoItem
        todo.todoDescription = todoDescription
        
        do {
            try ManagedObject.save()
        
        }
        
        catch {
            print ("error saving.")
        }
        
    }

    
    
    //delete
//    ANNNDD it works.
    static func removeTask(index:Int){
        
        let ManagedObject = getManagedObject()
        
        do {
        let fetchRequest = NSFetchRequest(entityName:"ToDos")
        
        let todo = try ManagedObject.executeFetchRequest(fetchRequest)
        ManagedObject.deleteObject(todo[index] as! NSManagedObject)
        }
            
        catch {
            
            print ("removeTask: Error Retriving Data")
            
        }

        do {
            try ManagedObject.save()
        }
     
        catch {
            print("removeTask : error saving or something")
        }
    
        
            }
    
    static func update(todoItem:ToDos) {
         let ManagedObject = getManagedObject()
        
        do {
            let request  = NSFetchRequest(entityName: "ToDos")
            request.predicate = NSPredicate(format: "todoItem=%@ and todoDescription=%@ and dueDate=%@", todoItem.todoItem!,todoItem.todoDescription!, todoItem.dueDate!)
            let results = try ManagedObject.executeFetchRequest(request)
            let resultSet = results as! [ToDos]
            resultSet[0].complete = todoItem.complete
        }
        catch {
            print ("error fetching")
            
        }
        
        do {
            try ManagedObject.save()
        }
        
        catch {
            print ("error updating")
        }
        
    }
    
    // To add
    static func edit(index:Int, todoItem:String, todoDescription:String, dueDate:NSDate, complete:Bool){
        
        let ManagedObject = getManagedObject()
        
        do {
            let fetchRequest = NSFetchRequest(entityName:"ToDos")
            
            
            let todo = try ManagedObject.executeFetchRequest(fetchRequest)
            // It does something here?
        

            

        }
            
        catch {
            
            print ("edit: Error Retriving Data")
            
        }
        
        do {
            try ManagedObject.save()
        }
            
        catch {
            print("removeTask : error saving or something")
        }
        
        
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
}
