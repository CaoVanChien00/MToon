//
//  AddCategoryViewController.swift
//  MToon
//
//  Created by Computer on 5/6/21.
//  Copyright © 2021 Computer. All rights reserved.
//

import UIKit

class AddCategoryViewController: UIViewController {
    
    let dbCategory = DBCategory()
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Description: CustomTextview!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addCategory(_ sender: CustomButton) {
        if let name = Name.text, let description = Description.text {
            dbCategory.add(name: name, description: description) {
                data in
                
            }
        }
    }
}
