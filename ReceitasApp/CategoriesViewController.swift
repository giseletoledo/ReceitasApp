//
//  CategoryViewController.swift
//  ReceitasApp
//
//  Created by GISELE TOLEDO on 06/07/24.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var categories: [Category] = [
        Category(name: "Dessert", image: "bolo.jpg"),
        Category(name: "Snack", image: "coxinha.jpg"),
        Category(name: "Main Course", image: "hamburguer.jpg")
    ]

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
        cell.imageView.image = UIImage(named: category.image ?? "defaultImage")
        cell.categoryNameLabel.text = category.name
        cell.layer.cornerRadius = 8
        
        return cell
    }
}
