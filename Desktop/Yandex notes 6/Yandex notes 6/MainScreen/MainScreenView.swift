//
//  ainScreenView.swift
//  Yandex notes 6
//
//  Created by дэвид Кихтенко on 12.11.2022.
//

import UIKit

typealias TableViewSources = UITableViewDelegate & UITableViewDataSource

protocol MainScreenViewOutput: AnyObject {
    func addNoteAction(tableView: UITableView)
}

protocol MainScreenViewInput: UIView {
    func setTableViewSources(source: TableViewSources)
    func setupOutput(output: MainScreenViewOutput)
    func setupSwitch(index: Int, type: TypeofChanges)
}

final class MainScreenView: UIView {
    
    private weak var delegate: MainScreenViewOutput?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.rowHeight = 60
        tableView.register(CustomCell.self,
                           forCellReuseIdentifier: CustomCell.identifer)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        return tableView
    }()
        
    private lazy var addNoteButton: CustomButton = {
        let addNoteButton = CustomButton(buttonColor: .systemBlue,
                                         titel: "+",
                                         width: 40,
                                         height: 40,
                                         textSize: 20,
                                         сolorText: .systemBackground,
                                         shadowOpacity: 0.3,
                                         corner: nil)
        addNoteButton.addTarget(self, action: #selector(addNoteAction), for: .touchUpInside)
        addNoteButton.layer.shadowRadius = 4
        addNoteButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(addNoteButton)
        return addNoteButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                  
            addNoteButton.bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: -50),
            addNoteButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    @objc
    private func addNoteAction(){
        delegate?.addNoteAction(tableView: tableView)
    }
}

extension MainScreenView: MainScreenViewInput {
    func setupSwitch(index: Int, type: TypeofChanges) {
        switch type {
        case .delete:
            tableView.deleteRows(at: [.init(row: index, section: 0)], with: .right)
        case .add:
            tableView.insertRows(at: [.init(row: index, section: 0)], with: .left)
        case .edit:
            tableView.reloadRows(at: [.init(row: index, section: 0)], with: .fade)
        case .toggle:
            tableView.reloadRows(at: [.init(row: index, section: 0)], with: .none)
        }
    }
    
    func setupOutput(output: MainScreenViewOutput) {
        self.delegate = output
    }
    
    func setTableViewSources(source: TableViewSources) {
        tableView.delegate = source
        tableView.dataSource = source
    }
}
