//
//  ImportanceCell.swift
//  Yandex notes 6
//
//  Created by дэвид Кихтенко on 22.11.2022.
//

import UIKit
import CoreData

protocol SetupvarImportanceDelegate: AnyObject{
    func setupvarImportance(importance: Int)
}

final class ImportanceCell: UITableViewCell {
    
    static let identifer = "CellClass2"
    
    private weak var delegate: SetupvarImportanceDelegate?
    
    private lazy var importance: UILabel = {
        let importance = UILabel()
        importance.text = "importance"
        importance.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(importance)
        return importance
          }()
    
        private lazy var priority: UISegmentedControl = {
            let prioryty = UISegmentedControl (items: ["↓", "no", "‼️"])
            prioryty.addTarget(nil, action: #selector(priorityAction), for: .valueChanged)
            prioryty.backgroundColor = .systemGray3
            prioryty.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(prioryty)
            return prioryty
        }()
        
    override func updateConstraints() {
           super.updateConstraints()
           NSLayoutConstraint.activate([
            priority.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -15),
            priority.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            importance.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            importance.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
           ])
       }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func priorityAction(){
        var a = 1
        switch priority.selectedSegmentIndex {
            case 0:
                a = 0
            case 1:
                a = 1
            case 2:
                a = 2
            default:
                break
            }
        delegate?.setupvarImportance(importance: a)

    }
    
    func setup(delegate: SetupvarImportanceDelegate, with viewModel: NSManagedObject){
        self.delegate = delegate
        priority.selectedSegmentIndex = viewModel.value(forKey: "importance") as? Int ?? 1
    }
}

