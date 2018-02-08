//
//  SecondViewController.swift
//  Lab1
//
//  Created by Taylor Hershberger on 2/7/18.
//  Copyright © 2018 Taylor Hershberger. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func yesButton(_ sender: UIButton) {
        
        if(UIApplication.shared.canOpenURL(URL(string: "youtube://")!)){
            UIApplication.shared.open(URL(string: "youtube://")!, options: [:], completionHandler: nil)
        }
        else{
            UIApplication.shared.open(URL(string:"https://www.youtube.com/watch?v=pCMyh48QWD8")!, options: [:], completionHandler: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

