//
//  RegistrationAPI.swift
//  ChoptDemo
//
//  Created by Kishor LD on 15/10/22.
//

import Foundation
import Alamofire
class RegistrationAPI{
    static let shareInstance = RegistrationAPI()
    
    
    func callRegisterAPI(register:ResgisterRequestModel){
        
        let headers:HTTPHeaders = [.authorization(bearerToken: "eB85lVGzjUf0929F3Avp2mjm8pg01r")]
        AF.request(registerUrl,method:.post,parameters: register,encoder: .json,headers: headers).response{ response in
            debugPrint(response)
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!)
                    print(json)
                }catch{
                    print(error.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
            
            
        }
        
    }
}
