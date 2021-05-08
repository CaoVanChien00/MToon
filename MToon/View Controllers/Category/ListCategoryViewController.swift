//
//  ListCategoryViewController.swift
//  MToon
//
//  Created by Computer on 5/7/21.
//  Copyright © 2021 Computer. All rights reserved.
//

import UIKit

class ListCategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var categorys = [Category]()
    var dbCategory = DBCategory()
    @IBOutlet weak var tableView: CustomTableView!
    @IBOutlet weak var textSearch: CustomTextField!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryTableViewCell
        cell.Name.text = categorys[indexPath.row].Name!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let view = storyboard?.instantiateViewController(withIdentifier: "EditCategoryViewController") as? EditCategoryViewController {
            view.id = categorys[indexPath.row].ID!
            present(view, animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dbCategory.getAll { (data) in
            if let data = data {
                self.categorys = data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    @IBAction func searchAction(_ sender: UIButton) {
        if let query = textSearch.text {
            dbCategory.search(query: query) { (data) in
                if let data = data {
                    self.categorys.removeAll()
                    self.categorys = data
                    DispatchQueue.main.async { self.tableView.reloadData()
                    }
                }else{
                    self.categorys.removeAll()
                    DispatchQueue.main.async { self.tableView.reloadData()
                    }
                }
            }
        }
    }
}
