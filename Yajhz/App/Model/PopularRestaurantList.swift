//
//  Home.swift
//  Yajhz
//
//  Created by Omar Salem on 18/01/2024.
//



import Foundation

struct PopularRestaurantListResponse: Codable {
    let success: Bool
    let response_code: Int
    let message: String
    let data: PopularRestaurantListData
}

struct PopularRestaurantListData: Codable {
       let id: Int
       let name: String
       let email: String
       let phone: String
       let image: String
       let logo: String
       let description: String?
       let distance: String?
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
//       let categories: [SellerCategory]
       let token: String?
//       let information: SellerInformation
//       let product_categories: [ProductCategory]
   }
//}
//
//struct Category: Codable {
//    let id: Int
//    let name, image: String
//    let active: Int
//}
//
//struct Information: Codable {
//    let id: Int
//    let identity_number, tax_record, activity, nationality: String?
//    let vehicle_image, vehicle_tablet_image, vehicle_registration, driving_image: String
//}
//
//struct ProductCategory: Codable {
//    let id: Int
//    let name: String
//    let active: Int
//    let name_ar, name_en: String?
//}
//
//struct Pagination: Codable {
//    let total, count, per_page, current_page: Int
//    let total_pages: Int
//    let is_pagination: Bool
//}
