//
//  ViewController.swift
//  ChoptDemo
//
//  Created by Kishor LD on 15/10/22.
//

import UIKit

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var emailTextFeild: UITextField!
    
    @IBOutlet weak var passwordTextFeild: UITextField!
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let email = emailTextFeild.text else{return}
        guard let password = passwordTextFeild.text else {return}
        let login = LoginRequestModel(email: email, password: password)
        LoginAPI.loginInstance.callLoginAPI(login: login){
            isSuccess , message in
            if isSuccess{
                
                self.ShowAlert(message: message)
            }else{
                self.ShowAlert(message: message)
            }
        }
        
      
    }
    func ShowAlert(message:String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        present(alert,animated: true,completion: nil)
    }
    
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToRegistration", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToRegistration"{
            let destinationVc = segue.destination as! RegistrationViewController
        }
    }

}

