
//
//  ViewController.swift
//  Exam 3
//
//  Created by Joseph Novosel on 8/18/17.
//  Copyright © 2017 Joseph Novosel. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController, UIActionSheetDelegate {
    
    var stores = [NSManagedObject]()
    let segue = "storeSegue"
    var selectedStore = NSManagedObject()
    var tap = Tap.detail
    
    enum Tap {
        case detail
        case edit
        case delete
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "Cell")
        
        tableView.allowsMultipleSelectionDuringEditing = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Store")
        
        //3
        do {
            stores = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tap {
        case .detail:
            selectedStore = stores[indexPath.row]
            performSegue(withIdentifier: segue, sender: nil)
            
            break
        case .delete:
            deleteAction(indexPath: indexPath)
            break
        default:
            break
        }
        

    }

    
    @IBAction func addStore(_ sender: Any) {
        
        let actionSheet = UIActionSheet(title: "Choose Option", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil, otherButtonTitles: "Add Store", "Edit Store", "Delete Store")
        
        actionSheet.show(in: self.view)
    }
    
    func deleteAction(indexPath: IndexPath) {
        delete(object: stores[indexPath.row])
        stores.remove(at: indexPath.row)
        self.tableView.reloadData()
    }
    
    func delete(object: NSManagedObject) {
        
        guard let appDel = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDel.persistentContainer.viewContext
        context.delete(object)
        try! context.save()
    }
    
    func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt buttonIndex: Int) {
        switch (buttonIndex){
            case 1:
                add()
            case 2:
                print("Save")
            case 3:
                tap = .delete
            default:
                print("Default")
            
        }
    }
    
    func add() {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Add a Store", message: "Add a store to your list", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField(configurationHandler: nil)
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            
            self.save(name: (textField?.text)!)
            
            
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    func save(name: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Store", in: managedContext)!
        let store = NSManagedObject(entity: entity, insertInto: managedContext)
        
        store.setValue(name, forKeyPath: "name")
        
        do {
            try managedContext.save()
            stores.append(store)
            self.tableView.reloadData()

        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextScene = segue.destination as? StoreDetailTableViewController
        nextScene!.store = selectedStore.value(forKey: "name") as! String
        print(selectedStore.value(forKey: "name") as! String)
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stores.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let store = stores[indexPath.row]
            let cell =
                tableView.dequeueReusableCell(withIdentifier: "Cell",
                                              for: indexPath)
            cell.textLabel?.text =
                store.value(forKeyPath: "name") as? String
            return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // this method handles row deletion
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteAction(indexPath: indexPath)
        }
    }
}

