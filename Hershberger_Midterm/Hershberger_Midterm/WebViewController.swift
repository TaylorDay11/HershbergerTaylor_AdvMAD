//
//  WebViewController.swift
//  Hershberger_Midterm
//
//  Created by Taylor Hershberger on 3/15/18.
//  Copyright © 2018 Taylor Hershberger. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var restaurantListDetail = Restaurants()
    
    var selectedRestaurant = 0
    
    @IBOutlet weak var webSpinner: UIActivityIndicatorView!
    
    
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        configureView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadWebPage(_ urlString: String){
        let myurl = URL(string: urlString)
        
        let request = URLRequest(url: myurl!)
        
        webView.load(request)
    }
    
    func configureView(){
        loadWebPage(restaurantListDetail.restaurantURL[selectedRestaurant])
    
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!){
        webSpinner.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        webSpinner.stopAnimating()
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
