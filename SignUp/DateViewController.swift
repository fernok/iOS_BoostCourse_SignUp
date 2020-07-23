//
//  DateViewController.swift
//  SignUp
//
//  Created by Hyuhng Min Kim on 2020/07/17.
//  Copyright © 2020 Hyuhng Min Kim. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var signInButton: UIButton!
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    @IBAction func datePickerValueDidChange(_ sender: UIDatePicker) {
        let date: Date = sender.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dateLabel.text = dateString
        if date >= Date() || phoneTextField.text?.isEmpty ?? true {
            signInButton.isEnabled = false
        }
        else {
            signInButton.isEnabled = true
        }
    }
    
    @IBAction func textFieldValueDidChange(_ sender: UITextField) {
        if datePicker.date >= Date() || sender.text?.isEmpty ?? true {
            signInButton.isEnabled = false
        }
        else {
            signInButton.isEnabled = true
        }
    }
    
    @IBAction func touchUpCancelButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func touchUpBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func touchUpSignInButton(_ sender: UIButton) {
        UserInformation.shared.phone = phoneTextField.text
        UserInformation.shared.dateOfBirth = datePicker.date
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInButton.isEnabled = false
        phoneTextField.text = nil
        datePicker.date = Date()
        let date: Date = Date()
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dateLabel.text = dateString

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
