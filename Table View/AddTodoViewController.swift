//
//  AddTodoViewController.swift
//  Table View
//
//  Created by Sean Scarmack on 8/6/16.
//  Copyright © 2016 Sean Scarmack. All rights reserved.
//

import UIKit



protocol AddTodoViewControllerDelegate {
    func addNew(todo: TodoManager)

}



class AddTodoViewController: UIViewController, UITextFieldDelegate {
    
    var delegate: AddTodoViewControllerDelegate!

    
    var date: NSDate!
    
    
    
//IB Outlets
    

    @IBOutlet weak var nameText: UITextField!

    @IBOutlet weak var dateText: UITextField!
    
    @IBOutlet weak var noteText: UITextField!
    

    
    
//IB Actions
    
    
    // Save Button

    @IBAction func saveButton(sender: UIBarButtonItem) {
        
        
        TodoManager.sharedInstance.addNewTodoWithName(nameText.text!, note: noteText.text!, date: date)
        
        
        navigationController?.popViewControllerAnimated(true)
    }

    
    
    // Cancel Button


    @IBAction func cancelButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    
    // Text Field Delegates
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        if textField == dateText{
        let datePicker = UIDatePicker()
        textField.inputView = datePicker
            
        datePicker.addTarget(self, action: #selector(AddTodoViewController.datePickerChanged(_:)), forControlEvents: .ValueChanged)
            
        }
    }
    
    func datePickerChanged(sender:UIDatePicker) {
        displayDate(sender.date)
    
    }
    
    func displayDate(date: NSDate) {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        dateText.text = formatter.stringFromDate(date)
        self.date = date
        
    }

    
    
    
// Touch Events
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    
// Will Appear
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        date = NSDate()
        displayDate(date)
    }
    
    
    
// View lifecycle
    
// View Did Load

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nameText.delegate = self
        noteText.delegate = self
        dateText.delegate = self
        
        date = NSDate()

    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
