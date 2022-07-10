//
//  LoginView.swift
//  Bankey
//
//  Created by Rafael Benjamin on 10/07/22.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LoginView {
    
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
    }
}
