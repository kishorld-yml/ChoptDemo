//
//  RegistrationViewController.swift
//  ChoptDemo
//
//  Created by Kishor LD on 15/10/22.
//

import UIKit

class RegistrationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPtressed(_ sender: UIButton) {
        
        self.dismiss(animated: true)
        
    }
    
    
    
    
    
    @IBOutlet weak var passwordTextfeild: UITextField!
    @IBOutlet weak var dateOfBirthTextfeild: UITextField!
    
    @IBOutlet weak var phoneNoTextFeild: UITextField!
    
    @IBOutlet weak var firstnameTextFeild: UITextField!
    @IBOutlet weak var emailTextFeild: UITextField!
    
    @IBOutlet weak var lastNameTectFeild: UITextField!
    
    
    
    
    
    
    
    
    @IBAction func createButtonPressed(_ sender: UIButton) {
        
        guard let email = emailTextFeild.text else {return}
        guard let firstName = firstnameTextFeild.text else {return}
        guard let lastName = lastNameTectFeild.text else { return}
        guard let phoneNumber = phoneNoTextFeild.text else {return}
        guard let DOB = dateOfBirthTextfeild.text else {return}
        guard let password = passwordTextfeild.text else {return}
        
        let register = ResgisterRequestModel(first_name: firstName, last_name: lastName, born_at: DOB, email: email, phone: phoneNumber, password: password)
        RegistrationAPI.shareInstance.callRegisterAPI(register: register)
        
        
        
        
        
        
        
        
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
