//
//  CustomCell.swift
//  яндекс заметки
//
//  Created by дэвид Кихтенко on 19.10.2022.
//
import UIKit
import CoreData

protocol CustomCellDelegate: AnyObject{
    func isFinished(index: Int)
}

final class CustomCell: UITableViewCell {
    
    static let identifer = "CustomCell"
    
    private var cellID: Int!
    private weak var delegate: CustomCellDelegate?
    
    private lazy var noteLabel: UILabel = {
        let noteLabel = UILabel()
        noteLabel.numberOfLines = 3
        noteLabel.textColor = .label
        return noteLabel
    }()
    
    private lazy var compliteButton: CustomButton = {
        let compliteButton = CustomButton(buttonColor: .systemBackground,
                                          titel: nil,
                                          width: 20,
                                          height: 20,
                                          textSize: 20,
                                          сolorText: nil,
                                          shadowOpacity: nil,
                                          corner: nil)
        compliteButton.layer.borderWidth = 2
        compliteButton.layer.borderColor = UIColor.secondaryLabel.cgColor
        compliteButton.configuration?.contentInsets = .init(top: 30, leading: 30, bottom: 30, trailing: 30)
        compliteButton.addTarget(self, action: #selector(compliteButtonAction), for: .touchUpInside)
        return compliteButton
    }()
    
    private lazy var makeUp: UILabel = {
        let dateOfLabel = UILabel()
        dateOfLabel.textColor = .secondaryLabel
        dateOfLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateOfLabel
    }()
    
    private lazy var importance: UILabel = {
        let importance = UILabel()
        importance.translatesAutoresizingMaskIntoConstraints = false
        return importance
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews([compliteButton, noteLabel, makeUp, importance])
        noteLabel.numberOfLines = 3
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
           compliteButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
           compliteButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
       
           noteLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 75),
           noteLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
           noteLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
           noteLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
           
           makeUp.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
           makeUp.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 45),
           
           importance.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
           importance.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 45)
        ])
        
        super.updateConstraints()
    }
    
    func setup(with viewModel: NSManagedObject, delegate: CustomCellDelegate) {
        compliteButton.backgroundColor = (viewModel.value(forKey: "isFinished") as! Bool) ? .green : .systemBackground
        noteLabel.text = viewModel.value(forKey: "text") as? String
        cellID = viewModel.value(forKey: "id") as? Int
        makeUp.text =  viewModel.value(forKey: "date") as? String

        var importanceIcon: String {
            switch viewModel.value(forKey: "importance") as? Int {
                case 0:
                    return "↓"
                case 2:
                    return "‼️"
                default:
                    return ""
                    }
                }
        
        importance.text =  importanceIcon
        self.delegate = delegate
    }
     
    @objc
    private func compliteButtonAction() {
        delegate?.isFinished(index: cellID)
    }
}

