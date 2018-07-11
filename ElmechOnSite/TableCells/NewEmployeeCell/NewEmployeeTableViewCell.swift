//
//  NewEmployeeTableViewCell.swift
//  ElmechOnSite
//
//  Created by Keelin Devenney on 11/07/2018.
//  Copyright © 2018 ElmechLtd. All rights reserved.
//

import UIKit

protocol NewEmployeeTableViewCellDelegate {
    func textDidChangeIn(field:String?, value:String?)
    func nextFieldBecomesFocus(field:String?)
}

class NewEmployeeTableViewCell: UITableViewCell, UITextFieldDelegate {

    override func awakeFromNib() {
        super.awakeFromNib()
        formTextField.delegate = self
        formTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBOutlet weak var formTextField: UITextField!
    var delegate: NewEmployeeTableViewCellDelegate?
    
    @objc func textFieldDidChange(textField: UITextField){
        delegate?.textDidChangeIn(field: formTextField.placeholder, value: formTextField.text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.nextFieldBecomesFocus(field: formTextField.placeholder)
        return true
    }
    

}
