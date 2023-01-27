//
//  HomeViewController.swift
//  FakestoreProject
//
//  Created by Unsal Oner on 24.01.2023.
//

import UIKit
import Kingfisher



final class HomeViewController: UIViewController,UITabBarDelegate,UISearchBarDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    
  
    @IBOutlet weak var collection: UICollectionView! 
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var searchBar: UISearchBar!
   
//        var products: [Product] = []
    
//        var filteredProducts = [Product]()
    
    let refreshControl = UIRefreshControl()
    var searchController = UISearchController(searchResultsController: nil)
    private var productListViewModel : ProductListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        searchController.searchResultsUpdater = self
//        searchController.obscuresBackgroundDuringPresentation = false
        tabBar.delegate = self
        searchBar.delegate = self
        collection.delegate = self
        collection.dataSource = self
        
        getData()
        
        let nib = UINib(nibName: "ProductCell", bundle: nil)
                collection.register(nib, forCellWithReuseIdentifier: "cell")

    refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    collection.addSubview(refreshControl)
        
    }
//    MARK: - REFRESH DATA
   
    @objc func refreshData(){
        let url = URL(string:"https://fakestoreapi.com/products")!
        
        NetworkManager().fetchProducts(url: url) { products in
            if let products = products {
                
                self.productListViewModel = ProductListViewModel(productList: products)
                print("SUCCESS!!!!")
                
                DispatchQueue.main.async {
                    self.collection.reloadData()
                    self.refreshControl.endRefreshing()
                }
            }
        }
    }
    
//    MARK: - GET DATA
    
    private func getData(){
        let url = URL(string:"https://fakestoreapi.com/products")!
        
        NetworkManager().fetchProducts(url: url) { products in
            if let products = products {
                
                self.productListViewModel = ProductListViewModel(productList: products)
                
                DispatchQueue.main.async {
                    self.collection.reloadData()
                }
            }
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
            return self.productListViewModel == nil ? 0 :
            self.productListViewModel.numberOfItemInSection()
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCell
        let productViewModel = self.productListViewModel.productAtIndex(indexPath.row)
        if let url = (URL(string: productViewModel.image)){
            cell.productImage.kf.setImage(with: url)
        }
        cell.productTitle.text = productViewModel.name
        cell.productPrice.text = String(productViewModel.price) + "₺"
        
        return cell
    }
   /* func collectionView(_ collectionView: UICollectionView, canEditItemAt indexPath: IndexPath) -> Bool {
        if searchController.isActive {
            return false
        }else {
            return true
        }
    } */
    
    
// MARK: - UITabBarDelegate
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        switch item.title {
        case "Home":
            item.badgeColor = .green
        case "Saved":
            let vc2 = SavedController().self
            vc2.modalPresentationStyle = .formSheet
            present(vc2, animated: true)
        case "Cart":
            let vc3 = CartController().self
            vc3.modalPresentationStyle = .formSheet
            present(vc3, animated: true)
        case "Settings":
            let vc4 = SettingsController().self
            vc4.modalPresentationStyle = .formSheet
            present(vc4, animated: true)
        default:
            break
        }
        
    }
//    MARK: - UISearchBarDelegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
       
        
        /* searchResults = products.filter({(product: Product) -> Bool in
            let titleMatch = product.title.range(of: searchText,options: NSString.CompareOptions.caseInsensitive)
            
            return titleMatch != nil  })*/
        
    }
    
    func updateSearchResults( for searchController: UISearchController){
        /*
        if let searchText = searchController.searchBar.text {
            
            searchBar(searchBar, textDidChange: searchText)
            collection.reloadData()
        }*/
        
    }
        
    
}
