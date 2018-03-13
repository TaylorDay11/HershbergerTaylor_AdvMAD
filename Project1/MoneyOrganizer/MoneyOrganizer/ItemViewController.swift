//
//  ItemViewController.swift
//  MoneyOrganizer
//
//  Created by Taylor Hershberger on 3/12/18.
//  Copyright © 2018 Taylor Hershberger. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController, UITextFieldDelegate {
    
    var selectedItem = 0
    var addButton = false
    
    var calcTotal = 0
    var calcPaid = 0
    
    var itemListDetail = [Item]()
    
    //User Input
    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var itemCost: UITextField!
    @IBOutlet weak var itemPaid: UISegmentedControl!
    
    //Tap on Button
    @IBAction func doneButton(_ sender: UIButton) {
            
        if(addButton){
            //add new item
            //new item name
            let newItemName = itemName.text! //gets textfield
            let newItem = Item() //create new item instance
            newItem.name = newItemName //set name with textfield
            //new item cost
            let newItemCost = itemCost.text!
            let intNewItemCost: Int? = Int(newItemCost)
            newItem.cost = intNewItemCost!
            //new item paid
            var Paid = false
            if(itemPaid.selectedSegmentIndex == 1){
                Paid = true
            }
            else{
                Paid = false
            }
            newItem.paid = Paid
            //append new item
            self.itemListDetail.append(newItem)
        }
        else{
            let editItemName = itemName.text!
            itemListDetail[selectedItem].name = editItemName
            let newItemCost = itemCost.text!
            let intNewItemCost: Int? = Int(newItemCost)
            itemListDetail[selectedItem].cost = intNewItemCost!
            var Paid = false
            if(itemPaid.selectedSegmentIndex == 1){
                Paid = true
            }
            else{
                Paid = false
            }
            itemListDetail[selectedItem].paid = Paid
        }
        
    }
    
    
    override func viewDidLoad() {
        itemName.delegate = self
        itemCost.delegate = self
        self.itemCost.keyboardType = UIKeyboardType.decimalPad
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if(addButton){
            
        }else{
            (itemName).text = itemListDetail[selectedItem].name
            let oldCost = String(itemListDetail[selectedItem].cost)
            (itemCost).text = oldCost
            if(itemListDetail[selectedItem].paid){
                itemPaid.selectedSegmentIndex = 1
            }
            else{
                itemPaid.selectedSegmentIndex = 0
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
            let tripVC = segue.destination as! TripViewController
            if(addButton){
                tripVC.itemList = itemListDetail
                tripVC.tableView.insertRows(at:[IndexPath.init(row: self.itemListDetail.count-1, section:0)], with: .automatic) //inserts new row at the end of the table
            }
            else{
                tripVC.itemList = itemListDetail
            }
        
        if (itemListDetail.count > 0){
            for i in 0...itemListDetail.count-1{
                calcTotal = calcTotal + itemListDetail[i].cost
                if (itemListDetail[i].paid){
                    calcPaid = calcPaid + itemListDetail[i].cost
                }
            }
        }
        
        
        tripVC.total.text = "$" + String(calcTotal)
        
        tripVC.paid.text = "$" + String(calcPaid)
        
        if (calcPaid != 0){
        let doublecalcPaid = Double(calcPaid)
        let doublecalcTotal = Double(calcTotal)
        var paidPercent = 0.0
        paidPercent = round((doublecalcPaid/doublecalcTotal)*100)
        
         print("percent")
        print(paidPercent)
            
        tripVC.percent.text = String(paidPercent) + "%"
    }
        else{
            tripVC.percent.text = "0%"
        }
    
        }
}
    
    


