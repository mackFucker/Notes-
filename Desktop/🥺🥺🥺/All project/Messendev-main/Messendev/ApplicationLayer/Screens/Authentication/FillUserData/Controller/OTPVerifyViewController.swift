//
//  OTPVerifyViewController.swift
//  Messendev
//
//  Created by Иван Карплюк on 05.02.2023.
//

import UIKit

protocol OTPVerifyView: BaseView {
    
}

final class OTPVerifyViewController<View:OTPVerifyViewImpl>: BaseViewController<View>, OTPVerifyView {
    
    //MARK: - COORDINATOR
 
  
    
    //MARK: - LIFE CYCLE VIEW
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.isNavigationBarHidden = true
    }
}

    //MARK: - DELEGATE FROM VIEW

extension OTPVerifyViewController: OTPVerifyViewOutput {
    
}
