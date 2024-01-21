//
//  NetworkService.swift
//  Yajhz
//
//  Created by Omar Salem on 10/01/2024.
//

import Foundation
import Alamofire

class NetworkService{
    
    //MARK: - API Endpoints
    
    enum APIEndpoint {
        static let baseURL = "https://yogahez.mountasher.online/api"
        
        case register
        case login
        case getClientProfile
        case getPopularSellers
        case getTrendingSellers
        case getHomeBaseCategories
        case baseCategories
        case addToCart
        case favorite
        
        var url: String {
            switch self {
            case.register:
                return "\(APIEndpoint.baseURL)/client-register"
            case .login:
                return "\(APIEndpoint.baseURL)/login"
            case .getClientProfile:
                return "\(APIEndpoint.baseURL)/client-profile"
            case .getPopularSellers:
                return "\(APIEndpoint.baseURL)/popular-sellers?lat=29.1931&lng=30.6421&filter=1"
            case .getTrendingSellers:
                return "\(APIEndpoint.baseURL)/trending-sellers?lat=29.1931&lng=30.6421&filter=1"
            case .getHomeBaseCategories:
                return "\(APIEndpoint.baseURL)/home-base-categories"
            case .baseCategories:
                return "\(APIEndpoint.baseURL)/base-categories"
            case .addToCart:
                return "\(APIEndpoint.baseURL)/add-to-cart"
            case .favorite:
                return "\(APIEndpoint.baseURL)/favorite"
                
            }
        }
    }
    
    
    // MARK: - Authentication
    
    static func login(email: String, password: String, completion: @escaping (Result<AuthorizationResponse, Error>) -> Void) {
        let url = "\(APIEndpoint.login.url)"
        let parameters: Parameters = [
            "email": email,
            "password": password
            
        ]
        
        AF.request(url, method: .post, parameters: parameters, headers: ["Accept": "application/json"])
            .responseDecodable { (response: DataResponse<AuthorizationResponse, AFError>) in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    static func getClientProfile(token: String, completion: @escaping (Result<String, Error>) -> Void) {
        let url = "\(APIEndpoint.getClientProfile.url)"
        
        AF.request(url, method: .get, headers: ["Accept": "application/json", "Authorization": "Bearer \(token)"])
            .responseString { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    static func register(name: String, email: String, password: String, phone: String, completion: @escaping (Result<AuthorizationResponse, Error>) -> Void) {
        let url = "\(APIEndpoint.register.url)"
        print("URL----------\(url)")
        let parameters: Parameters = [
            "name": name,
            "email": email,
            "password": password,
            "phone": phone
            
        ]
        
        AF.request(url, method: .post, parameters: parameters, headers: ["lang": "en"])
            .responseDecodable { (response: DataResponse<AuthorizationResponse, AFError>) in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    // MARK: - Home
    
//    static func getPopularSellers(completion: @escaping (Result<PopularRestaurantListResponse, Error>) -> Void) {
//        let url = "\(APIEndpoint.getPopularSellers.url)"
//        
//        AF.request(url, method: .get, headers: ["Accept": "application/json"])
//            .responseDecodable { (response: DataResponse<PopularRestaurantListResponse, AFError>) in
//                switch response.result {
//                case .success(let value):
//                    completion(.success(value))
//                case .failure(let error):
//                    print(error)
//                    completion(.failure(error))
//                }
//            }
//    }

    
    
    
    
    
    static func getTrendingSellers(completion: @escaping (Result<TrendingRestaurantResponse, Error>) -> Void) {
        let url = "\(APIEndpoint.getTrendingSellers.url)"

        
        AF.request(url, method: .get, headers: ["Accept": "application/json"])
            .responseDecodable { (response: DataResponse<TrendingRestaurantResponse, AFError>) in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    print("error from AF--------\(error)")
                    completion(.failure(error))
                }
            }
    }
   
    
//    static func getHomeBaseCategories(completion: @escaping (Result<[String: Any], Error>) -> Void) {
//        let url = "\(APIEndpoint.getHomeBaseCategories.url)"
//        
//        AF.request(url, method: .get, headers: ["Accept": "application/json"])
//            .responseJSON { response in
//                switch response.result {
//                case .success(let value):
//                    if let dictionary = value as? [String: Any] {
//                        completion(.success(dictionary))
//                    } else {
//                        let error = NSError(domain: "", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to convert response to dictionary"])
//                        completion(.failure(error))
//                    }
//                case .failure(let error):
//                    completion(.failure(error))
//                }
//            }
//    }

    
    
    static func getBaseCategories(completion: @escaping (Result<BaseCategories, Error>) -> Void) {
        let url = "\(APIEndpoint.baseCategories.url)"
        
        AF.request(url, method: .get, headers: ["Accept": "application/json",])
            .responseDecodable { (response: DataResponse<BaseCategories, AFError>) in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    
//    // MARK: - Cart
//    
//    static func addToCart(token: String, completion: @escaping (Result<AddToCart, Error>) -> Void) {
//        let url = "\(APIEndpoint.addToCart.url)"
//        let parameters: Parameters = [
//            "product_id": 1,
//            "quantity": 2,
//            "product_name": "زهره الياسمين",
//            "extras": [
//                ["product_extra_id": 1],
//                ["product_extra_id": 2]
//            ]
//        ]
//        
//        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: ["Accept": "application/json", "Authorization": "Bearer \(token)"])
//            .responseDecodable { (response: DataResponse<AddToCart, AFError>) in
//                switch response.result {
//                case .success(let value):
//                    completion(.success(value))
//                case .failure(let error):
//                    completion(.failure(error))
//                }
//            }
//    }
//    
//    
//    // MARK: - Favorite
//    
//    static func addToFavorite(token: String, userId: Int, completion: @escaping (Result<String, Error>) -> Void) {
//        let url = "\(APIEndpoint.favorite.url)"
//        let parameters: Parameters = ["user_id": userId]
//        
//        AF.request(url, method: .post, parameters: parameters, headers: ["Accept": "application/json", "Authorization": "Bearer \(token)"])
//            .responseString { response in
//                switch response.result {
//                case .success(let value):
//                    completion(.success(value))
//                case .failure(let error):
//                    completion(.failure(error))
//                }
//            }
//    }
    
}





