//
//  LoginViewController.swift
//  Messendev
//
//  Created by Роман Анпилов on 03.02.2023.
//

import UIKit

protocol LoginView: BaseView {
    var onRegisterButtonTap: (() -> Void)? { get set }
    var onForgetPasswordButtonTap: (() -> Void)? { get set }
    var onCompleteAuth: (() -> Void)? { get set }
}

final class LoginViewController<View:LoginViewImpl>: BaseViewController<View>, LoginView {
    
    //MARK: - COORDINATOR
 
    var onRegisterButtonTap: (() -> Void)?
    
    var onForgetPasswordButtonTap: (() -> Void)?
    
    var onCompleteAuth: (() -> Void)?
    
    //MARK: - LIFE CYCLE VIEW
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        rootView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.isNavigationBarHidden = true
    }
}

    //MARK: - DELEGATE FROM VIEW

