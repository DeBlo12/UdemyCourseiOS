//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    var messages :  [Message] = [
        Message(sender: "iv@test.com", body: "HeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHeyHey"),
        Message(sender: "1@2.com", body: "Hello!"),
        Message(sender: "iv@test.com", body: "Hi")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        title = Constants.appName
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        
        loadMessages()
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
//        loadMessages()
        
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            // Check if the textfield and sender exist. Then send to DB.
            db.collection(Constants.FStore.collectionName).addDocument(data: [
                Constants.FStore.senderField : messageSender,
                Constants.FStore.bodyField   : messageBody
            ]) { (error) in
                if let error = error {
                    print("There was an error saving data to firestore, \(error)")
                    return
                } else {
                    print("Successfully saved Data")
                }
            }
        }
    }
    
    
    func loadMessages() {
        messages = []
        
        db.collection(Constants.FStore.collectionName).getDocuments { (querysnapshot, error) in
            
            if let error = error {
                print("There was an issue retrieving data: \(error)")
            } else {
                if let snapshotDocument = querysnapshot?.documents {
                    
                    for doc in snapshotDocument {
                        let data = doc.data()
                        if let sender = data[Constants.FStore.senderField] as? String, let body = data[Constants.FStore.bodyField] as? String {
                            
                            let newMessage = Message(sender: sender, body: body)
                            self.messages.append(newMessage)
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                            
                        }
                    }
                }
            }
        }
    }
    
    
    // MARK: - NavigationBarButtonItems
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            print("User signed out.")
            self.navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
}


// MARK: - Extensions for TableViewDataSource and TableViewDelegate

/*
 Deleting the delegation so that a person can't interact with individual cells.
 */

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        
        cell.label.text = messages[indexPath.row].body
        cell.label.textColor = UIColor(named: Constants.BrandColors.lightPurple)
            
        return cell
    
    }
    
    
}
