//
//  ViewController.swift
//  Todoee
//
//  Created by Ali on 11/1/18.
//  Copyright © 2018 Kashif Ali. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike", "Buy Eggos", "Destory Deogorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }

    //    Mark: Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        
//        Checkes tick mark if cell is selected
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
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
            self.itemArray.append(textField.text!)
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

