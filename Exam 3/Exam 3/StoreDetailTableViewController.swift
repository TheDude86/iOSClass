//
//  StoreDetailTableViewController.swift
//  Exam 3
//
//  Created by Joseph Novosel on 8/18/17.
//  Copyright © 2017 Joseph Novosel. All rights reserved.
//

import UIKit
import CoreData

class StoreDetailTableViewController: UITableViewController {
    
    var store = ""
    var items = [NSManagedObject]()

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
            NSFetchRequest<NSManagedObject>(entityName: "Item")
        
        let predicate = NSPredicate(format: "store == %@", store)
        fetchRequest.predicate = predicate
        
        //3
        do {
            items = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
    
    
    @IBAction func addAction(_ sender: Any) {
        save(name: "test")
    }
    
    func save(name: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Item", in: managedContext)!
        let item = NSManagedObject(entity: entity, insertInto: managedContext)
        
        item.setValue(name, forKeyPath: "name")
        item.setValue(store, forKey: "store")
        item.setValue(0, forKey: "count")
        
        do {
            try managedContext.save()
            items.append(item)
            self.tableView.reloadData()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = item.value(forKeyPath: "name") as? String
        return cell
    }
    
}
