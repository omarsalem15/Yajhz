//
//  SignUpPresenter.swift
//  Yajhz
//
//  Created by Omar Salem on 20/01/2024.
//

import Foundation

class SignUpPresenter: SignUpPresenterProtocol {
    weak var view: SignUpViewProtocol?
    
    init(view: SignUpViewProtocol) {
        self.view = view
    }
    
    func signUp(name: String, email: String, phone: String, password: String, confirmPassword: String) {
        NetworkService.register(name: name, email: email, password: password, phone: phone) { result in
            switch result {
            case .success(let response):
                // Registration successful
                print("Registration successful. Response: \(response)")
                self.view?.navigateToHome()
            case .failure(let error):
                // Registration failed
                print("Registration failed. Error: \(error.localizedDescription)")
                self.view?.showAlert(message: "Registration failed. Please try again.")
            }
            
        }
    }
}
