//
//  DBCategory.swift
//  MToon
//
//  Created by Computer on 5/6/21.
//  Copyright © 2021 Computer. All rights reserved.
//

import UIKit

class DBCategory {
    
    var url = URL(string: "http://192.168.64.3/Web/API/Category.php")
    
    struct Response: Decodable {
        let msg: String
        let id: Int?
        let data: [CategoryDecodable]?
    }
    
    func getAll(completion: @escaping ([Category]?)->()) {
        var requestURL = URLRequest(url: url!)
        
        requestURL.httpMethod = "POST"
        requestURL.httpBody = "type=getall".data(using: .utf8)
        
        URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            if let data = data {
                print(data)
                do {
                    var json: Response?
                    json = try JSONDecoder().decode(Response.self, from: data)
                    
                    if let json = json {
                        var categorys = [Category]()
                        for item in json.data! {
                            categorys.append(Category(ID: item.ID, Name: item.Name, Description: item.Description))
                        }
                        completion(categorys)
                    }
                    
                }catch {
                    completion(nil)
                }
                
            }
            }.resume()
    }
    
    func search(query: String, completion: @escaping ([Category]?)->()) {
        var requestURL = URLRequest(url: url!)
        
        requestURL.httpMethod = "POST"
        requestURL.httpBody = "query=\(query)&type=search".data(using: .utf8)
        
        URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            if let data = data {
                print(data)
                do {
                    var json: Response?
                    json = try JSONDecoder().decode(Response.self, from: data)
                    
                    if let json = json {
                        print(json.msg)
                        var categorys = [Category]()
                        for item in json.data! {
                            categorys.append(Category(ID: item.ID, Name: item.Name, Description: item.Description))
                        }
                        completion(categorys)
                    }
                    
                }catch {
                    completion(nil)
                }
                
            }
            }.resume()
    }
    
    func getByID(ID: Int, completion: @escaping (Category?)->()) {
        var requestURL = URLRequest(url: url!)
        
        requestURL.httpMethod = "POST"
        requestURL.httpBody = "id=\(ID)&type=getbyid".data(using: .utf8)
        
        URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            if let data = data {
                print(data)
                do {
                    var json: Response?
                    json = try JSONDecoder().decode(Response.self, from: data)
                    
                    if let json = json {
                        completion(Category(ID: json.data![0].ID, Name: json.data![0].Name, Description: json.data![0].Description))
                    }
                    
                }catch {
                    completion(nil)
                }
                
            }
            }.resume()
    }
    
    func add(name: String, description: String, completion: @escaping (Int?)->()) {
        var requestURL = URLRequest(url: url!)
        
        requestURL.httpMethod = "POST"
        requestURL.httpBody = "name=\(name)&description=\(description)&type=add".data(using: .utf8)
        
        URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            if let data = data {
                print(data)
                do {
                    var json: Response?
                    json = try JSONDecoder().decode(Response.self, from: data)
                    
                    if let json = json {
                        completion(json.id)
                    }
                    
                }catch {
                    completion(nil)
                }
                
            }
            }.resume()
    }
    
    func update(id: Int, name: String, description: String, completion: @escaping (Bool)->()) {
        var requestURL = URLRequest(url: url!)
        
        requestURL.httpMethod = "POST"
        requestURL.httpBody = "id=\(id)&name=\(name)&description=\(description)&type=update".data(using: .utf8)
        
        URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            if let data = data {
                print(data)
                do {
                    var json: Response?
                    json = try JSONDecoder().decode(Response.self, from: data)
                    
                    if let json = json {
                        if json.msg == "SUCCESS"{
                            completion(true)
                        }
                    }
                    
                }catch {
                    completion(false)
                }
                
            }
            }.resume()
    }
}
