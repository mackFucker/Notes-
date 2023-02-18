//
//  FillUserDataViewController.swift
//  Messendev
//
//  Created by Иван Карплюк on 03.02.2023.
//

import UIKit

protocol FillUserDataView: BaseView {
    
}

final class FillUserDataViewController<View:FillUserDataViewImpl>: BaseViewController<View>, FillUserDataView {
    
    //MARK: - LIFE CYCLE VIEW
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.delegate = self
        self.navigationController?.isNavigationBarHidden = true
    }

}

extension FillUserDataViewController: FillUserDataViewImplOutput {
    
}
