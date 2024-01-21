//
//  HomeCategories.swift
//  Yajhz
//
//  Created by Omar Salem on 18/01/2024.
//

import Foundation

struct HomeCategories: Codable {
    let success: Bool
    let response_code: Int
    let message:String
    let data: [HomeCategoriesData]
}

struct HomeCategoriesData : Codable {
    let data : [HomeData]
    let cart_count : Int
}

struct HomeData : Codable {
    let id, active : Int
    let name, image, name_ar, name_en : String
}
