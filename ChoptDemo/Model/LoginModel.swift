//
//  LogiModel.swift
//  ChoptDemo
//
//  Created by Kishor LD on 15/10/22.
//

import Foundation
import UIKit

struct LoginRequestModel: Encodable {
    let email: String
    let password: String
}
struct LoginResponseModel: Codable {
    var success: Bool
    var code: Int
    var message: String?
    var data: SignInDataModel
}

struct SignInDataModel: Codable {
    let  email: String?
//    let password: [String]?
    enum CoodingKeys: String, CodingKey {
        case email
    }
}
