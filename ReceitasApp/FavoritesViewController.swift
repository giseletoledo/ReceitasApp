//
//  FavoritesViewController.swift
//  ReceitasApp
//
//  Created by GISELE TOLEDO on 06/07/24.
//

import UIKit

class FavoritesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var titleLabel: UILabel!
    
    var favoriteRecipes: [Recipe] = []

        override func viewDidLoad() {
            super.viewDidLoad()
            favoriteRecipes = recipes
            tableView.dataSource = self
            tableView.delegate = self
            loadFavorites()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            loadFavorites()
        }
        
        func loadFavorites() {
            favoriteRecipes = recipes.filter { UserDefaults.standard.bool(forKey: "FavoriteRecipe-\( $0.name)") }
            tableView.reloadData()
        }
}

    extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return favoriteRecipes.isEmpty ? 1 : favoriteRecipes.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if favoriteRecipes.isEmpty {
                let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath)
                cell.textLabel?.text = "Nenhuma receita favorita encontrada."
                return cell
            } else {
                let recipe = favoriteRecipes[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath)
                cell.textLabel?.text = recipe.name
                cell.textLabel?.lineBreakMode = .byWordWrapping
                cell.detailTextLabel?.text = recipe.author
                cell.imageView?.image = recipe.image != nil ? UIImage(named: recipe.image!) : UIImage(named: "defaultImage")
                
                return cell
            }
        }
    }

extension FavoritesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            favoriteRecipes = recipes
        } else {
            favoriteRecipes = favoriteRecipes.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        tableView.reloadData()
    }
}

