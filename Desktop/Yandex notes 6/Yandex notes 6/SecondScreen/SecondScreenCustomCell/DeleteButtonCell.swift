//
//  deleteButtonCell.swift
//  Yandex notes 6
//
//  Created by дэвид Кихтенко on 22.11.2022.
//

import UIKit

protocol DeleteDelegate: AnyObject {
    func deleteButton()
}

final class DeleteButtonCell : UITableViewCell {
    
    private weak var delegate: DeleteDelegate?
    
    static let identifer = "CellClass4"
    
    private lazy var deleteButton: CustomButton = {
        let deleteButton = CustomButton(buttonColor: .systemGray3,
                                        titel: "delete", width: contentView.frame.width,
                                        height: contentView.frame.height,
                                        textSize: 20,
                                        сolorText: .systemRed,
                                        shadowOpacity: nil,
                                        corner: contentView.layer.cornerRadius)
        deleteButton.addTarget(nil, action: #selector(deleteButtonAction), for: .touchUpInside)
        addSubview(deleteButton)
        return deleteButton
    }()
    
    override func updateConstraints() {
        super.updateConstraints()
       
        NSLayoutConstraint.activate([
            deleteButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            deleteButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    @objc
    private func deleteButtonAction(){
        delegate?.deleteButton()
    }
    
    func setup(delegate: DeleteDelegate){
        self.delegate = delegate
    }
}
