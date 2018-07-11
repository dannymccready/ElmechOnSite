//
//  CompanyWebPageViewController.swift
//  ElmechOnSite
//
//  Created by Keelin Devenney on 11/07/2018.
//  Copyright © 2018 ElmechLtd. All rights reserved.
//

import UIKit
import WebKit

class CompanyWebPageViewController: UIViewController, WKUIDelegate  {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpWebView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpWebView() {
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        view = webView
        webView.uiDelegate = self;
        
        let myURL = URL(string:"http://www.elmechltd.co.uk")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
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
