//
//  File.swift
//  Yandex notes
//
//  Created by дэвид Кихтенко on 30.10.2022.
//

import UIKit

final class NoteEditViewController: UIViewController, UITableViewDelegate {

    var notesRepository: NotesRepository = NotesDataSource.shared
    var noteEditView = NoteEditView()
        
    private var cellIsOpen: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteEditView.setupOutput(output: self)
    }
    
    override func loadView() {
        view = noteEditView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        noteEditView.setTableViewSources(source: self)
    }
}

extension NoteEditViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return cellIsOpen ? 3 : 2
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        switch (indexPath.section, indexPath.row) {
            case (0,0):
                 cell = tableView.dequeueReusableCell(withIdentifier: NoteEditCell.identifer, for: indexPath)
            (cell as! NoteEditCell).setup(delegate: noteEditView, with: notesRepository.getNote(index: noteEditView.tag))
            case (1,0):
                cell = tableView.dequeueReusableCell(withIdentifier: ImportanceCell.identifer, for: indexPath)
                (cell as! ImportanceCell).setup(delegate: noteEditView, with: notesRepository.getNote(index: noteEditView.tag))
            case (1,1):
                cell = tableView.dequeueReusableCell(withIdentifier: MakeupCell.identifer, for: indexPath)
                (cell as! MakeupCell).setup(delegate: noteEditView, with: notesRepository.getNote(index: noteEditView.tag))
                noteEditView.makeupCellInput = (cell as! MakeupCell)
            case(1,2):
                cell = tableView.dequeueReusableCell(withIdentifier: CalendareCell.identifer, for: indexPath)
                (cell as! CalendareCell).setup(delegate: noteEditView)
            case (2,0):
                cell = tableView.dequeueReusableCell(withIdentifier: DeleteButtonCell.identifer, for: indexPath)
                (cell as! DeleteButtonCell).setup(delegate: noteEditView)
            default:
                cell = tableView.dequeueReusableCell(withIdentifier: NoteEditCell.identifer, for: indexPath) as! NoteEditCell
                break
        }
        return cell
    }
}

extension NoteEditViewController: NoteEditViewOutput{

    func deleteButton(index: Int) {
        notesRepository.deleteNote(index: index)
        dismiss(animated: true)
    }
    
    func cancelButton() {
        dismiss(animated: true)
    }
    
    func saveButton(index: Int, text: String?, date: String?, importance: Int?) {
        notesRepository.editNote(index: index,
                                 note: text ?? notesRepository.getNote(index: index).value(forKey: "text") as! String,
                                 date: date ?? notesRepository.getNote(index: index).value(forKey: "date") as! String,
                                 importance: importance ?? notesRepository.getNote(index: index).value(forKey: "importance") as! Int)
        dismiss(animated: true)
    }
    
    func dateChange(isOn: Bool) {
        self.cellIsOpen = isOn
    }
}

