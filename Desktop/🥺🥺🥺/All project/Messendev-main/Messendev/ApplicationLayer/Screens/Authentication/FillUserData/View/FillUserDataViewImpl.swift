//
//  FillUserDataView.swift
//  Messendev
//
//  Created by Иван Карплюк on 03.02.2023.
//

import UIKit

protocol FillUserDataViewInput: UIView {

}

protocol FillUserDataViewImplOutput: AnyObject {
    
}

final class FillUserDataViewImpl: UIView {
    
    //MARK: - CONSTRAINT BASE LAYOUT
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    //MARK: - DELEGATE
    
    weak var delegate: FillUserDataViewImplOutput!
    
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
    
    private lazy var topLabel = UILabel(text: "Continue with your Email Address and Phone Number",
                                        font: UIFont.rounded(ofSize: 36, weight: .bold) ,
                                        textColor: .black)
    
    private lazy var secondTopLabel =  UILabel(text: "Please, Enter your current Email Address, Phone Number and Name in the fields below",
                                               textColor: .mainGray)
    
    private lazy var emailLabel = UILabel(text: "Email",
                                          textColor: .mainGray)
    
    private lazy var passwordLabel = UILabel(text: "Password",
                                             textColor: .mainGray)
    
    private lazy var phoneLabel = UILabel(text: "Phone",
                                          textColor: .mainGray)
    
    private lazy var privacyPolicyLabel = UILabel(text: "By registering you agree to",
                                                  font: UIFont.rounded(ofSize: 16, weight: .bold),
                                                  textColor: .mainGray)
    
    //<--------------------------------BUTTONS-------------------------------->
    
    private lazy var nextPhaseButton = RoundedButton(img: UIImage(systemName: "arrowshape.turn.up.right")!,
                                                     backgroundColor: .inactiveRed,
                                                     tintColor: .white,
                                                     isShadow: true,
                                                     shadowColor: .inactiveRed,
                                                     myView: self,
                                                     touchType: .touchUpInside,
                                                     selector: #selector(nextPhaseButtonTapped))
    
    private lazy var privacyPoliticButton = UIButton(background: .white,
                                                     titleColor: .activeRed,
                                                     title: "Privacy Politic",
                                                     font: UIFont.rounded(ofSize: 16, weight: .bold),
                                                     cornerRadius: 5,
                                                     isShadow: false,
                                                     shadowColor: .activeRed,
                                                     myView: self,
                                                     touchType: .touchUpInside,
                                                     selector: #selector(privacyPoliticButtonTapped))
    
    
    //<--------------------------------TEXT-FIELDS-------------------------------->e
    
    private lazy var emailTextField = UnderLineTextField(returnKeyType: .next,
                                                         placeholderText: "mymail@mail.com",
                                                         tintcolor: .textField,
                                                         secureText: false)
    
    private lazy var passwordTextField = UnderLineTextField(returnKeyType: .next,
                                                            placeholderText: "qwerty",
                                                            tintcolor: .textField,
                                                            secureText: true)
    
    private lazy var phoneTextField = UnderLineTextField(returnKeyType: .continue,
                                                         placeholderText: "(XXX) XXX-XX-XX",
                                                         tintcolor: .textField,
                                                         secureText: false)
    
    
    //MARK: - STACK VIEW's
    
    private lazy var textFieldStack = UIStackView(arrangedSubviews:
                                                    [emailLabel,
                                                     emailTextField,
                                                     passwordLabel,
                                                     passwordTextField,
                                                     phoneLabel,
                                                     phoneTextField],
                                                  axis: .vertical,
                                                  spacing: 14)
    
    private lazy var privacyPoliticStack = UIStackView(arrangedSubviews:
                                                        [privacyPolicyLabel,
                                                         privacyPoliticButton],
                                                       axis: .horizontal,
                                                       spacing: 4)
    
    
    //MARK: - OBJC
    
    @objc
    private func nextPhaseButtonTapped() {
        
    }
    
    @objc
    private func privacyPoliticButtonTapped() {
        
    }
    
    @objc
    private func сheckForEmptyFields() {
        
        guard Validators().isFilled(email: emailTextField.text, password: passwordTextField.text, phone: phoneTextField.text) else {
            Log.error("not filled")
            return
        }
        
        guard Validators().isSimpleEmail(email: emailTextField.text!) else {
            Log.error("invalid email")
            return
        }

        guard Validators().isValidPassword(password: passwordTextField.text!) else {
            Log.error("invalid password")
            return
        }
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3) { [weak self] in
                guard let self else { return }
                self.nextPhaseButton.backgroundColor = .activeRed
                self.nextPhaseButton.layer.shadowColor = UIColor.activeRed.cgColor
            }
        }
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
        
        //Text-Fields-Targets
        phoneTextField.addTarget(self,
                                 action: #selector(сheckForEmptyFields),
                                 for: .editingDidEnd)
        
        phoneTextField.keyboardType = .phonePad
        
        //Customize Label
        topLabel.numberOfLines = 3
        secondTopLabel.numberOfLines = 3
        
        //Customize-Button's
        privacyPoliticButton.contentHorizontalAlignment = .leading
        
        //Setup-Delegates
        emailTextField.delegate = self
        passwordTextField.delegate = self
        phoneTextField.delegate = self
        
        //TAMIK's
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        secondTopLabel.translatesAutoresizingMaskIntoConstraints = false
        textFieldStack.translatesAutoresizingMaskIntoConstraints = false
        privacyPoliticStack.translatesAutoresizingMaskIntoConstraints = false
        nextPhaseButton.translatesAutoresizingMaskIntoConstraints = false
        
        //addSubview
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(topLabel)
        contentView.addSubview(secondTopLabel)
        contentView.addSubview(textFieldStack)
        contentView.addSubview(privacyPoliticStack)
        contentView.addSubview(nextPhaseButton)
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
            
            topLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 55),
            topLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            topLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            
            secondTopLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 20),
            secondTopLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            secondTopLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            
            textFieldStack.topAnchor.constraint(equalTo: secondTopLabel.bottomAnchor, constant: 15),
            textFieldStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textFieldStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            privacyPoliticStack.topAnchor.constraint(equalTo: textFieldStack.bottomAnchor, constant: 30),
            privacyPoliticStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            nextPhaseButton.topAnchor.constraint(equalTo: privacyPoliticStack.bottomAnchor, constant: 50),
            nextPhaseButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            nextPhaseButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            
            nextPhaseButton.widthAnchor.constraint(equalToConstant: 50),
            nextPhaseButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

extension FillUserDataViewImpl: UITextFieldDelegate {
    
    //MARK: - RETURN KEY CONFIGURE
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            phoneTextField.becomeFirstResponder()
        default:
            nextPhaseButtonTapped()
        }
        return true
    }
    
    //MARK: - PHONE MASK
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == phoneTextField {
            guard let text = textField.text else { return false }
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
            textField.text = formating(with: "(XXX) XXX-XX-XX", phone: newString)
            return false
        }
        return true
    }
    
    private func formating(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        
        for i in mask where index < numbers.endIndex {
            if i == "X" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(i)
            }
        }
        return result
    }
}

extension FillUserDataViewImpl: FillUserDataViewInput {
}
