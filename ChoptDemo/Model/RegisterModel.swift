//
//  RegisterModel.swift
//  ChoptDemo
//
//  Created by Kishor LD on 15/10/22.
//

import Foundation
struct ResgisterRequestModel: Encodable {
    let first_name: String
    let last_name: String
    let bornAt: String
    let email: String
    let phone: String
    let password: String
    enum Codingkeys: String, CodingKey {
//        case firstName = "first_name"
//        case lastName = "last_name"
        case bornAt = "born_at"
        case first_name
        case last_name
        case email, phone, password
    }
}
struct RegisterResponseModel: Codable {
    var success: Bool
    var code: Int
    var message: String?
//    var messages: Messages
    var data: DataModel?
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        success = try container.decode(Bool.self, forKey: .success)
        code = try container.decode(Int.self, forKey: .code)
        message = try? container.decode(String.self, forKey: .message)
        if !success {
            data = try? container.decode(DataModel.self, forKey: .data)
        }
    }
}
struct Messages: Codable {
    var placement: String
    var message: String
    var data: String?
}

struct DataModel: Codable {
    let firstName, lastName, email, phone: [String]?
    let password, bornAt: [String]?
    enum CoodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case bornAt = "born_at"
        case email, phone, password
    }
}
