//
//  RegistrationAPI.swift
//  ChoptDemo
//
//  Created by Kishor LD on 15/10/22.
//

import Foundation
// import Alamofire




class RegistrationAPI {
    static let registrationInstance = RegistrationAPI()
    var emailErroer = ""
    func calling1RegisterApi(register: ResgisterRequestModel,completionHandler: @escaping (Bool,String) -> Void) {
        
        let url = URL(string: registerUrl)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer aQGJ0bm6EI4sI7MMQseHc083Tx81ep", forHTTPHeaderField: "Authorization")
        do {
            let requestBody = try JSONEncoder().encode(register)
            request.httpBody = requestBody
            URLSession.shared.dataTask(with: request) { data, httpresponse, error in
                if data != nil && data?.count != 0 {
                    let response = String(data: data!, encoding: .utf8)
                    debugPrint(response ?? "")
                    do {
                        let json = try JSONDecoder().decode(RegisterResponseModel.self, from: data!)
                        print(json)
                        //                     let json = try JSONSerialization.jsonObject(with: data!)
                        // print(json)
                        print(json.code)
                        if json.code == 422{
                            completionHandler(false,"User Exits")
                        }else if json.code == 200 {
                            completionHandler(true, "Registerd SuccessFully")
                        } else {
                            if let emailErrorMessage = json.data?.email?.first{
                                completionHandler(false, emailErrorMessage)
                            }
                            if let passowordErrorMessage = json.data?.password?.first{
                                completionHandler(false, passowordErrorMessage)
                            }
                            if let phoneErrorMessage = json.data?.phone?.first{
                                completionHandler(false, phoneErrorMessage)
                            }
                            completionHandler(false, "")
                            
                        }
                    } catch let error {
                        print(error.localizedDescription)
                        completionHandler(false, "Oops something went wrong")
                }
                }
            }.resume()
        } catch let error {
            completionHandler(false, "Oops something went wrong")
        }
    }
 
    //    func callRegisterAPI(register:ResgisterRequestModel
    //                         ,completionHandler:@escaping (Bool,String)->()){
    //
    //        let headers:HTTPHeaders = [.authorization(bearerToken: "eB85lVGzjUf0929F3Avp2mjm8pg01r")]
    //        AF.request(registerUrl,method:.post,parameters: register,encoder: .json,headers: headers).response { response in
    //            print(response)
    //            switch response.result{
    //            case .success(let data):
    //                do{
    //
    //                    let json = try JSONSerialization.jsonObject(with: data!)
    //                    print(json)
    //
    //                    let decodeJson = try JSONDecoder().decode(RegisterResponseModel.self,from: data!)
    //
    //                    print(RegisterResponseModel.self)
    //
    //                    if response.response?.statusCode == 200{
    //                        completionHandler(true,"User Registerd SuccessFully")
    //                    }else{
    //
    //
    //
    //
    //                        print(decodeJson.data.email?.first ?? "")
    //                        print(decodeJson.data.password?.first ?? "")
    //                        print(decodeJson.data.phone?.first ?? "")
    //                        print(decodeJson.data.firstName?.first ?? "")
    //                        print(decodeJson.data.lastName?.first ?? "")
    //                        print(decodeJson.code)
    //                       print(decodeJson.message)
    //                        completionHandler(false,"give correct credentials")
    //
    //
    //
    //
    //
    //
    //                    }
    //                }catch{
    //                    print(error.localizedDescription)
    //                    completionHandler(false,"Sorry Fill The Details Correctly")
    //                }
    //            case .failure(let err):
    //                print("\(err.localizedDescription)Connection error")
    //                completionHandler(false,"Sorry Fill The Details Correctly")
    //            }
    //
    //
    //        }
    //
    //    }
}
