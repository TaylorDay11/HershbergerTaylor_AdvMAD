//
//  DetailViewController.swift
//  Lab2
//
//  Created by Taylor Hershberger on 2/27/18.
//  Copyright © 2018 Taylor Hershberger. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
    var searchController: UISearchController!
    
    @IBAction func unwindSegue (_ segue: UIStoryboardSegue){
        if segue.identifier == "doneSegue"{
            let source = segue.source as! AddAnimalViewController

            if((source.addedAnimal.isEmpty) == false){
                animaldetail.append(source.addedAnimal)
                tableView.reloadData()
                let chosenAnimal = animalListDetail.animals[selectedAnimal]

                animalListDetail.animalData[chosenAnimal]?.append(source.addedAnimal)
            }
        }
    }
    
    var animaldetail = [String]()
    var selectedAnimal = 0
    
    var animalListDetail = Animals()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let resultsController = SearchResultsController()
        
        resultsController.allwords = animaldetail
        
        searchController = UISearchController(searchResultsController: resultsController)
        
        searchController.searchBar.placeholder = "Enter a search term"
        
        searchController.searchBar.sizeToFit()
        
        tableView.tableHeaderView = searchController.searchBar

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        animalListDetail.animals = Array(animalListDetail.animalData.keys)
        let chosenAnimal = animalListDetail.animals[selectedAnimal]
        animaldetail = animalListDetail.animalData[chosenAnimal]! as [String]
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
        return animaldetail.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)

        cell.textLabel?.text = animaldetail[indexPath.row]

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
            
            animaldetail.remove(at: indexPath.row)
            let chosenAnimal = animalListDetail.animals[selectedAnimal]
            
            animalListDetail.animalData[chosenAnimal]?.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
        let fromRow = fromIndexPath.row
        let toRow = toIndexPath.row
        let moveAnimal = animaldetail[fromRow]
        
        animaldetail.remove(at: fromRow)
        animaldetail.insert(moveAnimal, at: toRow)
        
        let chosenAnimal = animalListDetail.animals[selectedAnimal]
        animalListDetail.animalData[chosenAnimal]?.remove(at: fromRow)
        animalListDetail.animalData[chosenAnimal]?.insert(moveAnimal, at: toRow)
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
