//
//  File.swift
//  Yandex notes
//
//  Created by дэвид Кихтенко on 30.10.2022.
//

import UIKit

protocol NoteEditViewOutput: AnyObject{
    func cancelButton()
    func dateChange(isOn: Bool)
    func saveButton(index: Int, text: String?, date: String?, importance: Int?)
    func deleteButton(index: Int)
}

protocol NoteEditViewInput: AnyObject, MakeupCellOutput{
    func setupOutput(output: NoteEditViewOutput)
    func setTableViewSources(source: TableViewSources)
}

protocol OpenCalendare: AnyObject {
    func openCalendare(openOrCloseCalendare: Bool, view: UITableViewCell)
}

final class NoteEditView: UIView {
    
    private weak var output: NoteEditViewOutput?
    private weak var setupvarImportanceDelegate: SetupvarImportanceDelegate?
    weak var makeupCellInput: MakeupCellInput?
    
    private var taskModel = TaskModel()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.hideKeyboardOnSwipeDownAndTouch))
        let hideTouch = UITapGestureRecognizer(target: self, action:  #selector(self.hideKeyboardOnSwipeDownAndTouch))
        swipeUp.delegate = self
        hideTouch.delegate = self
        swipeUp.direction =  UISwipeGestureRecognizer.Direction.up
        hideTouch.cancelsTouchesInView = false
        self.tableViewNote.addGestureRecognizer(swipeUp)
        self.tableViewNote.addGestureRecognizer(hideTouch)
        self.keyboardLayoutGuide.followsUndockedKeyboard = true
        }
    
    private lazy var tableViewNote: UITableView = {
        let tableViewNote = UITableView(frame: .zero, style: .insetGrouped)
        tableViewNote.register(NoteEditCell.self,
                           forCellReuseIdentifier: NoteEditCell.identifer)
        tableViewNote.register(ImportanceCell.self,
                           forCellReuseIdentifier: ImportanceCell.identifer)
        tableViewNote.register(MakeupCell.self,
                           forCellReuseIdentifier: MakeupCell.identifer)
        tableViewNote.register(DeleteButtonCell.self,
                           forCellReuseIdentifier: DeleteButtonCell.identifer)
        tableViewNote.register(CalendareCell.self,
                           forCellReuseIdentifier: CalendareCell.identifer)
        tableViewNote.translatesAutoresizingMaskIntoConstraints = false
        tableViewNote.allowsSelection = false
        tableViewNote.layer.cornerRadius = 8
        addSubview(tableViewNote)
        return tableViewNote
    }()
    
    private lazy var backButton: CustomButton = {
        let backButton = CustomButton(buttonColor: .systemBackground,
                                      titel: "cancel",
                                      width: 60,
                                      height: 30,
                                      textSize: 15,
                                      сolorText: .systemBlue,
                                      shadowOpacity: nil,
                                      corner: 8)
        backButton.addTarget(nil, action: #selector(backButtonAction), for: .touchUpInside)
        return backButton
    }()
    
    private lazy var saveButton: CustomButton = {
       let saveButton = CustomButton(buttonColor: .systemBackground,
                                     titel: "save",
                                     width: 60,
                                     height: 30,
                                     textSize: 15,
                                     сolorText: .systemBlue,
                                     shadowOpacity: nil,
                                     corner: 8)
       saveButton.addTarget(nil, action: #selector(saveButtonAction), for: .touchUpInside)
       return saveButton
    }()
    
    private lazy var topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = .systemBackground
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.addSubviews([backButton, saveButton])
        addSubview(topView)
        return topView
    }()
    
    override func updateConstraints() {
            super.updateConstraints()
            NSLayoutConstraint.activate([
                tableViewNote.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
                tableViewNote.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
                tableViewNote.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
                tableViewNote.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),

                topView.topAnchor.constraint(equalTo: topAnchor),
                topView.leadingAnchor.constraint(equalTo: leadingAnchor),
                topView.trailingAnchor.constraint(equalTo: trailingAnchor),
                topView.heightAnchor.constraint(equalToConstant: 50),
                
                backButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
                backButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),

                saveButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
                saveButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            ])
        }
    
    @objc
    func hideKeyboardOnSwipeDownAndTouch() { 
        self.endEditing(true)
    }
    
    @objc
    private func backButtonAction() {
        output?.cancelButton()
      }
    
    @objc
    private func saveButtonAction() {
        output?.saveButton(index: self.tag,
                           text: taskModel.noteText,
                           date: taskModel.date,
                           importance: taskModel.noteImportance)
    }
}

extension NoteEditView: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
        }
}

extension NoteEditView: NoteEditViewInput {
    func setupOutput(output: NoteEditViewOutput) {
        self.output = output
    }
    
    func setTableViewSources(source: TableViewSources) {
        tableViewNote.dataSource = source
    }
}

extension NoteEditView: DeleteDelegate {
    func deleteButton(){
        output?.deleteButton(index: self.tag)
    }
}

extension NoteEditView: MakeupCellOutput {
    func saveDate(date: String) {
        taskModel.date = date
    }
    
    func dateChange(isOn: Bool) {
        output?.dateChange(isOn: isOn)
        if isOn{
            tableViewNote.insertRows(at: [.init(row: 2, section: 1)], with: .left)
        } else{
            tableViewNote.deleteRows(at: [.init(row: 2, section: 1)], with: .left)
        }
    }
}

extension NoteEditView: NoteEditCellOutput {
    func getText(text: String) {
        taskModel.noteText = text
    }
    
    func updateCellHeight() {
        tableViewNote.beginUpdates()
        tableViewNote.endUpdates()
    }
}

extension NoteEditView: SetupvarImportanceDelegate {
    func setupvarImportance(importance: Int) {
        taskModel.noteImportance = importance
    }
}

extension NoteEditView: CalendareCellOutput {
    func getDate(date: String){
        makeupCellInput?.getDate(date: date)
    }
}
    
    



