//
//  ViewController.swift
//  Table View
//
//  Created by Sean Scarmack on 8/6/16.
//  Copyright © 2016 Sean Scarmack. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTodoViewControllerDelegate {
    
    

    
    var array = [TodoManager]()

    
    
    
// IB Outlets
    
    // Tableview Outlet
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
// IB Actions
    
    // Edit Button Action
    
    @IBAction func editButton(sender: UIBarButtonItem) {
        tableView.editing = !tableView.editing
        
    }

    
// Add Todo Delegate
    func addNew(todo: TodoManager) {
        array.append(todo)
        tableView.reloadData()
    }
    
    
    
// Tableview Datasource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoManager.sharedInstance.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        
        let todo = TodoManager.sharedInstance.todoAtIndex(indexPath.row)
        
        
        // Configure Cell
        
        cell.textLabel?.text = todo.name
        
        /* cell.detailTextLabel?.text = todo.note */
        
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        
        let date = NSDate(timeIntervalSince1970: todo.date)
        cell.detailTextLabel?.text = formatter.stringFromDate(date)
        
        

        // Text color
        let color3 = UIColor(white: 146/255, alpha: 1)
        let color5 = UIColor(white: 116/255, alpha: 1)

        cell.textLabel?.textColor = color3
        cell.detailTextLabel?.textColor = color5
        
        
        
        // Checkmark
         
         setCheckmarkForCell(cell, completed: todo.completed)
        

        
        return cell
    }
    
    func setCheckmarkForCell (cell: UITableViewCell, completed: Bool) {
        if completed {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
    }
    
    
    
    
    
// Navigation Segue
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddTodoSegue" {
            
            
            let destVC = segue.destinationViewController as! AddTodoViewController
            destVC.delegate = self
            
            
        }
        
            else if segue.identifier == "DetailSegue" {
            
            let destVC = segue.destinationViewController as! DetailViewController
           
            if let indexPath = tableView.indexPathForSelectedRow {
                
                destVC.todo = TodoManager.sharedInstance.fetchTodos(index)
                
            }
        }
    }

    
    
    
// Click row checkmark

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
        /*
        let todo = TodoManager.sharedInstance.todoAtIndex(indexPath.row)
        todo.completed = !todo.completed
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)!
        setCheckmarkForCell(cell, completed: todo.completed)
         */
    }
    
    
    
    
    
// Edit Row (Delete rows)
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            TodoManager.sharedInstance.removeTodoAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
        }
    }

    
    
    
    
/*
// Move Row
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        
        let todo = array.removeAtIndex(sourceIndexPath.row)
        array.insert(todo, atIndex: destinationIndexPath.row)
 
        
        
        /*
        _ = TodoManager.sharedInstance.removeTodoAtIndex(sourceIndexPath.row)
        
        array.insert(TodoManager.sharedInstance, atIndex: destinationIndexPath.row)
        */
        
        /* TodoManager.sharedInstance.todoAtIndex(destinationIndexPath.row) */
    }
*/
    

    
    
// View lifecycle
// View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    
    
//View Will Appear
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

