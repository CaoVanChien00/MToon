//
//  EditCategoryViewController.swift
//  MToon
//
//  Created by Computer on 5/7/21.
//  Copyright © 2021 Computer. All rights reserved.
//

import UIKit

class EditCategoryViewController: UIViewController {

    @IBOutlet weak var ID: UILabel!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Description: CustomTextview!
    let dbCategory = DBCategory()
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        if let id = id {
            dbCategory.getByID(ID: id) { (data) in
                if let data = data {
                    DispatchQueue.main.async {
                        self.ID.text = String(data.ID!)
                        self.Name.text = data.Name!
                        self.Description.text = data.Description!
                    }
                }
            }
        }
    }

    @IBAction func editCategory(_ sender: UIButton) {
        if let id = ID.text, let name = Name.text, let description = Description.text {
            dbCategory.update(id: Int(id)!, name: name, description: description) { (data) in
                
            }
        }
    }
}
