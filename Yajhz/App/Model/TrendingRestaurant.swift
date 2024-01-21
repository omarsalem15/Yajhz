//
//  TrendingRestaurant.swift
//  Yajhz
//
//  Created by Omar Salem on 21/01/2024.
//

import Foundation

struct TrendingRestaurantResponse: Codable {
    let success: Bool
    let response_code: Int
    let message: String
    let data: [TrendingRestaurantData]
}

struct TrendingRestaurantData: Codable {
    let id: Int
    let name: String
    let email: String
    let phone: String
    let image: String
    let logo: String
    let description: String?
    let distance: String
    let type: Int
    let status: Int
    let lat: String?
    let lng: String?
    let address: String?
    let appointments: String?
    let trending: Int
    let popular: Int
    let rate: String
    let is_favorite: Bool
//    let categories: [Category]
    let token: String
//    let information: TrendingInformation
//    let product_categories: [TrendingCategory]
}

//struct TrendingCategory: Codable {
//    let id: Int
//    let name: String
//    let image: String
//    let active: Int
//}
//
//struct TrendingInformation: Codable {
//    let id: Int
//    let identity_number: String
//    let tax_record: String
//    let activity: String?
//    let nationality: String
//    let vehicle_image: String
//    let vehicle_tablet_image: String
//    let vehicle_registration: String
//    let driving_image: String
//}
//
//struct TrendingProductCategory: Codable {
//    let id: Int
//    let name: String
//    let active: Int
//    let name_ar: String
//    let name_en: String
//}
