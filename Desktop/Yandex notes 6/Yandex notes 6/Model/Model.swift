//
//  CustomCellViewModel.swift
//  Yandex notes
//
//  Created by дэвид Кихтенко on 30.10.2022.
//

import UIKit
import CoreData

enum TypeofChanges {
    case delete
    case add
    case edit
    case toggle
}

protocol NotifyAboutChanges: AnyObject {
    func notify(index: Int, type: TypeofChanges)
}

protocol NotesRepository {
    func addNewNote()
    func editNote(index: Int, note: String, date: String, importance: Int)
    func deleteNote(index: Int)
    func getAllNotes() -> [NSManagedObject]
    func getNote(index: Int) -> NSManagedObject
    func togleIsFinished(index: Int)
    func setDelegate(delegate: NotifyAboutChanges)
    func receivingFromPersistenStore()
}

final class NotesDataSource: NotesRepository {
    
    weak var delegate: NotifyAboutChanges?
    
    static var counterId = 0
        
    static let shared = NotesDataSource()
    
    private init () {}
    
    private var notes: [NSManagedObject] = [].sorted { ($0.value(forKey: "id") as! Int) <  ($1.value(forKey: "id") as! Int)}

    func setDelegate(delegate: NotifyAboutChanges) {
        self.delegate = delegate
    }
    
    func addNewNote() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          return
        }

        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: managedContext)!
        let note = NSManagedObject(entity: entity, insertInto: managedContext)
        
        note.setValue("", forKey: "text")
        note.setValue("", forKey: "date")
        note.setValue(1, forKey: "importance")
        note.setValue(NotesDataSource.counterId, forKey: "id")
        note.setValue(false, forKey: "isFinished")
        
        notes.append(note)
        delegate?.notify(index: notes.count - 1, type: .add)
    }
    
    func editNote(index: Int, note: String, date: String, importance: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          return
        }

        let managedContext = appDelegate.persistentContainer.viewContext

        notes[index].setValue(note, forKey: "text")
        notes[index].setValue(date, forKey: "date")
        notes[index].setValue(importance, forKey: "importance")
        
        do {
          try managedContext.save()
        } catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
        }
        
        delegate?.notify(index: index, type: .edit)
    }
    
    func receivingFromPersistenStore() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          return
        }

        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Note")

        do {
          notes = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func deleteNote(index: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          return
        }

        let managedContext = appDelegate.persistentContainer.viewContext
        
        managedContext.delete(notes[index])
        
        do {
          try managedContext.save()
        } catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
        }
        notes.remove(at: index)

        delegate?.notify(index: index, type: .delete)
    }
    
    func getAllNotes() -> [NSManagedObject] {
        return notes
    }
    
    func getNote(index: Int) -> NSManagedObject {
        return notes[index]
    }
    
    func togleIsFinished(index: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          return
        }

        let managedContext = appDelegate.persistentContainer.viewContext

        let indexInArray = notes.firstIndex{$0.value(forKey: "id") as! Int == index}
        
        var a = (notes[indexInArray!].value(forKey: "isFinished") as! Bool)
        a.toggle()

        notes[indexInArray!].setValue(a, forKey: "isFinished")

        do {
          try managedContext.save()
        } catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
        }
        
        delegate?.notify(index: indexInArray!, type: .toggle)
    }
}
