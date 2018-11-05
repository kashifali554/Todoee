//
//  ViewController.swift
//  Todoee
//
//  Created by Ali on 11/1/18.
//  Copyright © 2018 Kashif Ali. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    // tapping into app delegate class vis singelton (.sherd is singleton object)
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
//        loadItems()
        
    }
    
    // MARK: numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //Mark: cellForRowAT
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        Indicating towards the cell via identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item  = itemArray[indexPath.row]
        
        cell.textLabel?.text = itemArray[indexPath.row].title

        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }

    //    Mark: Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    //    Mark: Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todoee", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
//            Creating an object with Datamodel class
            let newItem = Item(context: self.context)
            newItem.title = textField.text!
            newItem.done = false
            self.itemArray.append(newItem)
            
//            self.itemArray.append(textField.text!)
//            Updated item array to user defaults are saved in plist file as key value pair
//            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.saveItems()
        }
        
//        Add text field to the alertbody (Code is coming from alert class) Closure
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            print(alertTextField)
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    //    Mark:  Model Manupulation Methods
    
    func saveItems() {
        
        do {
           try context.save()
        } catch {
            print("Error saving context\(error)")
        }
        
        self.tableView.reloadData()
        
    }
    
//    func loadItems() {
//
//        if let data = try? Data(contentsOf: dataFilePath!){
//            let decoder = PropertyListDecoder()
//            do {
//                itemArray = try decoder.decode([Item].self, from: data)
//            } catch {
//                print("Print error decoding data \(error)")
//            }
//        }
//    }
//

}

