//
//  PersonManager.swift
//  TestMVVM
//
//  Created by Bruno Scheltzke on 06/11/17.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import Foundation

protocol PersonManagerDelegate {
    func add(person: Person)
    func edit(person: Person)
}

class PersonManager {
    
    var changeCompletion: ChangeCompletion?
    
    var delegate: PersonManagerDelegate!
    
    var persons = [Person(id: "orhvohdirv", name: "Mad Max")]
    
    func fetch(completion: ([Person]) -> Void) {
        completion(persons)
    }
    
    func save(person: Person, completion: (Result<Person>) -> Void) {
        //creating new one
        if person.id.isEmpty {
            let newPerson = Person(id: UUID().description, name: person.name)
            persons.append(newPerson)
            delegate.add(person: newPerson)
            completion(.sucess(newPerson))
        } else {   //editing
            if let index = persons.index(where: { $0.id == person.id }) {
                persons[index] = person
                delegate.edit(person: person)
                completion(.sucess(person))
            } else {
                completion(.error(fatalError("fez merda") as! Error))
            }
        }
    }
}
