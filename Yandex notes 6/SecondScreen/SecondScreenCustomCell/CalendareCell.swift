//
//  DateCell.swift
//  Yandex notes 6
//
//  Created by дэвид Кихтенко on 27.11.2022.
//

import UIKit

protocol CalendareCellOutput: AnyObject{
    func getDate(date: String)
}

final class CalendareCell: UITableViewCell{
    
   private weak var delegate: CalendareCellOutput?
    
    static let identifer = "DateCell"
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var date: UIDatePicker = {
        let date = UIDatePicker()
        date.preferredDatePickerStyle = .inline
        date.datePickerMode = .date
        date.addTarget(self, action: #selector(getDate), for: .valueChanged)
        date.minimumDate = Date()
        date.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(date)
        return date
    }()
    
    @objc
    private func getDate(){
        lazy var formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy"
        delegate?.getDate(date: formatter.string(from: date.date))
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        updateConstraints()
    }
    
    override func updateConstraints(){
        super.updateConstraints()
        NSLayoutConstraint.activate([
            date.topAnchor.constraint(equalTo: contentView.topAnchor),
            date.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            date.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            date.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    func setup(delegate: CalendareCellOutput){
        self.delegate = delegate
    }
}

    

