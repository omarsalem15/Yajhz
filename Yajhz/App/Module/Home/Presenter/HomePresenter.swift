//
//  HomePresenter.swift
//  Yajhz
//
//  Created by Omar Salem on 21/01/2024.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    weak var view: HomeViewProtocol?
    
    init(view: HomeViewProtocol) {
        self.view = view
    }
    
    func getBaseCategories() {
        NetworkService.getBaseCategories { result in
            switch result {
            case .success(let response):
                self.view?.updateBaseCategories(response.data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getTrendingSellers() {
        NetworkService.getTrendingSellers { result in
            switch result {
            case .success(let response):
                self.view?.updateTrendingSellers(response.data)
            case .failure(let error):
                print("HomePresenter getTrendingSellers error: \(error.localizedDescription)")
            }
        }
    }
    
    //    func getPopularSellers() {
    //        NetworkService.getPopularSellers { result in
    //            switch result {
    //            case .success(let response):
    ////                self.view?.updatePopularSellers(response.data)
    //            case .failure(let error):
    //                print("HomePresenter getPopularSellers error: \(error.localizedDescription)")
    //            }
    //        }
    //    }
}
