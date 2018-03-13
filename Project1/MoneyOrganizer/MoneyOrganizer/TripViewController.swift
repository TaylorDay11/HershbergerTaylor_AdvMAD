//
//  TripViewController.swift
//  MoneyOrganizer
//
//  Created by Taylor Hershberger on 3/12/18.
//  Copyright © 2018 Taylor Hershberger. All rights reserved.
//

import UIKit

class TripViewController: UITableViewController {
    
    var itemList = [Item]()

    
    //Totals
    @IBOutlet weak var total: UILabel!
    var calcTotal = 0
    
    @IBOutlet weak var paid: UILabel!
    var calcPaid = 0
    
    @IBOutlet weak var percent: UILabel!
    
    @IBAction func unwindToThisView(sender: UIStoryboardSegue) {
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

      
            total.text = "$0"
            paid.text = "$0"
            percent.text = ""
        

       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    override func viewDidAppear(_ animated: Bool){
//        let nav = self.navigationController?.navigationBar
        
        navigationController?.navigationBar.barTintColor = UIColor(red:119/255, green: 179/255, blue: 0/255, alpha: 1)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let item = itemList[indexPath.row]
        cell.textLabel!.text = item.name
        let costString = String(item.cost)
        cell.detailTextLabel!.text = "$" + costString
        
        if(itemList.count > 0){
                if(itemList[indexPath.row].paid){
                    cell.detailTextLabel!.textColor = UIColor.green
                }
                else{
                    cell.detailTextLabel!.textColor = UIColor.red
                }
        
        }

        return cell
    }



    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
  

 
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.itemList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            if (itemList.count > 0){
                for i in 0...itemList.count-1{
                    calcTotal = calcTotal + itemList[i].cost
                    if (itemList[i].paid){
                        calcPaid = calcPaid + itemList[i].cost
                    }
                }
            }
            
            
            total.text = "$" + String(calcTotal)
            paid.text = "$" + String(calcPaid)
            
            if (calcPaid != 0){
                let doublecalcPaid = Double(calcPaid)
                let doublecalcTotal = Double(calcTotal)
                var paidPercent = 0.0
                paidPercent = round((doublecalcPaid/doublecalcTotal)*100)
                
                print("percent")
                print(paidPercent)
                
                percent.text = String(paidPercent) + "%"
            }
            else{
                percent.text = "0%"
            }
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        //if add button is clicked
        if segue.identifier == "addItem"{
            //sets the data for the destination controller
            let itemVC = segue.destination as! ItemViewController
            //Pass Data
            itemVC.itemListDetail = itemList
            itemVC.addButton = true
        }
        
        //if cell is clicked
        if segue.identifier == "editItem"{
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
            //sets the data for the destination controller
            let itemVC = segue.destination as! ItemViewController
            //Pass Data
            itemVC.itemListDetail = itemList
            itemVC.selectedItem = indexPath.row
            itemVC.addButton = false
        }
        
    }


}
