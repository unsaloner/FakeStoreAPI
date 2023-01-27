//
//  NetworkManager.swift
//  FakestoreProject
//
//  Created by Unsal Oner on 24.01.2023.
//

import Foundation
import UIKit



class NetworkManager {
    

    func fetchProducts(url: URL, completion: @escaping ([Product]?) -> Void) {
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error.localizedDescription)
                    completion(nil)
                }else if let data = data {
                    let productList = try? JSONDecoder().decode([Product].self, from: data)
                    
                    if let productList = productList {
                        completion(productList)
                        
                    }
                }
            }
            task.resume()
        }
    
    
    
}
   


    
    

