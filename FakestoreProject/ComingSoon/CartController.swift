//
//  CartController.swift
//  FakestoreProject
//
//  Created by Unsal Oner on 27.01.2023.
//

import Foundation
import UIKit

class CartController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        let label = UILabel(frame: CGRect(x: 80, y: 348, width: 231, height: 148))
        label.text = "Coming Soon..."
        label.textColor = .black
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.center = self.view.center
        self.view.addSubview(label)
    }
    
    
}
