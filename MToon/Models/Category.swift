//
//  Category.swift
//  MToon
//
//  Created by Computer on 5/6/21.
//  Copyright © 2021 Computer. All rights reserved.
//

import Foundation

class CategoryDecodable: Decodable {
    let ID: Int
    let Name: String
    let Description: String
}

class Category {
    let ID: Int?
    let Name: String?
    let Description: String?
    
    init(ID: Int, Name: String, Description: String) {
        self.ID = ID
        self.Name = Name
        self.Description = Description
    }
}
