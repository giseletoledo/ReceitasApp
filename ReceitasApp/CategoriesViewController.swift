//
//  CategoryViewController.swift
//  ReceitasApp
//
//  Created by GISELE TOLEDO on 06/07/24.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        collectionView.reloadData()
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension CategoriesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
        
        let category = categories[indexPath.row]
        cell.imageView.image = UIImage(named: category.imageName)
        cell.categoryNameLabel.text = category.rawValue
        cell.layer.cornerRadius = 8
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = categories[indexPath.item]
        
        // Navigate to CategoriesListViewController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let categoriesListVC = storyboard.instantiateViewController(withIdentifier: "CategoriesListViewController") as? CategoriesListViewController {
            categoriesListVC.recipes = recipes.filter { $0.category == category }
            categoriesListVC.title = category.rawValue
            categoriesListVC.navigationItem.backButtonTitle = "Categories" // Custom back button title
            navigationController?.pushViewController(categoriesListVC, animated: true)
        }
    }
}
