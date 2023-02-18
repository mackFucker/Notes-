//
//  LoginView.swift
//  Messendev
//
//  Created by Иван Карплюк on 03.02.2023.
//

import UIKit

protocol LoginViewInput: UIView {
    func keyboardWillShow(keyboardFrame: CGRect)
    func keyboardWillHide(contentInset: UIEdgeInsets)
}

final class LoginViewImpl: UIView {
    
    //MARK: - DELEGATE
    
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
    
            //<--------------------------------LABELS-------------------------------->

    private lazy var logoImage = UIImageView(img: MessendevAsset.logo.image,
                                             contentMode: .scaleAspectFit)
    
    private lazy var orLabel = UILabel(text: "or",
                                       font: UIFont.rounded(ofSize: 20, weight: .bold),
                                       textColor: .mainGray)
    
    private lazy var emailLabel = UILabel(text: "Email",
                                          textColor: .mainGray)
    
    private lazy var passwordLabel = UILabel(text: "Password",
                                             textColor: .mainGray)
    
    private lazy var logoLabel = UILabel(text: "MessenDev",
                                         font: .rounded(ofSize: 36,weight: .bold),
                                         textColor: .black)
    
    private lazy var registrationLabel = UILabel(text: "Don't have an account?",
                                         font: .rounded(ofSize: 16,weight: .bold),
                                         textColor: .mainGray)
    
            //<--------------------------------BUTTONS-------------------------------->
    
    private lazy var appleButton = UIButton(background: .white,
                                             titleColor: .black,
                                             title: "Apple ID",
                                             font: UIFont.rounded(ofSize: 20, weight: .medium),
                                             cornerRadius: 5,
                                             isShadow: true,
                                             shadowColor: .gray,
                                             myView: self,
                                             touchType: .touchUpInside,
                                             selector: #selector(anotherWayRegButtonTap))
    
    private lazy var qrcodeButton = UIButton(background: .white,
                                             titleColor: .black,
                                             title: "QR-Code",
                                             font: UIFont.rounded(ofSize: 20, weight: .medium),
                                             cornerRadius: 5,
                                             isShadow: true,
                                             shadowColor: .gray,
                                             myView: self,
                                             touchType: .touchUpInside,
                                             selector: #selector(anotherWayRegButtonTap))
    
    private lazy var forgotPasswordButton = UIButton(background: .white,
                                                     titleColor: .activeRed,
                                                     title: "Forgot Password?",
                                                     font: UIFont.rounded(ofSize: 16, weight: .bold),
                                                     cornerRadius: 5,
                                                     isShadow: false,
                                                     shadowColor: .white,
                                                     myView: self,
                                                     touchType: .touchUpInside,
                                                     selector: #selector(forgotPasswordButtonTap))
    
    private lazy var loginButton = UIButton(background: .activeRed,
                                            titleColor: .white,
                                            title: "Log In",
                                            cornerRadius: 5,
                                            isShadow: true,
                                            shadowColor: .activeRed,
                                            myView: self,
                                            touchType: .touchUpInside,
                                            selector: #selector(loginButtonTap))
    
    private lazy var registerButton = UIButton(background: .white,
                                                   titleColor: .activeRed,
                                                   title: "Register now",
                                                   font: UIFont.rounded(ofSize: 16, weight: .bold),
                                                   cornerRadius: 5,
                                                   isShadow: false,
                                                   shadowColor: .white,
                                                   myView: self,
                                                   touchType: .touchUpInside,
                                                   selector: #selector(registerButtonTap))

            //<--------------------------------TEXT-FIELDS-------------------------------->
    
    private lazy var emailTextField = UnderLineTextField(returnKeyType: .next,
                                                         placeholderText: "",
                                                         tintcolor: .textField,
                                                         secureText: false)
    
    private lazy var passwordTextField = UnderLineTextField(returnKeyType: .done,
                                                            placeholderText: "",
                                                            tintcolor: .textField,
                                                            secureText: true)
    
    //MARK: - STACK VIEW's
    
    private lazy var topStack = UIStackView(arrangedSubviews:
                                                [logoImage,
                                                 logoLabel],
                                            axis: .vertical,
                                            spacing: 26)
    
    private lazy var buttonStack = UIStackView(arrangedSubviews:
                                                [appleButton,
                                                 qrcodeButton,
                                                 orLabel],
                                               axis: .vertical,
                                               spacing: 26)
    
    private lazy var textFieldStack = UIStackView(arrangedSubviews:
                                                    [emailLabel,
                                                     emailTextField,
                                                     passwordLabel,
                                                     passwordTextField],
                                                  axis: .vertical,
                                                  spacing: 14)
    
    private lazy var bottomStack = UIStackView(arrangedSubviews:
                                                [registrationLabel,
                                                 registerButton],
                                               axis: .horizontal,
                                               spacing: 4)
    //MARK: - OBJC
    
    @objc
    private func anotherWayRegButtonTap() {
//        delegate?.appleButtonTap()
    }
    
    @objc
    private func loginButtonTap() {
//        delegate?.loginButtonTap()
    }
    
    @objc
    private func forgotPasswordButtonTap() {
//        delegate?.forgotPasswordButtonTap()
    }
    
    @objc
    private func registerButtonTap() {
//        delegate?.registerButtonTap()
    }
    
   
    
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
        let text = "MessengDev"
        let range = (text as NSString).range(of: "Dev")
        let attributedString = NSMutableAttributedString(string:text)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.activeRed , range: range)
        logoLabel.attributedText = attributedString;
        
            //Configure-Stack
        topStack.alignment = .center
        buttonStack.alignment = .center
        
            //Customize-Button's
        appleButton.customizeButtonAddLeftImage(image: UIImage(named: "appleLogoBlack")!)
        qrcodeButton.customizeButtonAddLeftImage(image: UIImage(named: "qrcode")!)
        registerButton.contentHorizontalAlignment = .leading

        
            //Setup-Delegates
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
            //TAMIK's
        topStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        textFieldStack.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        bottomStack.translatesAutoresizingMaskIntoConstraints = false
        
            //addSubview
        
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(topStack)
        contentView.addSubview(buttonStack)
        contentView.addSubview(textFieldStack)
        contentView.addSubview(forgotPasswordButton)
        contentView.addSubview(loginButton)
        contentView.addSubview(bottomStack)
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
            
            topStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            topStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            topStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            logoImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            logoImage.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            
            buttonStack.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 20),
            buttonStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            buttonStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            appleButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            appleButton.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.120),

            qrcodeButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            qrcodeButton.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.120),

            textFieldStack.topAnchor.constraint(equalTo: buttonStack.bottomAnchor, constant: 20),
            textFieldStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textFieldStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: textFieldStack.bottomAnchor, constant: 15),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: textFieldStack.trailingAnchor),
            
            loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.120),
            
            bottomStack.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            bottomStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            bottomStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
}

extension LoginViewImpl: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            case emailTextField:
                passwordTextField.becomeFirstResponder()
            default:
                break
//                delegate?.loginButtonTap()
        }
        return true
    }
}

extension LoginViewImpl: LoginViewInput {

    func keyboardWillShow(keyboardFrame: CGRect) {
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 80
        scrollView.contentInset = contentInset
    }


    func keyboardWillHide(contentInset: UIEdgeInsets) {
        scrollView.contentInset = contentInset
    }
}
