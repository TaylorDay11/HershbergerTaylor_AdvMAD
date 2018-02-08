//
//  FirstViewController.swift
//  Lab1
//
//  Created by Taylor Hershberger on 2/7/18.
//  Copyright © 2018 Taylor Hershberger. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let animalComponent = 0
    
    var animals = [String]()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return animals.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return animals[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        choiceLabel.text = "Your favorite barn animal is a \(animals[row])."
    }
    
    @IBOutlet weak var choiceLabel: UILabel!
    
    @IBOutlet weak var animalPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let pathURL = Bundle.main.url(forResource: "animals", withExtension: "plist"){
            let plistdecoder = PropertyListDecoder()
            do{
                let data = try Data(contentsOf: pathURL)
                
                animals = try plistdecoder.decode([String].self, from: data)
            } catch{
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

