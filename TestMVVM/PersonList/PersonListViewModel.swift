//
//  PersonListViewModel.swift
//  TestMVVM
//
//  Created by Bruno Scheltzke on 06/11/17.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import Foundation

enum ChangeEvent {
    case add(Int)
    case edit(Int)
    case remove(Int)
}

typealias ChangeCompletion = (ChangeEvent) -> Void

class PersonListViewModel {
    var changeCompletion: ChangeCompletion!

    var persons: [Person] = []
    var personManager: PersonManager
    
    init(personManager: PersonManager) {
        self.personManager = PersonManager()
        self.personManager.delegate = self
    }
    
    func fetchData(completion: () -> Void) {
        personManager.fetch { (persons) in
            self.persons = persons
            completion()
        }
    }
}

extension PersonListViewModel: PersonManagerDelegate {
    
    func add(person: Person) {
        persons.append(person)
        changeCompletion(.add(persons.count - 1))
    }
    
    func edit(person: Person) {
        if let index = persons.index(where: { $0.id == person.id }) {
            self.persons[index] = person
            changeCompletion(.edit(index))
        }
    }
}
