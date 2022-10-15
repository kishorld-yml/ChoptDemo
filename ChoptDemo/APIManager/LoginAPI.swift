//
//  LoginAPI.swift
//  ChoptDemo
//
//  Created by Kishor LD on 15/10/22.
//

import Foundation
import Alamofire

class LoginAPI{
    static let loginInstance = LoginAPI()
    
    
    func callLoginAPI(login:LoginRequestModel,completionHandler:@escaping (Bool,String)->()){
        
        let headers:HTTPHeaders = [.authorization(bearerToken: "eB85lVGzjUf0929F3Avp2mjm8pg01r")]
        AF.request(loginUrl,method:.post,parameters: login,encoder: .json,headers: headers).response{ response in
            
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!)
                    print(json)
                    if response.response?.statusCode == 200{
                        completionHandler(true,"user Loged In Successfully")
                    }else{
                        completionHandler(false,"Give correct Credentials")
                    }
                }catch{
                    print("error.localizedDescription")
                    completionHandler(false,"Give correct Credentials")
                }
            case .failure(let err):
                print("\(err.localizedDescription)Connection error")
                completionHandler(false,"Give correct Credentials")
            }
            
            
        }
        
    }
}
