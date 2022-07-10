//
//  ViewController.swift
//  Bankey
//
//  Created by Rafael Benjamin on 10/07/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()        
    }
    
    
}

extension LoginViewController {
    private func style(){
        loginView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout(){
    }
}
