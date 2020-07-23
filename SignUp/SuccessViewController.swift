//
//  SuccessViewController.swift
//  SignUp
//
//  Created by Hyuhng Min Kim on 2020/07/17.
//  Copyright © 2020 Hyuhng Min Kim. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {
    @IBOutlet var returnButton: UIButton!
    @IBOutlet var idLabel: UILabel!
    
    @IBAction func touchUpReturnButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
