//
//  MainTableViewController.swift
//  DynamicTable
//
//  Created by Faical Sawadogo1212 on 01/12/19.
//  Copyright © 2019 Faical Sawadogo1212. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    private var rowCount       = 0
    private let sectionCount   = 1
    
    private var itemStore = ItemStore()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionCount
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rowCount
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "numberCell",
                                                 for: indexPath)
        
        // Configure the cell...
        let row  = indexPath.row
        let item = itemStore.getItem(index: row)
        let name = item.name
        
        if name.count != 0 {
            // Use the name from the Item
            cell.textLabel?.text = name
        }
        else {
            // Use the row number
            cell.textLabel?.text = String(format: "Row: %d",
                                          arguments: [row])
        }

        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView,
                            canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView,
                            moveRowAt fromIndexPath: IndexPath,
                            to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView,
                           canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
//    override func tableView(_ tableView: UITableView,
//                            titleForHeaderInSection section: Int) -> String? {
//            let title = String(format: "Section: %d",
//                               arguments: [section])
//            return title
//    }

    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get a reference to the upcoming view controller
        let dest = segue.destination as? DetailViewController
        
        //
        let row = tableView.indexPathForSelectedRow?.row
        let item = itemStore.getItem(index: row!)
        
        // Set up the destination property
        dest!.selectedRow = row
        
        // Set the Item for the detail VC, table view VC reference
        dest!.item = item
    }
    
    @IBAction func addRow(_ sender: UIBarButtonItem) {
        rowCount += 1
        itemStore.addItem()
        tableView.reloadData()
    }
    
}
