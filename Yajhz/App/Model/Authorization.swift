//
//  File.swift
//  Yajhz
//
//  Created by Omar Salem on 10/01/2024.
//

import Foundation

struct AuthorizationResponse: Codable {
    let success: Bool
    let response_code: Int
    let message: String
    let data: UserData
}

struct UserData:Codable{
    let id, type, status: Int
    let name, email, phone, image, token: String
    let balance : String?
    
}


