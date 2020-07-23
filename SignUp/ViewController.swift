//
//  ViewController.swift
//  SignUp
//
//  Created by Hyuhng Min Kim on 2020/07/13.
//  Copyright © 2020 Hyuhng Min Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func touchUpSignInButton(_ sender: UIButton) {
        //self.navigationController?.pushViewController(SuccessViewController(), animated: true)
        if idTextField.text?.isEmpty ?? true || passwordTextField.text?.isEmpty ?? true || UserInformation.shared.id == nil || UserInformation.shared.password == nil {
            return
        }
        else if idTextField.text == UserInformation.shared.id && passwordTextField.text == UserInformation.shared.password {
            self.navigationController?.pushViewController(SuccessViewController(), animated: true)
        }
        else {
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
        
        self.view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        idTextField.text = UserInformation.shared.id ?? nil
        passwordTextField.text = nil
        
        self.view.endEditing(true)
    }
}
