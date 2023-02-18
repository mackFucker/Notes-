//
//  ViewController.swift
//  Yandex notes
//
//  Created by дэвид Кихтенко on 29.10.2022.
//

import UIKit

final class MainScreenViewController: UIViewController {
    
    private let notesRepository: NotesRepository
    private let mainView: MainScreenViewInput
    
    init(notesRepository: NotesRepository,
         mainView: MainScreenViewInput) {
        self.notesRepository = notesRepository
        self.mainView = mainView
        
        super.init(nibName: nil, bundle: nil)
        self.title = "Notes"
        
        mainView.setTableViewSources(source: self)
        mainView.setupOutput(output: self)
        notesRepository.setDelegate(delegate: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = mainView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notesRepository.receivingFromPersistenStore()
    }
}

extension MainScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesRepository.getAllNotes().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifer,
                                                 for: indexPath) as! CustomCell
        
        let note = notesRepository.getNote(index: indexPath.row)
        
        cell.setup(with: note, delegate: self)
        cell.tag =  indexPath.row
        return cell
    }
}

extension MainScreenViewController: MainScreenViewOutput {
    func addNoteAction(tableView: UITableView) {
        notesRepository.addNewNote()
        NotesDataSource.counterId += 1
    }
}

extension MainScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive,
                                              title: "delete") { [weak self] _, _, _ in
            self?.notesRepository.deleteNote(index: indexPath.row)
        }
        
        let infoAction = UIContextualAction(style: .normal,
                                            title: "info") { [weak self] (_, _, _) in
            self?.openInfoAction(indexPath: indexPath)
          
        }
        infoAction.backgroundColor =  .systemGray3
        deleteAction.backgroundColor = .systemRed
        
        return .init(actions: [deleteAction, infoAction])
   }

    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let isFinishedSwipe = UIContextualAction(style: .normal,
                                                 title: "finished") { [weak self] (_, _, _) in
            self?.notesRepository.togleIsFinished(index: self?.notesRepository.getNote(index: indexPath.row).value(forKey: "id") as! Int)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ) {
                tableView.reloadData()
            }
           
        }
        isFinishedSwipe.backgroundColor = .systemGreen
        return .init(actions: [isFinishedSwipe])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        openInfoAction(indexPath: indexPath)
    }
}

extension MainScreenViewController: CustomCellDelegate {
    func isFinished(index: Int) {
        notesRepository.togleIsFinished(index: index)
    }
}

extension MainScreenViewController {
    private func openInfoAction(indexPath: IndexPath){
        let presentVC = NoteEditViewController()
        presentVC.noteEditView.tag = indexPath.row
        present(presentVC, animated: true, completion: nil)
    }
}

extension MainScreenViewController: NotifyAboutChanges {
    func notify(index: Int, type: TypeofChanges) {
        mainView.setupSwitch(index: index, type: type)
    }
}


