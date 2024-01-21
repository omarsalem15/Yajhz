//
//  AddToCart.swift
//  Yajhz
//
//  Created by Omar Salem on 18/01/2024.
//

import Foundation

struct AddToCart : Codable {
    let product_id : Int
    let quantity : Int
    let product_name : String
    let extras : [Extras]
}

struct Extras : Codable {
    let product_extra_id : Int
}
