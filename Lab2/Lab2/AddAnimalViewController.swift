//
//  AddAnimalViewController.swift
//  Lab2
//
//  Created by Taylor Hershberger on 2/27/18.
//  Copyright © 2018 Taylor Hershberger. All rights reserved.
//

import UIKit

class AddAnimalViewController: UIViewController {
    
    @IBOutlet weak var animalTextField: UITextField!
    
    var addedAnimal = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "doneSegue"{
            if ((animalTextField.text?.isEmpty) == false){
                addedAnimal = animalTextField.text!
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
