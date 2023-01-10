//
//  NoteEditCells.swift
//  Yandex notes 6
//
//  Created by дэвид Кихтенко on 22.11.2022.
//

import UIKit
import CoreData

protocol NoteEditCellOutput: AnyObject {
    func getText(text: String)
    func updateCellHeight()
}

final class NoteEditCell: UITableViewCell, UITextViewDelegate {
    
    private var lastHeight: CGFloat?
        
    weak var delegate: NoteEditCellOutput?
    static let identifer = "CellClass1"
    
     private lazy var noteText: UITextView = {
        let noteText = UITextView()
        noteText.backgroundColor = .systemGray
        noteText.layer.cornerRadius = 8
        noteText.isScrollEnabled = false
        noteText.font = UIFont.systemFont(ofSize: 20)
        noteText.backgroundColor = .systemGray3
        noteText.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(noteText)
        return noteText
    }()
    
    override func updateConstraints(){
           super.updateConstraints()
           NSLayoutConstraint.activate([
                noteText.topAnchor.constraint(equalTo: contentView.topAnchor),
                noteText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                noteText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                noteText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ])
       }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        noteText.delegate = self
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    func textViewDidChangeSelection(_ textView: UITextView) {
        delegate?.getText(text: noteText.text)
        delegate?.updateCellHeight()
    }
        
    func setup(delegate: NoteEditCellOutput, with viewModel: NSManagedObject) {
        noteText.text = viewModel.value(forKey: "text") as? String
        self.delegate = delegate
    }
}


