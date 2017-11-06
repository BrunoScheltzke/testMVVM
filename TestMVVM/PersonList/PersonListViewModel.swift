//
//  PersonListViewModel.swift
//  TestMVVM
//
//  Created by Bruno Scheltzke on 06/11/17.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import Foundation

class PersonListViewModel {
    
    var persons: [Person] = []
    var personManager: PersonManager
    
    init(personManager: PersonManager) {
        self.personManager = PersonManager()
    }
    
    func fetchData(completion: () -> Void) {
        personManager.fetch { (persons) in
            self.persons = persons
            completion()
        }
    }
}

//class PersonViewModel {
//    var id: String
//    var name: String
//
//    init(person: Person) {
//        id = person.id
//        name = "name: " + person.name
//    }
//
//    init() {
//        id = ""
//        name = ""
//    }
//}

