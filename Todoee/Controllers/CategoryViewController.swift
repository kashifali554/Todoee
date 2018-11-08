//
//  CategoryViewController.swift
//  Todoee
//
//  Created by Ali on 11/5/18.
//  Copyright © 2018 Kashif Ali. All rights reserved.
//

import UIKit
import RealmSwift


class CategoryViewController: UITableViewController {
//    Initialized new realm access point
    let realm = try! Realm()
//    Categories is an collection of result coming from realm (Result), Category is optional to be safe.
    var categories : Results<Category>?

    override func viewDidLoad() {
        super.viewDidLoad()
//loading the categories
        loadCategories()
    }
    
    //    Mark: TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        Nil Colesing operator that returns the number of categories and if nil only return one cell
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
//        If categories result is not nill populate the cell
//        Nil Cloesing Operator, if the cell is nil, we will populate with this string
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories added yet"
        
        return cell
    }
    
    //    Mark: TableView delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        Perfrom segue to take us to items veiw controller
        performSegue(withIdentifier: "goToItems", sender: self)
    }
//    Before going to items, create a destinaction of vc
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
//        Take us to the perticuler items in one category
        if let indexPath = tableView.indexPathForSelectedRow{
//       destinationVC.selectedCategory take us to destination view controller property .slectedCat... i.e todolistVC
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    //    Mark: Data Manipulation Methods
    func save(category: Category) {
        do {
//            This block commit changes to our realm db and add it to category
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving category \(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategories() {
//        Looking inside realm and fetching all the object that belong to categroy data type.
        categories = realm.objects(Category.self)
        
        tableView.reloadData()
    }
    
    
    //    Mark: Add New Categories

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
//        Create an alert
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
//       action has text filed to add text and add the category
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
//            Create a new category inside the alert
            let newCategory = Category()
//            Give the name of the category
            newCategory.name = textField.text!
//            Save new category
            self.save(category: newCategory)
        }
        
        alert.addAction(action)
        
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new category"
        }
        
        present(alert, animated: true, completion: nil)
    }
    
}
