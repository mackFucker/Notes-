//
//  SetUserName.swift
//  Messendev
//
//  Created by Иван Карплюк on 05.02.2023.
//

import UIKit

protocol SetUserNameViewInput: UIView {
    
}

protocol SetUserNameViewOutput: AnyObject {
    
}

final class SetUserNameViewImpl: UIView {
    
    //MARK: - CONSTRAINT BASE LAYOUT
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    //MARK: - DELEGATE
    
    weak var delegate: SetUserNameViewOutput!
    
    //MARK: - SCROLL VIEW + CONTENT VIEW
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.isScrollEnabled = true
        view.showsVerticalScrollIndicator = true
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - INTERFACE ELEMENTS
    
    //<--------------------------------LABELS------------------------------------->
    
    
    //<--------------------------------BUTTONS------------------------------------>
    
    
    //<--------------------------------TEXT-FIELDS-------------------------------->
    
   
    
    //MARK: - STACK VIEW's

    //MARK: - OBJC
 
    
    //MARK: - INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SETUP UI
    
    private func setupUI() {
        
        //Customize Label

        
        //Configure-Stack
 
        
        //Customize-Button's
 
        
        
        //Setup-Delegates

        
        //TAMIK's

        
        //addSubview
        
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
      
    }
    
    //MARK: - CONSTRAINTS
    
    private func setupConstraints() {
        
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        heightConstraint.priority = UILayoutPriority(250)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            heightConstraint,
            
          
        ])
    }
}

extension SetUserNameViewImpl: SetUserNameViewInput {
    
}
