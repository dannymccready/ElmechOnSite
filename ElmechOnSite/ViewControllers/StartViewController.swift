//
//  StartViewController.swift
//  ElmechOnSite
//
//  Created by Danny Mc Cready on 12/7/18.
//  Copyright © 2018 ElmechLtd. All rights reserved.
//

import Foundation
import UIKit

class StartViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSiteSelfie(_ sender: UIButton) {
        self.performSegue(withIdentifier: "onSiteSelfie", sender: nil)
    }
    
    @IBAction func elmechWebsite(_ sender: UIButton) {
        self.performSegue(withIdentifier: "elmechHomePage", sender: nil)
    }
    
    @IBAction func newEmployee(_ sender: UIButton) {
        self.performSegue(withIdentifier: "newEmployee", sender: nil)
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? UITabBarController {
            if segue.identifier == "onSiteSelfie" {
                destination.selectedIndex = 0
            }
            else if segue.identifier == "elmechHomePage" {
                destination.selectedIndex = 1
            }
            else if segue.identifier == "newEmployee" {
                destination.selectedIndex = 2
            }
        }
     }
    
}
