//
//  DetailViewController.swift
//  Table View
//
//  Created by Sean Scarmack on 8/6/16.
//  Copyright © 2016 Sean Scarmack. All rights reserved.
//

import UIKit



class DetailViewController: UIViewController {
    
    
    var todo: TodoManager!
    

// IB Outlets
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var noteText: UITextField!
    
    @IBOutlet weak var completedSwitch: UISwitch!
    
    
// IB Actions
    
    // Save Button

    @IBAction func saveButton(sender: UIBarButtonItem) {
        
        /*
        todo.name = nameText.text!
        todo.note = noteText.text!
        todo.completed = completedSwitch.on
        */
        
 
        navigationController?.popViewControllerAnimated(true)
    }


    
// View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
// Will appear
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
/*
        nameText.text = todo.name
        noteText.text = todo.note
        completedSwitch.on = todo.completed
*/        
        
    }
 
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}