//
//  LoginAPI.swift
//  ChoptDemo
//
//  Created by Kishor LD on 15/10/22.
//

import Foundation
// import Alamofire

class LoginAPI {
    static let loginInstance = LoginAPI()
//
//    func callLoginAPI(login:LoginRequestModel,completionHandler:@escaping (Bool,String)->()){
//
//        let headers:HTTPHeaders = [.authorization(bearerToken: "eB85lVGzjUf0929F3Avp2mjm8pg01r")]
//        AF.request(loginUrl,method:.post,parameters: login,encoder: .json,headers: headers).response{ response in
//            var SigInError = ""
//            switch response.result{
//            case .success(let data):
//                do{
//                    let json = try JSONSerialization.jsonObject(with: data!)
//                  print(json)
//                    let decodeJson = try JSONDecoder().decode(SignInResponseModel.self,from: data!)
//                    if response.response?.statusCode == 200{
//                        completionHandler(true,"user Loged In Successfully")
//                    }else{
//
//
//
//
//
//
//                        print(decodeJson.message)
//                        print(decodeJson.data.email?.first ?? "")
//                        SigInError = decodeJson.message
//                        completionHandler(false,decodeJson.message)
//                    }
//                }catch{
//                    print(error.localizedDescription)
//                    completionHandler(false,SigInError)
//                }
//            case .failure(let err):
//                print("\(err.localizedDescription)Connection error")
//                completionHandler(false,"Give correct Credentials")
//            }
//
//
//        }
//
//    }
    func newCallLoginAPI(login: LoginRequestModel, completionHandler: @escaping (Bool, String) -> Void) {

        var requestError = " "
        let url = URL(string: loginUrl)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer aQGJ0bm6EI4sI7MMQseHc083Tx81ep", forHTTPHeaderField: "Authorization")
        do {
            let requestBody = try JSONEncoder().encode(login)
            request.httpBody = requestBody
            // request.addValue("application/json", forHTTPHeaderField: "content-type")
            URLSession.shared.dataTask(with: request) { data, httpresponse, error in
                if data != nil && data?.count != 0 {
                    let response = String(data: data!, encoding: .utf8)
                    debugPrint(response ?? "")
                    do {
                       let json = try JSONDecoder().decode(LoginResponseModel.self, from: data!)
                        print(json)
//                     let json = try JSONSerialization.jsonObject(with: data!)
                           // print(json)
                        print(json.code)
                        if json.code == 200 {
                            completionHandler(true, "logged in  ")
                        } else {
                            completionHandler(false, json.message ?? "Invalid Userame or Password")
                        }
                    } catch let error {
                        print(error.localizedDescription)
                        completionHandler(false, "Invalid Userame or Password")
                    }

                }
            }.resume()
        } catch let error {
            debugPrint(error)
        }
    }
}
