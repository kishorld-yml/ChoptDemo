//
//  RegistrationAPI.swift
//  ChoptDemo
//
//  Created by Kishor LD on 15/10/22.
//

import Foundation
import Alamofire
class RegistrationAPI{
    static let registrationInstance = RegistrationAPI()
    
    
    func callRegisterAPI(register:ResgisterRequestModel
                         ,completionHandler:@escaping (Bool,String)->()){
        
        let headers:HTTPHeaders = [.authorization(bearerToken: "eB85lVGzjUf0929F3Avp2mjm8pg01r")]
        AF.request(registerUrl,method:.post,parameters: register,encoder: .json,headers: headers).response{ response in
            
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!)
                    print(json)
                    if response.response?.statusCode == 200{
                        completionHandler(true,"User Registerd Successfully")
                    }else{
                        completionHandler(false,"Sorry Fill The Details Correctly")
                    }
                }catch{
                    print("error.localizedDescription")
                    completionHandler(false,"Sorry Fill The Details Correctly")
                }
            case .failure(let err):
                print("\(err.localizedDescription)Connection error")
                completionHandler(false,"Sorry Fill The Details Correctly")
            }
            
            
        }
        
    }
}
