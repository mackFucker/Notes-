//
//  OnboardingView.swift
//  Messendev
//
//  Created by Роман Анпилов on 03.02.2023.
//

import UIKit

protocol OnboardingViewInput: AnyObject {
    func setDataOnboarding(image: String, title: String, subtitle: String)
}

final class OnboardingViewImpl: UIView {
    
    weak var onboardingView: OnboardingView?
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemPink
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .label
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.rounded(ofSize: 36, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.numberOfLines = 0
        subtitleLabel.font = UIFont.rounded(ofSize: 18, weight: .bold)
        subtitleLabel.textColor = .mainGray
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return subtitleLabel
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel, imageView])
        stackView.axis = .vertical
        stackView.backgroundColor = .systemBackground
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        return stackView
    }()
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            imageView.heightAnchor.constraint(equalToConstant: 400),
            imageView.widthAnchor.constraint(equalToConstant: 250),
            
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 2),
            
            subtitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: subtitleLabel.trailingAnchor, multiplier: 2),
        ])
        
        super.updateConstraints()
    }
}

extension OnboardingViewImpl: OnboardingViewInput {
    func setDataOnboarding(image: String, title: String, subtitle: String) {
        imageView.image = UIImage(named: image)
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}

