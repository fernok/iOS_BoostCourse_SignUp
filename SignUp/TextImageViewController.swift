//
//  TextImageViewController.swift
//  SignUp
//
//  Created by Hyuhng Min Kim on 2020/07/17.
//  Copyright © 2020 Hyuhng Min Kim. All rights reserved.
//

import UIKit

class TextImageViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordCheckTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        return picker
    }()
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    // MARK:- Image Picker
    @IBAction func touchUpSelectImageButton(_ sender: UITapGestureRecognizer) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let chosenImage: UIImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.imageView.image = chosenImage
        } else if let chosenImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = chosenImage
        }
        
        picker.dismiss(animated: true, completion: nil)
        
        self.view.endEditing(true)
        if nextButtonCanBeEnabled() {
            nextButton.isEnabled = true
        }
        else {
            nextButton.isEnabled = false
        }
    }
    
    // MARK:- Enable/Disable Button
    func nextButtonCanBeEnabled() -> Bool {
        if idTextField.text?.isEmpty ?? true || passwordTextField.text?.isEmpty ?? true || passwordCheckTextField.text?.isEmpty ?? true || textView.text?.isEmpty ?? true || imageView.image == nil{
            return false
        } // need empty image condition
        else if passwordCheckTextField.text! != passwordTextField.text! {
            return false
        }
        else {
            return true
        }
    }
    
    @IBAction func didTextFieldValueChanged(_ sender: UITextField) {
        if nextButtonCanBeEnabled() {
            nextButton.isEnabled = true
        }
        else {
            nextButton.isEnabled = false
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if nextButtonCanBeEnabled() {
            nextButton.isEnabled = true
        }
        else {
            nextButton.isEnabled = false
        }
    }
    
    // MARK:- Button
    @IBAction func touchUpNextButton(_ sender: UIButton) {
        UserInformation.shared.id = idTextField.text!
        UserInformation.shared.password = passwordTextField.text!
        UserInformation.shared.explanation = textView.text!
        
    }
    
    @IBAction func touchUpCancelButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textView.delegate = self
        nextButton.isEnabled = false
        
        idTextField.text = nil
        passwordTextField.text = nil
        passwordCheckTextField.text = nil
        textView.text = nil
        imageView.image = nil
        
        let imageViewTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.touchUpSelectImageButton(_:)))
        imageView.isUserInteractionEnabled = true
        self.imageView.addGestureRecognizer(imageViewTapGesture)
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
