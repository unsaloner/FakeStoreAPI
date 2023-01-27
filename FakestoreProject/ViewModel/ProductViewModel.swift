//
//  ProductViewModel.swift
//  FakestoreProject
//
//  Created by Unsal Oner on 24.01.2023.
//
import UIKit
import Foundation


struct ProductListViewModel {
    let productList: [Product]
    
    func numberOfItemInSection() -> Int {
        return self.productList.count
    }
    
    func productAtIndex(_ index: Int) -> ProductViewModel {
        let product = self.productList[index]
        return ProductViewModel(product)
    }
}

struct ProductViewModel {
    
    let product: Product
    
    init(_ product: Product) {
        self.product = product
    }
    
    var name : String {
        return self.product.title
    }
    var price: Double {
        return self.product.price
    }
    
    var image: String {
        return self.product.image
    }
    
    
}
