//
//  AllCurrenciesTableViewController.swift
//  CurrencyConverter
//
//  Created by Riad on 5/26/20.
//  Copyright © 2020 Projectum. All rights reserved.
//

import UIKit

class AllCurrenciesTableViewController: UITableViewController {
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for currency in allCurrencies {
            if currency.isChecked == true {
                currency.isChecked = false
            }
        }
        
        for checkedCurrency in checkedCurrencies {
            for currency in allCurrencies {
                if currency.title == checkedCurrency.title {
                    currency.isChecked = true
                    //break, continue, fallthrough? чтобы после нахождения дальше не искал
                }
            }
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
   
    var allCurrencies = Currency.allCurrencies
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allCurrencies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currency", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = allCurrencies[indexPath.row].title
        cell.accessoryType = allCurrencies[indexPath.row].isChecked ? .checkmark : .none
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
     
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            allCurrencies.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            tableView.insertRows(at: [indexPath], with: .fade)
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
*/
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = allCurrencies[indexPath.row]
               item.isChecked.toggle()
        
        guard let cell = tableView.cellForRow(at: indexPath) else {return}
       
        if item.isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
    }
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    var checkedCurrencies: [Currency] = []
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        checkedCurrencies.removeAll()
        for currency in allCurrencies {
            if currency.isChecked == true {
                checkedCurrencies.append(currency)
            }
        }
    }
    

}
