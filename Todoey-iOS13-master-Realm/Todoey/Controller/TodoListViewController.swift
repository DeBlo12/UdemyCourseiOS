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
//
//
//    func saveItems() {
//
//
//        do {
//            try realm.write {
//
//            }
//        } catch {
//            print("Error saving context \(error)")
//        }
//
//        self.tableView.reloadData()
//    }


    func loadItems() {
        
        items = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        
        
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
        
        let item = items?[indexPath.row]
        
        cell.textLabel?.text = item?.title
        
        cell.accessoryType = item!.done ? .checkmark : .none
//        This equals the line above
//        if  item.done == true{
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        }

        return cell
    }
    

    // MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        // Checks whether it is done, and if it isn't then it changes to done.
        items?[indexPath.row].done = (items?[indexPath.row].done)!
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }

}


// MARK: - UISearchbarDelegation

//extension TodoListViewController: UISearchBarDelegate {
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//
//        // So it doesn't make all values in Table disappear when clicked search without Text.
//        if searchBar.text?.count == 0 {
//            loadItems()
//        } else {
//
//            let request : NSFetchRequest<Item> = Item.fetchRequest()
//            let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
//
//            request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
//
//            loadItems(with: request, predicate: predicate)
//        }
//
//    }
//
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//        if searchBar.text?.count == 0 {
//
//            loadItems()
//            DispatchQueue.main.async {
//                searchBar.resignFirstResponder()
//            }
//
//
//        }
//
//
//    }
//}
