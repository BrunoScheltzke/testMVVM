//
//  AddEditPersonViewController.swift
//  TestMVVM
//
//  Created by Bruno Scheltzke on 06/11/17.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import UIKit

class AddEditPersonViewController: UIViewController {

    var addEditPersonViewModel: AddEditPersonViewModel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure(with: addEditPersonViewModel)
    }
    
    func configure(with personViewModel: AddEditPersonViewModel) {
        nameTextField.text = personViewModel.person.name
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        addEditPersonViewModel.person.name = nameTextField.text ?? ""
        addEditPersonViewModel.save { (result) in
            switch result {
            case .sucess(let person):
                navigationController?.popViewController(animated: true)
            case .error(let error):
                print(error)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
