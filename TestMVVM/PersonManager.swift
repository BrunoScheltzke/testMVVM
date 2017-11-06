//
//  PersonManager.swift
//  TestMVVM
//
//  Created by Bruno Scheltzke on 06/11/17.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import Foundation

class PersonManager {
    
    var persons = [Person(id: "orhvohdirv", name: "Mad Max")]
    
    func fetch(completion: ([Person]) -> Void) {
        completion(persons)
    }
    
    func save(person: Person, completion: (Result<Person>) -> Void) {
        if person.id.isEmpty {
            let newPerson = Person(id: UUID().description, name: person.name)
            persons.append(newPerson)
            completion(.sucess(newPerson))
        } else {
            if let index = persons.index(where: { $0.id == person.id }) {
                persons[index] = person
                completion(.sucess(person))
            } else {
                completion(.error(fatalError("fez merda") as! Error))
            }
        }
    }
}
