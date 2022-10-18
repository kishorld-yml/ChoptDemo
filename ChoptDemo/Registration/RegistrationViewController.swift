//
//  RegistrationViewController.swift
//  ChoptDemo
//
//  Created by Kishor LD on 15/10/22.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        registerUIDesign()
//        emailTextFeild.delegate = self
//        passwordTextfeild.delegate = self
    }
    @IBAction func emailTextFeildEndsEdidting(_ sender: UITextField) {
        validateEmail()
    }
    @IBOutlet weak var backButton: UIButton!
    @IBAction func passwordFeildEndsEditing(_ sender: UITextField) {
        validatePassword()
    }
    @IBAction func dobTextFeildEndsEditing(_ sender: UITextField) {
        validateDOB()
    }
    @IBOutlet weak var registerErrorLabel: UILabel!
    @IBOutlet weak var createButton: UIButton!
    @IBAction func backButtonPtressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    @IBOutlet weak var passwordTextfeild: UITextField!
    @IBOutlet weak var dateOfBirthTextfeild: UITextField!
    @IBOutlet weak var phoneNoTextFeild: UITextField!
    @IBOutlet weak var firstnameTextFeild: UITextField!
    @IBOutlet weak var emailTextFeild: UITextField!
    @IBOutlet weak var lastNameTectFeild: UITextField!
    @IBOutlet weak var confirmPasswordFeild: UITextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var dobErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorlabel: UILabel!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBAction func createButtonPressed(_ sender: UIButton) {
        guard let email = emailTextFeild.text else {return}
        guard let firstName = firstnameTextFeild.text else {return}
        guard let lastName = lastNameTectFeild.text else { return}
        guard let phoneNumber = phoneNoTextFeild.text else {return}
        guard let DOB = dateOfBirthTextfeild.text else {return}
        guard let password = passwordTextfeild.text else {return}
        let register = ResgisterRequestModel(first_name: firstName, last_name: lastName, bornAt: DOB, email: email, phone: phoneNumber, password: password)
      
        RegistrationAPI.registrationInstance.calling1RegisterApi(register: register) { isSuccess, message in
            DispatchQueue.main.async { [weak self] in
                
                
                
                if isSuccess {
                    self?.showAlert(message: message)
                } else {
                    self?.emailErrorLabel.text = message
                    self?.passwordErrorlabel.text = message
                    self?.dobErrorLabel.text = message
                    
                    self?.showAlert(message: message)
                }
            }
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
extension RegistrationViewController {
    func registerUIDesign() {
        backButton.layer.cornerRadius = 10
        backButton.layer.masksToBounds = true
        
        createButton.layer.cornerRadius = 30
         createButton.layer.masksToBounds = true
        let myColor = UIColor.black
          emailTextFeild.layer.borderColor = myColor.cgColor
        emailTextFeild.layer.borderWidth = 1.0
      emailTextFeild.layer.cornerRadius = 15.0
     passwordTextfeild.layer.borderColor = myColor.cgColor
      passwordTextfeild.layer.borderWidth = 1.0
    passwordTextfeild.layer.cornerRadius = 15.0
        firstnameTextFeild.layer.borderColor = myColor.cgColor
      firstnameTextFeild.layer.borderWidth = 1.0
    firstnameTextFeild.layer.cornerRadius = 15.0
       lastNameTectFeild.layer.borderColor = myColor.cgColor
      lastNameTectFeild.layer.borderWidth = 1.0
    lastNameTectFeild.layer.cornerRadius = 15.0
        phoneNoTextFeild.layer.borderColor = myColor.cgColor
      phoneNoTextFeild.layer.borderWidth = 1.0
    phoneNoTextFeild.layer.cornerRadius = 15.0
        dateOfBirthTextfeild.layer.borderColor = myColor.cgColor
      dateOfBirthTextfeild.layer.borderWidth = 1.0
    dateOfBirthTextfeild.layer.cornerRadius = 15.0
        confirmPasswordFeild.layer.borderColor = myColor.cgColor
        confirmPasswordFeild.layer.borderWidth = 1.0
        confirmPasswordFeild.layer.cornerRadius = 15.0
    }
}
extension RegistrationViewController {
    func validateEmail() {
        let email = emailTextFeild.text
        if email!.isValidEmail() {
            emailErrorLabel.text = ""
        } else {
            emailErrorLabel.text = "invalid email format"
        }
    }
    func validatePassword() {
        let password = passwordTextfeild.text
        if password!.isValidPassword() {
            passwordErrorlabel.text = ""
        } else {
            passwordErrorlabel.text = "password must be min 8characters"
        }
    }
    func validateDOB() {
        let dob = dateOfBirthTextfeild.text
        if dob!.isValidDOB() {
            dobErrorLabel.text =  ""
        } else {
            dobErrorLabel.text = "Date format should be in YYYYY-MM-DD"
        }
    }
   

}
