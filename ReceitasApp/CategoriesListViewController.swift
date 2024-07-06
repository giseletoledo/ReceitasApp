//
//  CategoriesListViewController.swift
//  ReceitasApp
//
//  Created by GISELE TOLEDO on 06/07/24.
//

import UIKit

class CategoriesListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var recipes: [Recipe] = []
    var categories: [String: [Recipe]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Group recipes by category
        groupRecipesByCategory()
        
        // Set up collection view
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func groupRecipesByCategory() {
        categories = Dictionary(grouping: recipes, by: { $0.category })
    }
}

extension CategoriesListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.keys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
        
        // Configure the cell with category image
        let category = Array(categories.keys)[indexPath.item]
        if let firstRecipe = categories[category]?.first {
            cell.imageView.image = UIImage(named: firstRecipe.image ?? "defaultImage")
        }
        
        return cell
    }
}

extension CategoriesListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = Array(categories.keys)[indexPath.item]
        let selectedRecipes = categories[category] ?? []
        
        // Navigate to RecipeListViewController (assumed already configured)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let recipeListVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            recipeListVC.filteredRecipes = selectedRecipes
            navigationController?.pushViewController(recipeListVC, animated: true)
        }
    }
}

