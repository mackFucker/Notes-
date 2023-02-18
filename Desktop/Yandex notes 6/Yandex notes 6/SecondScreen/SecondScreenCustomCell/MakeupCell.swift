//
//  MakeUpCell.swift
//  Yandex notes 6
//
//  Created by дэвид Кихтенко on 22.11.2022.
//

import UIKit
import CoreData

protocol MakeupCellOutput: AnyObject {
    func dateChange(isOn: Bool)
    func saveDate(date: String)
}

protocol MakeupCellInput: AnyObject {
    func getDate(date: String)
}

final class MakeupCell: UITableViewCell {

    static let identifer = "MakeupCell"
    
    private weak var delegate: MakeupCellOutput?
    
    private lazy var makeUpLabel: UILabel = {
        let makeUp = UILabel()
        makeUp.text = "make up"
        makeUp.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(makeUp)
        return makeUp
    }()
    
    private lazy var makeUpDateLabel: UILabel = {
        let makeUpDateLabel = UILabel()
        makeUpDateLabel.font = .systemFont(ofSize: 15, weight: .medium)
        makeUpDateLabel.textColor = .systemBlue
        makeUpDateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(makeUpDateLabel)
        return makeUpDateLabel
    }()
    
    private lazy var makeUpSwitch: UISwitch = {
        let makeUpSwitch = UISwitch()
        makeUpSwitch.addTarget(nil, action: #selector(makeUpSwitchAction), for: .touchUpInside)
        makeUpSwitch.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(makeUpSwitch)
        return makeUpSwitch
    }()
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            makeUpLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            makeUpLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10),
            
            makeUpDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            makeUpDateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 10),

            makeUpSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            makeUpSwitch.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        super.updateConstraints()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func makeUpSwitchAction(_ sender: UISwitch) {
        delegate?.dateChange(isOn: sender.isOn)
    }
    
    func setup(delegate: MakeupCellOutput, with viewModel: NSManagedObject) {
        self.delegate = delegate
        makeUpDateLabel.text = viewModel.value(forKey: "date") as? String
        delegate.saveDate(date: viewModel.value(forKey: "date") as? String ?? "")
    }
}

extension MakeupCell: MakeupCellInput {
    func getDate(date: String) {
        makeUpDateLabel.text = date
        delegate?.saveDate(date: makeUpDateLabel.text ?? "defaultDate")
    }
}


