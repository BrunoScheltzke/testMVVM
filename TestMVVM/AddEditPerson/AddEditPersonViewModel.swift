//
//  AddEditPersonViewModel.swift
//  TestMVVM
//
//  Created by Bruno Scheltzke on 06/11/17.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import Foundation

enum Result<T> {
    case sucess(T)
    case error(Error?)
}

enum ErrorAddEditPerson: Error {
    case invalidate(String)
}

class AddEditPersonViewModel {
    var person: Person
    var personManager: PersonManager
    
    init(personManager: PersonManager) {
        self.person = Person(id: "", name: "")
        self.personManager = personManager
    }
    
    init(personManager: PersonManager, person: Person) {
        self.person = person
        self.personManager = personManager
    }
    
    func save(completion:(Result<Person>) -> Void) {
        if person.name.isEmpty {
            completion(.error(ErrorAddEditPerson.invalidate("Falta preencher o nome")))
        } else {
            personManager.save(person: person, completion: { (result) in
                completion(result)
            })
        }
    }
}
