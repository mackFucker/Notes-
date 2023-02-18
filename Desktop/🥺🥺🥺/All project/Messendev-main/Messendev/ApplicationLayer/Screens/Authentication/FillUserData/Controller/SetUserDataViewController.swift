//
//  SetUserDataViewController.swift
//  Messendev
//
//  Created by Иван Карплюк on 05.02.2023.
//

import UIKit

protocol SetUserNameView: BaseView {
    
}

final class SetUserNameViewController<View:SetUserNameViewImpl>: BaseViewController<View>, SetUserNameView {
    
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

extension SetUserNameViewController: SetUserNameViewOutput {
    
}
