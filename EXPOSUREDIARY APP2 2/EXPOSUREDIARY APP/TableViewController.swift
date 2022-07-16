//
//  ViewController.swift
//  EXPOSUREDIARY APP
//
//  Created by Lee, Christopher on 10/28/21.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var media: [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("app_title", comment: "statistics")
        self.tableView.rowHeight = 64

        self.registerTableViewCells()
        readData()
    }

    func deletionAlert(title: String, completion: @escaping (UIAlertAction) -> Void) {
        let alertMsg = NSLocalizedString("confirmation_text", comment: "confirmation")
        let alert = UIAlertController(title: NSLocalizedString("warning_text", comment: "warning"), message: alertMsg, preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: NSLocalizedString("delete_text", comment: "statistics"), style: .destructive, handler: completion)
        let cancelAction = UIAlertAction(title: NSLocalizedString("cancel_text", comment: "cancel"), style: .cancel)
        
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        alert.popoverPresentationController?.permittedArrowDirections = []
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func registerTableViewCells(){
        let textFieldCell = UINib(nibName: "TripCell", bundle: nil)
        self.tableView.register(textFieldCell, forCellReuseIdentifier: "TripCell")
    }
    
    /*override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }*/
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return media.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TripCell") as? TripCell else {
            fatalError("TripCell")
        }
        
        print("something")
        
        if let trip = media[indexPath.row] as? Trip {
            cell.update(with: trip)
        }
        
        //cell.imageCell.image = UIImage(named: "w")

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let trip = media[indexPath.row] as? Trip {
                deletionAlert(title: "title", completion: { _ in
                    self.deleteItem(trip: trip)
                })
            }
        }
    }
    
    func getRowNum() -> Int {
 
        return media.count
    }
    
    func readData() {
        let context = AppDelegate.cdContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Trip")
        do {
            media = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch requested item. \(error), \(error.userInfo)")
        }
        tableView.reloadData()

    }
    
    func deleteItem(trip: Trip) {
        let context = AppDelegate.cdContext
        if let _ = media.firstIndex(of: trip)  {
            context.delete(trip)
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not delete the item. \(error), \(error.userInfo)")
            }
        }
        readData()
    }
    
    // MARK: - Actions
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        readData()
        tableView.reloadData()
    }

    
    }
    
    //override func tableView(_ tableView: UITableView, numberofRowsInSection section: Int) -> Int {
        
    //}
