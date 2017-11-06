//
//  PersonListTableViewController.swift
//  TestMVVM
//
//  Created by Bruno Scheltzke on 06/11/17.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import UIKit

class PersonListTableViewController: UITableViewController {

    var personListViewModel: PersonListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        personListViewModel = PersonListViewModel(personManager: PersonManager())
        
        personListViewModel.fetchData {
            tableView.reloadData()
        }

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personListViewModel.persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = personListViewModel.persons[indexPath.row].name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = personListViewModel.persons[indexPath.row]
        performSegue(withIdentifier: "goToPersonDetail", sender: person)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        personListViewModel.fetchData {
            tableView.reloadData()
        }
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToPersonDetail", sender: nil)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "goToPersonDetail", let detailViewController = segue.destination as? AddEditPersonViewController {
            if let sender = sender as? Person {
                detailViewController.addEditPersonViewModel = AddEditPersonViewModel(personManager: personListViewModel.personManager, person: sender)
            } else {
                detailViewController.addEditPersonViewModel = AddEditPersonViewModel(personManager: personListViewModel.personManager)
            }
        }
    }


}
