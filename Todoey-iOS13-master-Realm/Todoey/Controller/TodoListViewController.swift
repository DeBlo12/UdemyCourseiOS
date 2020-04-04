//
//  UITTableViewController.swift
//  Todoey
//
//  Created by Ivo Specht on 19/03/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift

class TodoListViewController: UITableViewController {
    
    var items: Results<Item>?
    let realm = try! Realm()
    
    
    var selectedCategory : Category? {
        didSet {
            loadItems()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        
//        loadItems()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func addNewItems(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let addAlert = UIAlertController(title: "Add a new thing", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // What happens once user clicks addItem Button on UIAlert
            print("Success")
            
            if let currentCategory = self.selectedCategory {
                
                do {
                    try self.realm.write {
                        let newItem = Item()
                        newItem.title = textField.text!
                        newItem.done = false
                        newItem.dateCreated = Date()
                        newItem.category = currentCategory.name
                        currentCategory.items.append(newItem)
                    }
                } catch {
                    print("Error saving data \(error) ")
                }
            }
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("nothing was added")
            self.dismiss(animated: true, completion: nil)
        }
        
        addAlert.addTextField { (alertTextField) in
            
            alertTextField.placeholder = "Enter a new ToDo Item."
            textField = alertTextField
            
        }
        addAlert.addAction(cancelAction)
        addAlert.addAction(action)
        
        present(addAlert, animated: true, completion: nil)
    }
    

    func loadItems() {
        
        items = selectedCategory?.items.sorted(byKeyPath: "dateCreated", ascending: true)
        
        tableView.reloadData()
    }



    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items?.count ?? 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableviewComponents.cellReusableIdentifier, for: indexPath)
        
        if let item = items?[indexPath.row] {
            cell.textLabel?.text = item.title
            
            cell.accessoryType = item.done ? .checkmark : .none
            
        } else {
            cell.textLabel?.text = "No items added, yet."
        }
        
        
        return cell
    }
    

    // MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        // Checks whether it is done, and if it isn't then it changes to done.
        if let item = items?[indexPath.row] {
            
            do {
                try realm.write {
                    item.done = !item.done
                }
            } catch {
                print("error saving the data: \(error)")
            }
        }
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            let itemToDelete = items?[indexPath.row]
            do {
                try realm.write() {
                    realm.delete(itemToDelete!)
                }
            } catch {
                print(error)
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }

    }
    

}


// MARK: - UISearchbarDelegation

extension TodoListViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // So it doesn't make all values in Table disappear when clicked search without Text.
        if searchBar.text?.count == 0 {
            loadItems()
        } else {
            items = items?.filter("title CONTAINS[cd] %@", searchBar.text).sorted(byKeyPath: "dateCreated", ascending: true)
            tableView.reloadData()
        }
    }


    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItems()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
    
}
