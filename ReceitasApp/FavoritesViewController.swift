//
//  FavoritesViewController.swift
//  ReceitasApp
//
//  Created by GISELE TOLEDO on 06/07/24.
//

import UIKit

class FavoritesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var favoriteRecipes: [Recipe] = []

    override func viewDidLoad() {
        super.viewDidLoad()
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
        // Se não houver receitas favoritas, mostrar uma célula com mensagem
        return favoriteRecipes.isEmpty ? 1 : favoriteRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Se não houver receitas favoritas, mostrar a célula especial com mensagem
        if favoriteRecipes.isEmpty {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath)
            cell.textLabel?.text = "Nenhuma receita favorita encontrada."
            cell.detailTextLabel?.text = ""
            cell.imageView?.image = nil
            return cell
        } else {
            // Caso contrário, configurar a célula normalmente com as receitas favoritas
            let recipe = favoriteRecipes[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath)
            cell.textLabel?.text = recipe.name
            cell.detailTextLabel?.text = recipe.author
            cell.imageView?.image = recipe.image != nil ? UIImage(named: recipe.image!) : UIImage(named: "placeholder")
            return cell
        }
    }
}
