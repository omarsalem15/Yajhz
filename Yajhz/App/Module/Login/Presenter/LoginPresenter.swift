//
//  LoginPresenter.swift
//  Yajhz
//
//  Created by Omar Salem on 21/01/2024.
//

import Foundation

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    weak var view: LoginViewProtocol?
    
    init(view: LoginViewProtocol) {
        self.view = view
    }
    
    func login(email: String, password: String) {
        NetworkService.login(email: email, password: password) { result in
            switch result {
            case .success(let response):
                UserDefaults.standard.setValue(response.data.token, forKey: "LoggedInUser")
                print("Login successful. Response: \(response.message)")
                self.view?.navigateToHome()
                
            case .failure(let error):
                print("Login failed. Error: \(error.localizedDescription)")
                self.view?.showAlert(message: "Login failed. Please try again.")
            }
        }
    }
}
