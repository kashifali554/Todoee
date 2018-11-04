//
//  ViewController.swift
//  Todoee
//
//  Created by Ali on 11/1/18.
//  Copyright © 2018 Kashif Ali. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
//    Creating a user defaults object from UserDefaults class.
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        Creating a new Item object from data model class
        let newItem = Item()
        newItem.title = "Find Mike"
        newItem.done = true
        itemArray.append(newItem)
    
        let newItem2 = Item()
        newItem2.title = "Buy Eggs"
        itemArray.append(newItem2)
        
//        reterive the data
//        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
//            itemArray = items
//        }
    }
    
    // MARK: numberOfRowsInSection
    //    Number of cells to be populated on the screen
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    //Mark: cellForRowAT
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        Indicating towards the cell via identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        //        Setting the text of the table to use it from hard coded array
        cell.textLabel?.text = itemArray[indexPath.row].title
//        chenging the actual done mark
        if itemArray[indexPath.row].done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        
        return cell
    }

    //    Mark: Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("CellForRowAtIndexPath called")
//        print(itemArray[indexPath.row])
//        Checking if cell is marked done or not
        if itemArray[indexPath.row].done == false {
            itemArray[indexPath.row].done = true
        } else {
            itemArray[indexPath.row].done = false
        }
        
//        Checkes tick mark if cell is selected
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.reloadData()
        
//        Deselectes the rows after the tap
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    //    Mark: Add New Items
//    IBoutlest for add button pressed
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
//      local variable to store the text
        var textField = UITextField()
        
//        Adding the new to item
        let alert = UIAlertController(title: "Add new Todoee", message: "", preferredStyle: .alert)
//        UI Alert action, This will decide what happen when we user click to add item
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
//            What will happen once the user clicks the add time button on our UIAlert
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
//            self.itemArray.append(textField.text!)
//            Updated item array to user defaults are saved in plist file as key value pair
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
//          Relaoad the data on the view to add the item from alert to the view.
            self.tableView.reloadData()
        }
        
//        Add text field to the alertbody (Code is coming from alert class) Closure
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            print(alertTextField)
            textField = alertTextField
        }
        
//        Add the action to alert
        alert.addAction(action)
//        Show the alert
        present(alert, animated: true, completion: nil)
        
    }
    
    

}

