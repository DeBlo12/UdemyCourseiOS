//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Ivo Specht on 30/03/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    
    
    let realm = try! Realm()
    
    var categories: Results<Category>?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Categories"

        loadData()
    }
    
    
    @IBAction func addCategoryBtn(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let addAlert = UIAlertController(title: "New Category:", message: "Add a new category", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            
            print("Succesfully added Category")
            
            let newCategory = Category()
            newCategory.name = textField.text!
            
            self.saveData(category: newCategory)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("No new category added")
            self.dismiss(animated: true, completion: nil)
        }
        
        addAlert.addTextField { (alertTextfield) in
            alertTextfield.placeholder = "Enter a new Category"
            textField = alertTextfield
        }
        
        addAlert.addAction(action)
        addAlert.addAction(cancelAction)
        
        present(addAlert, animated: true, completion: nil)
        
    }
    
    func saveData(category: Category) {
        
        do {
            try realm.write {
                realm.add(category)
            }
            
        } catch {
            print("error saving context \(error)")
        }
        
        tableView.reloadData()
        
   }
    
    
    func loadData() {

        categories = realm.objects(Category.self)
        

        tableView.reloadData()

    }
////
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #wa rning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories?.count ?? 1
    }
    
    // MARK: - Table view Delegate
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableviewComponents.CategoryCellRI, for: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "Please enter a Category"
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: Constants.Segues.CategoryToItems, sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
        
    }
    
//
//
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        if editingStyle == .delete {
//            let categoryToDelete = categories?[indexPath.row]
//            realm.delete(categoryToDelete!)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            tableView.reloadData()
//        }
//
//    }
    
}
