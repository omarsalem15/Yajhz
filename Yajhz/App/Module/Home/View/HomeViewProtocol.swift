//
//  HomeViewProtocol.swift
//  Yajhz
//
//  Created by Omar Salem on 21/01/2024.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    func updateBaseCategories(_ baseCategories: [BaseCategoriesData])
    func updateTrendingSellers(_ trendingSellers: [TrendingRestaurantData])
    //    func updatePopularSellers(_ popularSellers: [PopularRestaurantListData])
}
