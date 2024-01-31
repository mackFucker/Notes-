//
//  ViewController.swift
//  TETS 1 MVP
//
//  Created by дэвид Кихтенко on 12.07.2023.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.text = "allah"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        return label
    }()
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 70),
            label.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}

