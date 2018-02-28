//
//  ViewController.swift
//  Lab2
//
//  Created by Taylor Hershberger on 2/27/18.
//  Copyright © 2018 Taylor Hershberger. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var animalList = Animals()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //URL for plist
        if let pathURL = Bundle.main.url(forResource: "animals", withExtension: "plist"){
            let plistdecoder = PropertyListDecoder()
            do{
                let data = try Data(contentsOf: pathURL)
                //decodes the property list
                animalList.animalData = try plistdecoder.decode([String: [String]].self, from: data)
                animalList.animals = Array(animalList.animalData.keys)
            } catch{
                //handle error
                print(error)
            }
        }
        
        //enables large titles
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "animalsegue"{
            let detailVC = segue.destination as! DetailViewController
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
            
            //sets the data for the destination controller
            detailVC.title = animalList.animals[indexPath.row]
            detailVC.animalListDetail = animalList
            detailVC.selectedAnimal = indexPath.row
        }
    }
    
    //number of rows in the section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return animalList.animals.count
    }
    
    //Displays table view cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //configure
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        cell.textLabel?.text = animalList.animals[indexPath.row]
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

