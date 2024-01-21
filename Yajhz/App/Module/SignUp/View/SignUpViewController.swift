//
//  ViewController.swift
//  Yajhz
//
//  Created by Omar Salem on 07/01/2024.
//

import UIKit

class SignUpViewController: UIViewController,SignUpViewProtocol {
    
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var phoneNumberTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var confirmPasswordTxtField: UITextField!
    
    var signUpPresenter : SignUpPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpPresenter = SignUpPresenter(view: self)
        navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        
        if let name = nameTxtField.text, let email = emailTxtField.text, let phoneNumber = phoneNumberTxtField.text, let password = passwordTxtField.text, let confirmPassword = confirmPasswordTxtField.text{
            
            signUpPresenter.signUp(name: name, email: email, phone: phoneNumber, password: password, confirmPassword: confirmPassword)
            
        }
    }
    
    
    func navigateToHome() {
        performSegue(withIdentifier: K.SignUpToHomeIdentifier, sender: self)
    }
    
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: .none)
    }
    
    
    
    
    
    
    
    
    
    
}

