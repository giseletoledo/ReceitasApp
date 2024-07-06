//
//  CategoryViewController.swift
//  ReceitasApp
//
//  Created by GISELE TOLEDO on 06/07/24.
//

import UIKit

class CategoriesViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    var categories: [String: [Recipe]] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        groupRecipesByCategory()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    func groupRecipesByCategory() {
        categories = Dictionary(grouping: recipes, by: { $0.category })
    }
}

extension CategoriesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categories.keys.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let category = Array(categories.keys)[section]
        return categories[category]?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
        let category = Array(categories.keys)[indexPath.section]
        let recipe = categories[category]?[indexPath.item]
        cell.imageView.image = UIImage(named: recipe?.image ?? "")
        cell.label.text = recipe?.name
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = Array(categories.keys)[indexPath.section]
        let selectedRecipes = categories[category] ?? []

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let recipeListVC = storyboard.instantiateViewController(withIdentifier: "RecipeListViewController") as? RecipeListViewController {
            recipeListVC.recipes = selectedRecipes
            navigationController?.pushViewController(recipeListVC, animated: true)
        }
    }
}
