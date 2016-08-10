//
//  TodoManager.swift
//  Table View
//
//  Created by Sean Scarmack on 8/6/16.
//  Copyright © 2016 Sean Scarmack. All rights reserved.
//

import UIKit
import CoreData


class TodoManager {
    
// Singleton
    
    static let sharedInstance = TodoManager()
    
    private var todos = [Todo]()
    let context: NSManagedObjectContext!
    
    
    
    var count: Int {
        get {
            return todos.count
        }
    }
    
    
    
    func todoAtIndex(index: Int) -> Todo {
        
        return todos[index]
    }
    
    
    
    func addNewTodoWithName(name: String, note: String, date: NSDate) {
        let todo = NSEntityDescription.insertNewObjectForEntityForName("Todo", inManagedObjectContext: context) as! Todo
        
        todo.name = name
        todo.note = note
        todo.completed = false
        todo.date = date.timeIntervalSince1970

        todos.append(todo)
        
        saveContext()
    }
    
    
    func removeTodoAtIndex(index: Int) {
        context.deleteObject(todoAtIndex(index))
        todos.removeAtIndex(index)
        
        saveContext()
    }
    
    
    func saveContext() {
        do {
            
            try context.save()
            
        } catch let error as NSError {
            print ("Error Saving Context: \(error), \(error.userInfo)")
        }
    }
    
    
    
// Fetch
    
    func fetchTodos() {
        let fetchRequest = NSFetchRequest(entityName: "Todo")
        
        do {
            
       // Try
            let results = try context.executeFetchRequest(fetchRequest)
            todos = results as! [Todo]
            
        } catch let error as NSError {
            print ("Could not fetch todos: \(error), \(error.userInfo)")
        
        }
        
    }
    
    
    
    
// Init
    
    private init () {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        context = appDelegate.managedObjectContext
        
        fetchTodos()
        
        
    }
    
}