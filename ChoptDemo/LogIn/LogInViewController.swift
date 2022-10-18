//
//  ViewController.swift
//  ChoptDemo
//
//  Created by Kishor LD on 15/10/22.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        UIDesign()
        emailTextFeild.delegate = self
    }
    @IBOutlet weak var signInErrorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextFeild: UITextField!
    @IBOutlet weak var passwordTextFeild: UITextField!
    @IBOutlet weak var emailValidateLabel: UILabel!
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let email = emailTextFeild.text else { return}
        guard let password = passwordTextFeild.text else {return}
        let login = LoginRequestModel(email: email, password: password)
        LoginAPI.loginInstance.newCallLoginAPI(login: login) { isSuccess, message in
            DispatchQueue.main.async {
                if isSuccess {
                    self.showAlert(message: "Successfully LoggedI")
                } else {
                    self.signInErrorLabel.text = message
                }
            }
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        let email = emailTextFeild.text
        if email!.isValidEmail() {
            emailValidateLabel.text = ""
        } else {
            emailValidateLabel.text = "invalid email format"
        }
    }
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToRegistration", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToRegistration"{
            //            let destinationVc = segue.destination as! RegistrationViewController
        }
    }
}
extension LogInViewController {
    func UIDesign() {
        loginButton.layer.cornerRadius = 30
        loginButton.layer.masksToBounds = true
        let myColor = UIColor.black
        emailTextFeild.layer.borderColor = myColor.cgColor
        emailTextFeild.layer.borderWidth = 1.0
        emailTextFeild.layer.cornerRadius = 15.0
        passwordTextFeild.layer.borderWidth = 1.0
        passwordTextFeild.layer.cornerRadius = 15.0
        passwordTextFeild.layer.borderColor = myColor.cgColor
    }
}
