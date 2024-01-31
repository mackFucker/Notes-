//
//  Presenter.swift
//  TETS 1 MVP
//
//  Created by дэвид Кихтенко on 12.07.2023.
//

import UIKit

protocol MainViewPrortocol: AnyObject {
    func setGreeting(greeting: String)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewPrortocol, person: Person)
    func showGreeting()
}

final class Presenter: MainViewPresenterProtocol {
    let view: MainViewPrortocol
    let person: Person
    
    init(view: MainViewPrortocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = self.person.name + self.person.surname
        self.view.setGreeting(greeting: greeting)
    }
}
