//
//  RegisterModel.swift
//  ChoptDemo
//
//  Created by Kishor LD on 15/10/22.
//

import Foundation
struct ResgisterRequestModel:Encodable{
    let first_name:String
    let last_name:String
    let born_at:String
    let email:String
    let phone:String
    let password:String
}
