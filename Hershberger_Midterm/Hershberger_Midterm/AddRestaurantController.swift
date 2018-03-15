//
//  AddRestaurantController.swift
//  Hershberger_Midterm
//
//  Created by Taylor Hershberger on 3/15/18.
//  Copyright © 2018 Taylor Hershberger. All rights reserved.
//

import UIKit

class AddRestaurantController: UIViewController {
    
    var doneButtonPressed = false
    
    var name = ""
    var url = ""
    
    
    @IBOutlet weak var newName: UITextField!
    @IBOutlet weak var newURL: UITextField!
    
    
    @IBAction func doneButton(_ sender: UIButton) {
        
        doneButtonPressed = true
        
       url = newURL.text!
        name = newName.text!
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(doneButtonPressed){
            let rVC = segue.destination as! RestaurantViewController
            
            rVC.restaurantList.restaurant.append(name)
            
            rVC.restaurantList.restaurantURL.append("https://" + url)
            
            rVC.tableView.insertRows(at:[IndexPath.init(row: rVC.restaurantList.restaurant.count-1, section:0)], with: .automatic) //inserts new row at the end of the table
        }
    
    }


}
