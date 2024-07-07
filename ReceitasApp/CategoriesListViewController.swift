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
  var categories: [Recipe.RecipeCategory: [Recipe]] = [:] // Dictionary for recipes grouped by category
  var filteredRecipes: [Recipe] = []

  override func viewDidLoad() {
    super.viewDidLoad()

    filteredRecipes = recipes
    groupRecipesByCategory()

    collectionView.dataSource = self
    collectionView.delegate = self
  }

  func groupRecipesByCategory() {
    categories = Dictionary(grouping: recipes, by: { $0.category }) // Use $0.category directly
  }
}

extension CategoriesListViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return filteredRecipes.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCellList", for: indexPath) as! RecipeCollectionViewCell

    // Check if recipe exists before accessing properties
    guard indexPath.item < filteredRecipes.count else {
      print("Erro: Índice fora dos limites em filteredRecipes")
      print(filteredRecipes)
      return cell
    }

    let recipe = filteredRecipes[indexPath.item]
    cell.recipeImageView.image = UIImage(named: recipe.image ?? "defaultImage")
    cell.recipeNameLabel.text = recipe.name

    return cell
  }
}

extension CategoriesListViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard indexPath.item < filteredRecipes.count else {
      print("Erro: Índice fora dos limites em filteredRecipes")
      print(filteredRecipes)
      return
    }

    let selectedRecipe = filteredRecipes[indexPath.item]

    // Navigate to DetailsRecipeViewController
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    if let detailsVC = storyboard.instantiateViewController(withIdentifier: "DetailsRecipeViewController") as? DetailsRecipeViewController {
      detailsVC.recipe = selectedRecipe
      navigationController?.pushViewController(detailsVC, animated: true)
    }
  }
}
