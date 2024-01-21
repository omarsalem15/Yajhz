//
//  LogIn.swift
//  Yajhz
//
//  Created by Omar Salem on 19/01/2024.
//

import UIKit


class LoginViewController: UIViewController,LoginViewProtocol {
    
    
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    var presenter: LoginPresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(view: self)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func logInPressed(_ sender: UIButton) {
        
        
        if let email = emailTxtField.text, let password = passwordTxtField.text{
            presenter?.login(email: email, password: password)
        }
        
    }
    
    func navigateToHome() {
        self.performSegue(withIdentifier: K.LoginToHomeIdentifier , sender: self)
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: .none)
    }
}

