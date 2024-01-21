//
//  BaseCategories.swift
//  Yajhz
//
//  Created by Omar Salem on 18/01/2024.
//

import Foundation

struct BaseCategories : Codable {
    let success : Bool
    let response_code : Int
    let message : String
    let data : [BaseCategoriesData]
}

struct BaseCategoriesData : Codable {
    let id, active : Int
    let name, image, name_ar, name_en : String
}


