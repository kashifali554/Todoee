//
//  ViewController.swift
//  Todoee
//
//  Created by Ali on 11/1/18.
//  Copyright © 2018 Kashif Ali. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray = ["Find Mike", "Buy Eggos", "Destory Deogorgon"]

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
    


}

