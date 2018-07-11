//
//  NewEmployeeTableViewController.swift
//  ElmechOnSite
//
//  Created by Keelin Devenney on 11/07/2018.
//  Copyright © 2018 ElmechLtd. All rights reserved.
//

import UIKit
import MessageUI

class NewEmployeeTableViewController: UITableViewController, NewEmployeeTableViewCellDelegate, MFMailComposeViewControllerDelegate {

    var requiredFields = [String]()
    var fields = [String: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadRequiredFields()
        self.tableView.keyboardDismissMode = .interactive
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadRequiredFields() {
        requiredFields = ["Name", "Address", "Phone", "Email", "National Insurance Number", "Date of Birth", "CSCS Number", "Emergency Contact Name", "Emergency Contact Number", "Relationship", "Bank", "Account Name", "Account Number", "Sort Code"]
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requiredFields.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewEmployeeTableViewCell", for: indexPath) as! NewEmployeeTableViewCell
        cell.formTextField.placeholder = requiredFields[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    func textDidChangeIn(field: String?, value: String?) {
        if let newValue = value, let fieldName = field {
            fields.updateValue(newValue, forKey: fieldName)
        }
    }
    
    func nextFieldBecomesFocus(field: String?) {
        if let fieldValue = field {
            let fieldIndex = requiredFields.index(of: fieldValue)
            let newIndex = fieldIndex?.advanced(by: 1)
            let indexPath = IndexPath(row: newIndex!, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) as? NewEmployeeTableViewCell {
                cell.formTextField.becomeFirstResponder()
            }
            else {
                self.resignFirstResponder()
            }
        }
    }
    
    @IBAction func submitForm(_ sender: UIBarButtonItem) {
        if fields.count == requiredFields.count {
            self.sendEmail()
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Please fill out all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Click", style: .default, handler: nil))
            self.navigationController?.present(alert, animated: true, completion: nil)
        }
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["keelin21@live.ie"])
            if let employeeName = fields["Name"] {
                mail.setSubject("New employee form: \(employeeName)")
            }
            
            var mailBody = "<p>See below, New employee form</p>"
            for (key, value) in fields {
                mailBody += "<p>\(key): \(value)</p>"
            }

            mail.setMessageBody(mailBody, isHTML: true)
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
